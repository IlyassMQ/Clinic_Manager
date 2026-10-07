package com.example.clinicmanager.repository;

import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.model.User;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository {
    Optional<User> findById(UUID id);

    Optional<User> findByEmail(String email);

    void save(User user);

    void delete(User user);
    void update(Patient patient);
}
