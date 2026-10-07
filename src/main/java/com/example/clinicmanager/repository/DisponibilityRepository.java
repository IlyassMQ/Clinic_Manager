package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Disponiblity;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DisponibilityRepository {

    void save(Disponiblity disponiblity);

    Optional<Disponiblity> findById(int id);

    List<Disponiblity> findAll();

    List<Disponiblity> findByDoctorId(UUID doctorId);

    void update(Disponiblity disponiblity);

    void delete(Disponiblity disponiblity);
}
