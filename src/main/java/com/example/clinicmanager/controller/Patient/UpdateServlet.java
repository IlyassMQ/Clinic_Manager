package com.example.clinicmanager.controller.Patient;


import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.repository.PatientRepository;
import com.example.clinicmanager.repository.impl.ImplPatientRepository;
import com.example.clinicmanager.service.PatientService;
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

@WebServlet("/patient/profil/update")
public class UpdateServlet extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init(){
        EntityManager em = JpaUtil.getEntityManager();

        PatientRepository patientRepository = new ImplPatientRepository(em);

        patientService = new PatientService(patientRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        Patient patient = (Patient) session.getAttribute("user");

        request.setAttribute("patient", patient);

        request.getRequestDispatcher("/patient/profile.jsp").forward(request, response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Patient patient = (Patient) session.getAttribute("user");

        String firstName = request.getParameter("firstName");

        String lastName = request.getParameter("lastName");

        String phone = request.getParameter("phone");

        String birthDateValue = request.getParameter("birthDate");

        LocalDate birthDate = null;

        if (birthDateValue != null &&
                !birthDateValue.isBlank()) {

            birthDate = LocalDate.parse(birthDateValue);
        }

        String gender = request.getParameter("gender");

        String address = request.getParameter("address");

        Patient patientUpdated =   patientService.updateProfile(
                patient.getId(),
                firstName,
                lastName,
                phone,
                birthDate,
                gender,
                address
        );
        session.setAttribute("user", patientUpdated);

        response.sendRedirect(
                request.getContextPath()
                        + "/patient/dashboard"
        );
    }

}
