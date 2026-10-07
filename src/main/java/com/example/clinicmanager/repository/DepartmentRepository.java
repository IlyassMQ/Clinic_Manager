package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Department;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository {

    void save(Department department);
    void update(Department department);
    void delete(Department department);
    Optional<Department> findById(int id);
    List<Department> findAll();
}
