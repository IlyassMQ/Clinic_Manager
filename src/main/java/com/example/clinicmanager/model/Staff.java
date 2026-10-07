package com.example.clinicmanager.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

import java.util.UUID;

@Entity
@Table(name = "staff")
public class Staff extends User{

    public Staff(){
    }

    public Staff(UUID id ,String firstName, String lastName, String email, String phone, String passwordHash, String salt) {
        super(id, firstName, lastName, email, phone, passwordHash, salt);
    }

}
