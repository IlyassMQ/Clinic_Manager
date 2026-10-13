package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.AbsenceDto;
import com.example.clinicmanager.model.Absence;

public class AbsenceMapper {

    public static AbsenceDto toDto(Absence absence){
        AbsenceDto dto = new AbsenceDto(absence.getStartDate(),absence.getEndDate(), absence.getReason());
        return dto;
    }
}
