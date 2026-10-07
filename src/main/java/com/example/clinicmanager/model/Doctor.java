package com.example.clinicmanager.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
@Table(name = "doctors")
public class Doctor extends User {

    private String matricule;
    private String title;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "specialty_id")
    private Speciality specialty;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id")
    private Department department;

    protected Doctor(){
    }

    public Doctor(UUID id,String firstName, String lastName, String email, String phone, String passwordHash, String salt, String matricule, String title, Speciality specialty, Department department) {
        super(id, firstName, lastName, email, phone, passwordHash, salt);
        this.matricule = matricule;
        this.title = title;
        this.specialty = specialty;
        this.department = department;
    }

    public Speciality getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Speciality specialty) {
        this.specialty = specialty;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

}
