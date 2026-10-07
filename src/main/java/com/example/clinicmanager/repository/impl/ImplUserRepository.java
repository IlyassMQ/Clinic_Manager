package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.model.User;
import com.example.clinicmanager.repository.UserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.Optional;
import java.util.UUID;

public class ImplUserRepository implements UserRepository {

        private final EntityManager em;

        public ImplUserRepository(EntityManager em){
            this.em = em;
        }

    @Override
    public void save(User user) {
    em.getTransaction().begin();
        try {
            em.persist(user);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<User> findById(UUID id) {
         User userFound = em.find(User.class,id);
         Optional<User> user= Optional.ofNullable(userFound);
         return user;
    }

    @Override
    public Optional<User> findByEmail(String email) {
            User userFound = em.createQuery("SELECT u from User u where u.email = :email",User.class)
                    .setParameter("email",email).getSingleResultOrNull();
            return Optional.ofNullable(userFound);
    }

    @Override
    public void delete(User user) {
        em.getTransaction().begin();
        try {
            em.remove(user);
            em.getTransaction().commit();
        }catch (Exception e){
            em.getTransaction().rollback();
        }
    }

    @Override
    public void update(Patient patient) {

        em.getTransaction().begin();

        try {
            em.merge(patient);
            em.getTransaction().commit();

        } catch (Exception e) {
                em.getTransaction().rollback();
            throw e;
        }
    }
}
