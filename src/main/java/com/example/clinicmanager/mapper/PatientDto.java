package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.PatientDTO;
import com.example.clinicmanager.model.Patient;

public class PatientDto {

    public static PatientDTO toDto(Patient patient){
        PatientDTO dto = new PatientDTO(patient.getId(),patient.getFirstName(),patient.getLastName(),patient.getEmail(),patient.getPhone(),patient.getCin(),patient.getBirthDate(),patient.getGender(),patient.getAddress());
        return dto;
    }
}
