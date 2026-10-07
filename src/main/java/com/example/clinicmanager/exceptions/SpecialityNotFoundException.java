package com.example.clinicmanager.exceptions;

public class SpecialityNotFoundException extends RuntimeException {
    public SpecialityNotFoundException(String message) {
        super(message);
    }
    public SpecialityNotFoundException(){
        super("Speciality not Found Exception");
    }
}
