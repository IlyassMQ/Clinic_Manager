package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Disponibility;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DisponibilityRepository {

    void save(Disponibility disponibility);

    Optional<Disponibility> findById(int id);

    List<Disponibility> findAll();

    List<Disponibility> findByDoctorId(UUID doctorId);

    void update(Disponibility disponibility);

    void delete(Disponibility disponibility);
}
