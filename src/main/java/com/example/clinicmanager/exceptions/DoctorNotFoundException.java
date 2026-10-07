package com.example.clinicmanager.exceptions;

public class DoctorNotFoundException extends RuntimeException {
    public DoctorNotFoundException(String message) {
        super(message);
    }

    public DoctorNotFoundException(){
        super("Doctor Not Found");
    }
}
