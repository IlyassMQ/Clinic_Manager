package com.example.clinicmanager.exceptions;

public class InvalidCredentialsException extends Exception{

    public InvalidCredentialsException(String message){
        super(message);
    }
    public InvalidCredentialsException(){
        super("Email ou Mot de passe Incorrect");
    }
}
