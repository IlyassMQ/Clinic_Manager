package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Speciality;
import com.example.clinicmanager.repository.SpecialityRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class ImplSpecialityRepository implements SpecialityRepository {

    private final EntityManager em;

    public ImplSpecialityRepository(EntityManager em){
        this.em = em;
    }


    @Override
    public void save(Speciality speciality) {
        em.getTransaction().begin();
        try {
            em.persist(speciality);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    @Override
    public void update(Speciality speciality) {
        em.getTransaction().begin();
        try {
            em.merge(speciality);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    @Override
    public void delete(Speciality speciality) {
        em.getTransaction().begin();
        try {
            em.remove(speciality);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Speciality> findById(int id) {
        Speciality specialityFound = em.find(Speciality.class,id);
        Optional<Speciality> speciality = Optional.ofNullable(specialityFound);
        return speciality;
    }

    @Override
    public List<Speciality> findAll() {
        List<Speciality> specialityList=  em.createQuery("select s from Speciality s", Speciality.class).getResultList();
        return specialityList;
    }
}
