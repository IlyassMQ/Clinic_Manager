package com.example.clinicmanager.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "medical_notes")
public class MedicalNote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    @JoinColumn(name = "appointment_id")
    private Appointment appointment;


    private String diagnosis;
    private String content;
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    private boolean validated;
    @Column(name = "validated_at")
    private LocalDateTime validatedAt;

    protected MedicalNote(){
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isValidated() {
        return validated;
    }

    public void setValidated(boolean validated) {
        this.validated = validated;
    }

    public LocalDateTime getValidatedAt() {
        return validatedAt;
    }

    public void setValidatedAt(LocalDateTime validatedAt) {
        this.validatedAt = validatedAt;
    }

    public MedicalNote(Appointment appointment, String diagnosis, String content, LocalDateTime createdAt, boolean validated, LocalDateTime validatedAt) {
        this.appointment = appointment;
        this.diagnosis = diagnosis;
        this.content = content;
        this.createdAt = createdAt;
        this.validated = validated;
        this.validatedAt = validatedAt;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

}
