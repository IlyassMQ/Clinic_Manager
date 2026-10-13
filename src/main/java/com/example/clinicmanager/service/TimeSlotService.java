package com.example.clinicmanager.service;

import com.example.clinicmanager.model.*;
import com.example.clinicmanager.model.enums.AppointmentStatus;
import com.example.clinicmanager.repository.*;

import java.time.*;
import java.util.*;

public class TimeSlotService {

    private final DisponibilityRepository disponibilityRepository;
    private final AbsenceRepository absenceRepository;
    private final AppointmentRepository appointmentRepository;

    public TimeSlotService(
            DisponibilityRepository disponibilityRepository,
            AbsenceRepository absenceRepository,
            AppointmentRepository appointmentRepository) {

        this.disponibilityRepository = disponibilityRepository;
        this.absenceRepository = absenceRepository;
        this.appointmentRepository = appointmentRepository;
    }

    public List<LocalTime> getAvailableSlots(
            UUID doctorId, LocalDate date) {

        List<LocalTime> slots = new ArrayList<>();

        // 1. Sunday is closed.
        if (date.getDayOfWeek() == DayOfWeek.SUNDAY) {
            return slots;
        }

        // 2. Check whether the doctor is absent.
        List<Absence> absences = absenceRepository.findByDoctorId(doctorId);

        for (Absence absence : absences) {
            if (!date.isBefore(absence.getStartDate())
                    && !date.isAfter(absence.getEndDate())) {
                return slots;
            }
        }

        // 3. Get the doctor's schedule and existing appointments.
        List<Disponibility> disponibilities = disponibilityRepository.findByDoctorId(doctorId);

        List<Appointment> appointments =  appointmentRepository.findByDoctorId(doctorId);

        // 4. Generate 30-minute slots.
        for (Disponibility d : disponibilities) {

            if (!date.getDayOfWeek().name()
                    .equalsIgnoreCase(String.valueOf(d.getDayOfWeek()))) {
                continue;
            }

            if (date.isBefore(d.getValidFrom()) || date.isAfter(d.getValidUntil())) {
                continue;
            }

            LocalTime time = d.getStartTime();

            while (!time.plusMinutes(30).isAfter(d.getEndTime())) {

                LocalTime end = time.plusMinutes(30);

                boolean available = true;

                // At least two hours' notice.
                if (LocalDateTime.of(date, time)
                        .isBefore(LocalDateTime.now().plusHours(2))) {
                    available = false;
                }

                // No appointments during lunch, 12:00–13:00.
                if (time.isBefore(LocalTime.of(13, 0))
                        && end.isAfter(LocalTime.of(12, 0))) {
                    available = false;
                }

                // No overlapping appointments.
                for (Appointment a : appointments) {

                    if (!a.getAppointmentDate().equals(date)) {
                        continue;
                    }

                    if (a.getStatus() == AppointmentStatus.CANCELED) {
                        continue;
                    }

                    if (time.isBefore(a.getEndTime())
                            && end.isAfter(a.getStartTime())) {
                        available = false;
                        break;
                    }
                }

                if (available && !slots.contains(time)) {
                    slots.add(time);
                }

                time = time.plusMinutes(30);
            }
        }

        Collections.sort(slots);

        return slots;
    }

    public boolean isAvailable(
            UUID doctorId, LocalDate date, LocalTime time) {

        return getAvailableSlots(doctorId, date).contains(time);
    }
}