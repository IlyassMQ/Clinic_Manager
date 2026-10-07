package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.repository.DoctorRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ImplDoctorRepository implements DoctorRepository {

    private final EntityManager em;

    public ImplDoctorRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Doctor doctor) {

        em.getTransaction().begin();

        try {
            em.persist(doctor);
            em.getTransaction().commit();

        } catch (Exception e) {
                em.getTransaction().rollback();

        }
    }

    @Override
    public Optional<Doctor> findById(UUID id) {

        Doctor doctorFound = em.find(Doctor.class, id);

        return Optional.ofNullable(doctorFound);
    }

    @Override
    public List<Doctor> findAll() {
        return em.createQuery("SELECT d FROM Doctor d", Doctor.class).getResultList();
    }

    @Override
    public void update(Doctor doctor) {

        em.getTransaction().begin();

        try {
            em.merge(doctor);
            em.getTransaction().commit();

        } catch (Exception e) {
                em.getTransaction().rollback();

        }
    }

    @Override
    public void delete(Doctor doctor) {

        em.getTransaction().begin();

        try {
            em.remove(doctor);
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();

        }
    }
}