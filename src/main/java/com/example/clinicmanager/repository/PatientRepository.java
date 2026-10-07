package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Patient;

import java.util.Optional;
import java.util.UUID;

public interface PatientRepository {

    Optional<Patient> findById(UUID id);
    Patient update(Patient patient);
}
