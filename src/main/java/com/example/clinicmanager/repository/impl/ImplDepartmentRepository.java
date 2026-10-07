package com.example.clinicmanager.repository.impl;

import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.repository.DepartmentRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class ImplDepartmentRepository implements DepartmentRepository {

       private final EntityManager em;

    public ImplDepartmentRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public void save(Department department) {
        em.getTransaction().begin();
        try {
            em.persist(department);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }

    }

    @Override
    public void update(Department department) {
        em.getTransaction().begin();
        try {
            em.merge(department);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    @Override
    public void delete(Department department) {
        em.getTransaction().begin();
        try {
            em.remove(department);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
        }
    }

    @Override
    public Optional<Department> findById(int id) {
        Department departmentFound = em.find(Department.class,id);
        Optional<Department> department = Optional.ofNullable(departmentFound);
        return department;
    }

    @Override
    public List<Department> findAll(){
        List<Department> departmentList=  em.createQuery("select d from Department d", Department.class).getResultList();
        return departmentList;
    }
}
