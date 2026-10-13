package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Appointment;
import com.example.clinicmanager.repository.AppointmentRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ImplAppointmentRepository implements AppointmentRepository {

    private final EntityManager em;

    public ImplAppointmentRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Appointment appointment) {
        em.getTransaction().begin();

        try {
            em.persist(appointment);
            em.getTransaction().commit();
        } catch (RuntimeException e) {
                em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Appointment> findById(UUID id) {
        return Optional.ofNullable(em.find(Appointment.class, id));
    }

    @Override
    public List<Appointment> findAll() {
        return em.createQuery("SELECT a FROM Appointment a", Appointment.class).getResultList();
    }

    @Override
    public List<Appointment> findByPatientId(UUID patientId) {
        return em.createQuery("SELECT a FROM Appointment a WHERE a.patient.id = :patientId", Appointment.class).setParameter("patientId", patientId).getResultList();
    }

    @Override
    public List<Appointment> findByDoctorId(UUID doctorId) {
        return em.createQuery("SELECT a FROM Appointment a WHERE a.doctor.id = :doctorId", Appointment.class).setParameter("doctorId", doctorId).getResultList();
    }
}