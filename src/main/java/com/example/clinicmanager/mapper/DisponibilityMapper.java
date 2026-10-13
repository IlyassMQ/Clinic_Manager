package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.DisponibilityDTO;
import com.example.clinicmanager.model.Disponibility;

public class DisponibilityMapper {


    public static DisponibilityDTO toDto(Disponibility disponibility) {

        DisponibilityDTO dto = new DisponibilityDTO(disponibility.getId(), disponibility.getDoctor().getId(), disponibility.getDoctor().getFirstName() + " " + disponibility.getDoctor().getLastName(), disponibility.getDayOfWeek(), disponibility.getStartTime(), disponibility.getEndTime(), disponibility.getValidFrom(), disponibility.getValidUntil());

        return dto;
    }
}
