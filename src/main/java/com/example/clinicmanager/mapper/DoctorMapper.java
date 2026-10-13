package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.DoctorDTO;
import com.example.clinicmanager.model.Doctor;

public class DoctorMapper {

    public static DoctorDTO toDto(Doctor doctor){
        DoctorDTO dto = new DoctorDTO(doctor.getId(),doctor.getFirstName(), doctor.getLastName(), doctor.getEmail(), doctor.getPhone(), doctor.getMatricule(), doctor.getTitle(),doctor.getSpecialty().getId(),doctor.getSpecialty().getName(),doctor.getDepartment().getId(),doctor.getDepartment().getName());

        return dto;
    }
}
