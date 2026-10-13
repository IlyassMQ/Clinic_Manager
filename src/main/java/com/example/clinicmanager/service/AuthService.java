package com.example.clinicmanager.service;

import com.example.clinicmanager.exceptions.EmailAlreadyExistException;
import com.example.clinicmanager.exceptions.InvalidCredentialsException;
import com.example.clinicmanager.exceptions.UserNotFoundException;
import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.model.User;
import com.example.clinicmanager.repository.UserRepository;
import com.example.clinicmanager.util.PasswordHash;
import com.example.clinicmanager.util.ValidationUtil;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.Optional;
import java.util.UUID;

import static com.example.clinicmanager.util.PasswordHash.hashPassword;

public class AuthService {

    private final UserRepository userRepository;

    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void register(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            String cin,
            LocalDate birthDate,
            String gender,
            String address
    ) throws NoSuchAlgorithmException {

        Optional<User> existingUser = userRepository.findByEmail(email);

        if (existingUser.isPresent()) {
            throw new EmailAlreadyExistException();
        }else if (ValidationUtil.emailVerfication(email) && ValidationUtil.passwordVerfication(password) && ValidationUtil.phoneVerfication(phone)){
        byte[] saltByte = PasswordHash.salt();
        String salt = Base64.getEncoder().encodeToString(saltByte); //convert Byte to string
        String hashedPassword = PasswordHash.hashPassword(password,saltByte);

        Patient patient = new Patient(
                UUID.randomUUID(),
                firstName,
                lastName,
                email,
                phone,
                hashedPassword,
                salt,
                cin,
                birthDate,
                gender,
                address
        );

        userRepository.save(patient);

        }
    }
    public User login(String email, String password) throws NoSuchAlgorithmException, InvalidCredentialsException {

        Optional<User> userFound = userRepository.findByEmail(email);

        if (userFound.isEmpty()) {
            throw new UserNotFoundException();
        }

        User user = userFound.get();
        byte[] saltByte = Base64.getDecoder().decode(user.getSalt());//convert from string bas64 to byte
        String hashedPassword = hashPassword(password,saltByte);
        if (!user.getPasswordHash().equals(hashedPassword)) {
            throw new InvalidCredentialsException();
        }
        return user;
    }

    public void update(String firstName,
                       String lastName,
                       String email,
                       String phone,
                       String password,
                       String cin,
                       LocalDate birthDate,
                       String gender,
                       String address){

        
    }

}