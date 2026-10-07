package com.example.clinicmanager.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "patients")
public class Patient extends User{


    private String cin;
    @Column(name = "birth_date")
    private LocalDate birthDate;
    private String gender;
    private String address;

    protected Patient(){
    }

    public Patient(UUID id,String firstName, String lastName, String email, String phone, String passwordHash, String salt, String cin, LocalDate birthDate, String gender, String address) {
        super(id, firstName, lastName, email, phone, passwordHash, salt);
        this.cin = cin;
        this.birthDate = birthDate;
        this.gender = gender;
        this.address = address;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
