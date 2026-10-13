package com.example.clinicmanager.controller.Patient;

import com.example.clinicmanager.model.Patient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/patient/profile")
public class PatientProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        Patient patient = (Patient) session.getAttribute("user");

        request.setAttribute("patient", patient);

        request.getRequestDispatcher(
                "/patient/profile.jsp"
        ).forward(request, response);
    }
}