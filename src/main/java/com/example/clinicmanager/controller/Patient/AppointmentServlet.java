package com.example.clinicmanager.controller.Patient;

import com.example.clinicmanager.dto.AppointmentDTO;
import com.example.clinicmanager.dto.DoctorDTO;

import com.example.clinicmanager.model.enums.AppointmentType;
import com.example.clinicmanager.model.Patient;

import com.example.clinicmanager.model.enums.AppointmentType;
import com.example.clinicmanager.repository.*;
import com.example.clinicmanager.repository.impl.*;

import com.example.clinicmanager.service.AppointmentService;
import com.example.clinicmanager.service.DoctorService;
import com.example.clinicmanager.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.UUID;

@WebServlet("/patient/appointments")
public class AppointmentServlet extends HttpServlet {

    private AppointmentService appointmentService;
    private DoctorService doctorService;

    @Override
    public void init() throws ServletException {

        EntityManager em = JpaUtil.getEntityManager();

        AppointmentRepository appointmentRepository = new ImplAppointmentRepository(em);

        PatientRepository patientRepository = new ImplPatientRepository(em);

        DoctorRepository doctorRepository = new ImplDoctorRepository(em);

        DisponibilityRepository disponibilityRepository = new ImplDisponibilityRepository(em);

        AbsenceRepository absenceRepository = new ImplAbsenceRepository(em);

        SpecialityRepository specialityRepository = new ImplSpecialityRepository(em);

        DepartmentRepository departmentRepository = new ImplDepartmentRepository(em);

        appointmentService = new AppointmentService(
                appointmentRepository,
                patientRepository,
                doctorRepository,
                disponibilityRepository,
                absenceRepository
        );

        doctorService = new DoctorService(
                doctorRepository,
                specialityRepository,
                departmentRepository
        );
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Patient patient = (Patient) session.getAttribute("user");

        List<DoctorDTO> doctors =
                doctorService.getAllDoctor();

        List<AppointmentDTO> appointments =
                appointmentService.getByPatient(patient.getId());

        request.setAttribute("patient", patient);
        request.setAttribute("doctors", doctors);
        request.setAttribute("appointments", appointments);

        request.getRequestDispatcher(
                "/patient/appointment/appointment.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Patient patient = (Patient) session.getAttribute("user");

        String action = request.getParameter("action");

        try {

            if ("create".equals(action)) {

                UUID doctorId = UUID.fromString(
                        request.getParameter("doctorId")
                );

                LocalDate appointmentDate = LocalDate.parse(
                        request.getParameter("appointmentDate")
                );

                LocalTime startTime = LocalTime.parse(
                        request.getParameter("startTime")
                );

                AppointmentType type = AppointmentType.valueOf(
                        request.getParameter("type")
                );

                String reason = request.getParameter("reason");

                appointmentService.create(
                        patient.getId(),
                        doctorId,
                        appointmentDate,
                        startTime,
                        type,
                        reason
                );

                response.sendRedirect(
                        request.getContextPath()
                                + "/patient/appointments"
                );

            }

        } catch (DateTimeParseException e) {

            throw new RuntimeException(e);

        } catch (IllegalArgumentException e) {

            throw new RuntimeException(e);
        }
    }
}
