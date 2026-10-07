package com.example.clinicmanager.exceptions;

public class PatientNotFoundException extends RuntimeException {
    public PatientNotFoundException(String message) {
        super(message);
    }

    public PatientNotFoundException(){
        super("Patient Not Found");
    }
}
