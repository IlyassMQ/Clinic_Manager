package com.example.clinicmanager.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;



import java.util.UUID;

@Entity
@Table(name = "admins")
public class Admin extends User{


    protected Admin() {
    }

    public Admin(UUID id ,String firstName, String lastName, String email, String phone, String passwordHash, String salt) {
        super(id, firstName, lastName, email, phone, passwordHash, salt);
    }



}
