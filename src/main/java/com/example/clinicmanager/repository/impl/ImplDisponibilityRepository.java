package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Disponiblity;
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
    public void save(Disponiblity disponiblity) {
        em.getTransaction().begin();
        try {
            em.persist(disponiblity);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Disponiblity> findById(int id) {
        Optional<Disponiblity> disponibilie = Optional.ofNullable(em.find(Disponiblity.class,id));
        return disponibilie;
    }

    @Override
    public List<Disponiblity> findAll() {

        return List.of();
    }

    @Override
    public List<Disponiblity> findByDoctorId(UUID doctorId) {
        return List.of();
    }

    @Override
    public void update(Disponiblity disponiblity) {

    }

    @Override
    public void delete(Disponiblity disponiblity) {

    }
}
