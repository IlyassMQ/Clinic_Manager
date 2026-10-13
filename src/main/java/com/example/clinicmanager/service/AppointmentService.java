package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.AppointmentDTO;
import com.example.clinicmanager.exceptions.*;
import com.example.clinicmanager.mapper.AppointmentMapper;
import com.example.clinicmanager.model.*;
import com.example.clinicmanager.model.enums.AppointmentStatus;
import com.example.clinicmanager.model.enums.AppointmentType;
import com.example.clinicmanager.repository.*;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class AppointmentService {

    private final AppointmentRepository appointmentRepository;
    private final PatientRepository patientRepository;
    private final DoctorRepository doctorRepository;
    private final DisponibilityRepository disponibilityRepository;
    private final AbsenceRepository absenceRepository;

    public AppointmentService(AppointmentRepository appointmentRepository, PatientRepository patientRepository, DoctorRepository doctorRepository, DisponibilityRepository disponibilityRepository, AbsenceRepository absenceRepository) {

        this.appointmentRepository = appointmentRepository;
        this.patientRepository = patientRepository;
        this.doctorRepository = doctorRepository;
        this.disponibilityRepository = disponibilityRepository;
        this.absenceRepository = absenceRepository;
    }

    public void create(UUID patientId, UUID doctorId, LocalDate appointmentDate, LocalTime startTime, AppointmentType type, String reason) {


        LocalTime endTime = startTime.plusMinutes(30);

        LocalDateTime appointmentStart =
                LocalDateTime.of(appointmentDate, startTime);

        if (appointmentStart.isBefore(LocalDateTime.now().plusHours(2))) {
            throw new UnavailableAppointmentException();
        }

        Optional<Patient> patientOptional = patientRepository.findById(patientId);

        if (patientOptional.isEmpty()) {
            throw new UserNotFoundException();
        }

        Optional<Doctor> doctorOptional = doctorRepository.findById(doctorId);

        if (doctorOptional.isEmpty()) {
            throw new DoctorNotFoundException();
        }

        Patient patient = patientOptional.get();
        Doctor doctor = doctorOptional.get();


        Disponibility selectedDisponibility = null;
        List<Disponibility> disponibilities = disponibilityRepository.findByDoctorId(doctorId);

        for (Disponibility d : disponibilities) {

            boolean correctDay = appointmentDate.getDayOfWeek().name()
                            .equalsIgnoreCase(
                                    String.valueOf(d.getDayOfWeek())
                            );

            boolean correctDate = !appointmentDate.isBefore(d.getValidFrom()) &&
                    !appointmentDate.isAfter(d.getValidUntil());

            boolean insideWorkingHours =
                    !startTime.isBefore(d.getStartTime())
                            && !endTime.isAfter(d.getEndTime());

            if (correctDay && correctDate && insideWorkingHours) {
                selectedDisponibility = d;
                break;
            }
        }

        if (selectedDisponibility == null) {
            throw new UnavailableAppointmentException();
        }

        List<Absence> absences = absenceRepository.findByDoctorId(doctorId);

        for (Absence absence : absences) {

            boolean absentOnDate =
                    !appointmentDate.isBefore(absence.getStartDate())
                            && !appointmentDate.isAfter(absence.getEndDate());

            if (absentOnDate) {
                throw new UnavailableAppointmentException();
            }
        }

        List<Appointment> doctorAppointments = appointmentRepository.findByDoctorId(doctorId);

        for (Appointment existing : doctorAppointments) {

            if (existing.getStatus() == AppointmentStatus.CANCELED) {
                continue;
            }

            if (!appointmentDate.equals(existing.getAppointmentDate())) {
                continue;
            }

            boolean overlapping = startTime.isBefore(existing.getEndTime())
                            && endTime.isAfter(existing.getStartTime());

            if (overlapping) {
                throw new UnavailableAppointmentException();
            }
        }

        List<Appointment> patientAppointments = appointmentRepository.findByPatientId(patientId);

        for (Appointment existing : patientAppointments) {

            if (existing.getStatus() == AppointmentStatus.CANCELED) {
                continue;
            }

            if (!appointmentDate.equals(existing.getAppointmentDate())) {
                continue;
            }

            boolean overTime = startTime.isBefore(existing.getEndTime())
                            && endTime.isAfter(existing.getStartTime());

            if (overTime) {
                throw new UnavailableAppointmentException();
            }
        }

        Appointment appointment = new Appointment(
                UUID.randomUUID(),
                patient,
                doctor,
                selectedDisponibility,
                appointmentDate,
                startTime,
                endTime,
                type,
                reason,
                AppointmentStatus.PLANNED,
                LocalDateTime.now()

        );

        appointmentRepository.save(appointment);
    }

    public List<AppointmentDTO> getByPatient(UUID patientId) {

        List<Appointment> appointments = appointmentRepository.findByPatientId(patientId);

        List<AppointmentDTO> appointmentDTOs = new ArrayList<>();

        for (Appointment appointment : appointments) {
            appointmentDTOs.add(
                    AppointmentMapper.toDto(appointment)
            );
        }

        return appointmentDTOs;
    }
}