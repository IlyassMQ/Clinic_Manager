package com.example.clinicmanager.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

public class MedicalNoteDTO {
    private int id;

    private UUID doctorId;
    private String doctorName;

    private UUID appointmentId;

    private UUID patientId;
    private String patientName;

    private String diagnostic;
    private String content;

    private LocalDateTime date;

    private boolean validated;

    public MedicalNoteDTO(int id, UUID doctorId, String doctorName, UUID appointmentId, UUID patientId, String patientName, String diagnostic, String content, LocalDateTime date, boolean validated) {
        this.id = id;
        this.doctorId = doctorId;
        this.doctorName = doctorName;
        this.appointmentId = appointmentId;
        this.patientId = patientId;
        this.patientName = patientName;
        this.diagnostic = diagnostic;
        this.content = content;
        this.date = date;
        this.validated = validated;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UUID getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(UUID doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public UUID getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(UUID appointmentId) {
        this.appointmentId = appointmentId;
    }

    public UUID getPatientId() {
        return patientId;
    }

    public void setPatientId(UUID patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public boolean isValidated() {
        return validated;
    }

    public void setValidated(boolean validated) {
        this.validated = validated;
    }
}
