package com.example.clinicmanager.controller.Doctor.Absence;


import com.example.clinicmanager.dto.AbsenceDto;
import com.example.clinicmanager.model.Absence;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.repository.AbsenceRepository;
import com.example.clinicmanager.repository.DoctorRepository;
import com.example.clinicmanager.repository.impl.ImplAbsenceRepository;
import com.example.clinicmanager.repository.impl.ImplDoctorRepository;
import com.example.clinicmanager.service.AbsenceService;
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

@WebServlet("/doctor/absence")
public class AbsenceServlet extends HttpServlet {

    private AbsenceService absenceService;
    @Override
    public void init() throws ServletException {
        EntityManager em = JpaUtil.getEntityManager();
        AbsenceRepository absenceRepository = new ImplAbsenceRepository(em);
        DoctorRepository doctorRepository = new ImplDoctorRepository(em);
        absenceService = new AbsenceService(absenceRepository,doctorRepository);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Doctor doctor = (Doctor) session.getAttribute("user");

        UUID doctorId = doctor.getId();

        List<Absence> absences =  absenceService.getByDoctor(doctorId);
            request.setAttribute("absences",absences);
            request.setAttribute("doctor",doctor);
        request.getRequestDispatcher("/doctor/absence/absence.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        Doctor doctor = (Doctor) session.getAttribute("user");

        UUID doctorId = doctor.getId();
        String action = request.getParameter("action");

        try {

            if ("create".equals(action)) {

                LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));

                LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

                String reason = request.getParameter("reason");


                absenceService.create(doctorId, startDate, endDate,reason);

                response.sendRedirect(
                        request.getContextPath()
                                + "/doctor/absence"
                );

            }else if (action.equals("update")) {

                int id = Integer.parseInt (request.getParameter("id"));

                LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));

                LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));

                String reason = request.getParameter("reason");


                absenceService.update(id,startDate,endDate,reason);
                response.sendRedirect(request.getContextPath() + "/doctor/absence");
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));

                absenceService.delete(id);
                response.sendRedirect(request.getContextPath() + "/doctor/absence");
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
