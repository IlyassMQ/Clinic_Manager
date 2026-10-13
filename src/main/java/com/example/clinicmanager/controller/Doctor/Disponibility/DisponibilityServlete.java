package com.example.clinicmanager.controller.Doctor.Disponibility;

import com.example.clinicmanager.model.Disponibility;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.repository.DisponibilityRepository;
import com.example.clinicmanager.repository.DoctorRepository;
import com.example.clinicmanager.repository.impl.ImplDisponibilityRepository;
import com.example.clinicmanager.repository.impl.ImplDoctorRepository;
import com.example.clinicmanager.service.DisponibilityService;
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
import java.util.List;
import java.util.UUID;

@WebServlet("/doctor/disponibility")
public class DisponibilityServlete extends HttpServlet {

        private DisponibilityService disponibilityService;
    @Override
    public void init() throws ServletException {
        EntityManager em = JpaUtil.getEntityManager();

        DisponibilityRepository disponibilityRepository = new ImplDisponibilityRepository(em);

        DoctorRepository doctorRepository = new ImplDoctorRepository(em);

        disponibilityService = new DisponibilityService(doctorRepository,disponibilityRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        Doctor doctor = (Doctor) session.getAttribute("user");

        UUID doctorId = doctor.getId();

        List<Disponibility> disponibilities = disponibilityService.getByDoctorId(doctorId);

        request.setAttribute(
                "disponibilities",
                disponibilities
        );
        request.setAttribute(
                "doctor",
                doctor
        );

        request.getRequestDispatcher("/doctor/disponibility/disponibility.jsp").forward(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        Doctor doctor = (Doctor) session.getAttribute("user");

        UUID doctorId = doctor.getId();
        String action = request.getParameter("action");

        try {

            if ("create".equals(action)) {

                String dayOfWeek = request.getParameter("dayOfWeek");

                LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));

                LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

                String validFromValue = request.getParameter("validFrom");

                LocalDate validFrom = null;

                if (validFromValue != null && !validFromValue.isBlank()) {

                    validFrom = LocalDate.parse(validFromValue);
                }

                String validUntilValue = request.getParameter("validUntil");

                LocalDate validUntil = null;

                if (validUntilValue != null && !validUntilValue.isBlank()) {
                    validUntil = LocalDate.parse(validUntilValue);
                }

                disponibilityService.create(doctorId, dayOfWeek, startTime, endTime, validFrom, validUntil);

                response.sendRedirect(
                        request.getContextPath()
                                + "/doctor/disponibility"
                );

            }else if (action.equals("update")) {

                int id = Integer.parseInt (request.getParameter("id"));

                String dayOfWeek = request.getParameter("dayOfWeek");

                LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));

                LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

                String validFromValue = request.getParameter("validFrom");

                LocalDate validFrom = null;

                if (validFromValue != null && !validFromValue.isBlank()) {

                    validFrom = LocalDate.parse(validFromValue);
                }

                String validUntilValue = request.getParameter("validUntil");

                LocalDate validUntil = null;

                if (validUntilValue != null && !validUntilValue.isBlank()) {
                    validUntil = LocalDate.parse(validUntilValue);
                }

                disponibilityService.update(id,dayOfWeek,startTime,endTime,validFrom,validUntil);
                response.sendRedirect(request.getContextPath() + "/doctor/disponibility");
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));

                disponibilityService.delete(id);
                response.sendRedirect(request.getContextPath() + "/doctor/disponibility");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
