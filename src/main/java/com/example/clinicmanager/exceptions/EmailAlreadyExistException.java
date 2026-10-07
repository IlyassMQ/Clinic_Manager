package com.example.clinicmanager.exceptions;

public class EmailAlreadyExistException extends RuntimeException {
    public EmailAlreadyExistException(String message) {
        super(message);
    }

    public EmailAlreadyExistException(){
        super("Email already Exist");
    }
}
