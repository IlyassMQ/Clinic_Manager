package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Absence;
import com.example.clinicmanager.repository.AbsenceRepository;
import jakarta.persistence.EntityManager;
import org.eclipse.tags.shaded.org.apache.bcel.generic.Select;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class ImplAbsenceRepository implements AbsenceRepository {
    private final EntityManager em;

    public ImplAbsenceRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Absence absence) {
        em.getTransaction().begin();
        try {
            em.persist(absence);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public void update(Absence absence) {
        em.getTransaction().begin();
        try {
            em.merge(absence);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public void delete(Absence absence) {
        em.getTransaction().begin();
        try {
            em.remove(absence);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Absence> findById(int id) {
        return Optional.ofNullable(em.find(Absence.class,id));
    }

    @Override
    public List<Absence> findByDoctorId(UUID doctorId) {
        return em.createQuery("select a from Absence a where doctor.id =:id", Absence.class)
                .setParameter("id",doctorId).getResultList();
    }

    @Override
    public List<Absence> findAll() {
        return em.createQuery("Select a from Absence a", Absence.class).getResultList();
    }
}
