package com.example.clinicmanager.exceptions;

public class DepartmentNotFound extends RuntimeException {
    public DepartmentNotFound(String message) {
        super(message);
    }

    public DepartmentNotFound(){
        super("Department Not Found");
    }
}
