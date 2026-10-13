package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Disponibility;
import com.example.clinicmanager.repository.DisponibilityRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ImplDisponibilityRepository implements DisponibilityRepository {

       private final EntityManager em;

    public ImplDisponibilityRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Disponibility disponibility) {
        em.getTransaction().begin();
        try {
            em.persist(disponibility);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Disponibility> findById(int id) {
        Optional<Disponibility> disponibility = Optional.ofNullable(em.find(Disponibility.class,id));
        return disponibility;
    }

    @Override
    public List<Disponibility> findAll() {
          return em.createQuery("SELECT d from Disponibility d", Disponibility.class).getResultList();
    }

    @Override
    public List<Disponibility> findByDoctorId(UUID doctorId) {
            return em.createQuery("SELECT d FROM Disponibility d WHERE d.doctor.id = :doctorId", Disponibility.class)
                    .setParameter("doctorId", doctorId).getResultList();
    }

    @Override
    public void update(Disponibility disponibility) {
        em.getTransaction().begin();
        try {
            em.merge(disponibility);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public void delete(Disponibility disponibility) {
        em.getTransaction().begin();
        try {
            em.remove(disponibility);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }
}
