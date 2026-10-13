package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.MedicalNoteDTO;
import com.example.clinicmanager.model.MedicalNote;

public class MedicalNoteMapper {

    public static MedicalNoteDTO toDto(MedicalNote medicalNote){
       MedicalNoteDTO dto = new MedicalNoteDTO(medicalNote.getId(),medicalNote.getAppointment().getDoctor().getId(),medicalNote.getAppointment().getDoctor().getFirstName() + " " + medicalNote.getAppointment().getDoctor().getLastName(),medicalNote.getAppointment().getId(),medicalNote.getAppointment().getPatient().getId(),medicalNote.getAppointment().getPatient().getFirstName() + " " +medicalNote.getAppointment().getPatient().getLastName(), medicalNote.getDiagnosis(), medicalNote.getContent(), medicalNote.getCreatedAt(), medicalNote.isValidated());
        return dto;
    }
}
