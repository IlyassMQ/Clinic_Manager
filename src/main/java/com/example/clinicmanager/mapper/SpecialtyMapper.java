package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.SpecialtyDTO;
import com.example.clinicmanager.model.Speciality;

public class SpecialtyMapper {

    public static SpecialtyDTO toDto(Speciality speciality){
        SpecialtyDTO dto = new SpecialtyDTO(speciality.getId(), speciality.getName(),speciality.getDepartment().getName(), speciality.getDepartment().getId());
        return dto;
    }
}
