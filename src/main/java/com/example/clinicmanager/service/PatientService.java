package com.example.clinicmanager.service;

import com.example.clinicmanager.exceptions.UserNotFoundException;
import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.repository.PatientRepository;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

public class PatientService {
    
    private final PatientRepository patientRepository;

    public PatientService(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    public Patient updateProfile(UUID id, String firstName, String lastName, String phone, LocalDate birthDate, String gender, String address) {

        Optional<Patient> patientOP = patientRepository.findById(id);
        if (patientOP.isEmpty()){
            throw new UserNotFoundException();
        }
        Patient patient = patientOP.get();

        patient.setFirstName(firstName);
        patient.setLastName(lastName);
        patient.setPhone(phone);
        patient.setBirthDate(birthDate);
        patient.setGender(gender);
        patient.setAddress(address);

        return patientRepository.update(patient);
    }
}
