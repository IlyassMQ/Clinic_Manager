package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Absence;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AbsenceRepository {

    void save(Absence absence);
    void update(Absence absence);
    void delete(Absence absence);
    Optional<Absence> findById(int id);
    List<Absence> findByDoctorId(UUID id);
    List<Absence> findAll();
}
