package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.AppointmentDTO;
import com.example.clinicmanager.model.Appointment;

public class AppointmentMapper {

    public static AppointmentDTO toDto(Appointment appointment) {
        AppointmentDTO dto = new AppointmentDTO(appointment.getId(), appointment.getPatient().getId(), appointment.getPatient().getFirstName() + " " + appointment.getPatient().getLastName(), appointment.getDoctor().getId(), appointment.getDoctor().getFirstName() + " " + appointment.getDoctor().getLastName(), appointment.getAppointmentDate(), appointment.getStartTime(), appointment.getEndTime(), appointment.getType().name(), appointment.getReason(), appointment.getStatus().name());

        return dto;
    }
}
