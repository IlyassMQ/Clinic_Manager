package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Doctor;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DoctorRepository {


    void save(Doctor doctor);

    Optional<Doctor> findById(UUID id);

    List<Doctor> findAll();

    void update(Doctor doctor);

    void delete(Doctor doctor);

}
