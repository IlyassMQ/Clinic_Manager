package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.repository.PatientRepository;
import jakarta.persistence.EntityManager;

import java.util.Optional;
import java.util.UUID;

public class ImplPatientRepository implements PatientRepository {

    private EntityManager em;

    public ImplPatientRepository(EntityManager em) {
        this.em = em;
    }
    @Override
    public Optional<Patient> findById(UUID id) {
        Patient userFound = em.find(Patient.class,id);
        Optional<Patient> Patient= Optional.ofNullable(userFound);
        return Patient;
    }

    @Override
    public Patient update(Patient patient) {
        em.getTransaction().begin();
        try {
            em.merge(patient);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
        return patient;
    }
}
