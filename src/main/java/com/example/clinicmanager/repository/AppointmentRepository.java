package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Appointment;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AppointmentRepository {

    void save(Appointment appointment);

    Optional<Appointment> findById(UUID id);

    List<Appointment> findAll();

    List<Appointment> findByPatientId(UUID patientId);

    List<Appointment> findByDoctorId(UUID doctorId);
}