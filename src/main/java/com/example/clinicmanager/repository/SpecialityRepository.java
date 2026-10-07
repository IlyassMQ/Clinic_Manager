package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Speciality;

import java.util.List;
import java.util.Optional;

public interface SpecialityRepository {


    void save(Speciality speciality);
    void update(Speciality speciality);
    void delete(Speciality speciality);
    Optional<Speciality> findById(int id);
    List<Speciality> findAll();
}
