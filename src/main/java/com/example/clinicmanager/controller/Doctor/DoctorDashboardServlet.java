package com.example.clinicmanager.controller.Doctor;

import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/doctor/dashboard")
public class DoctorDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Doctor doctor = (Doctor) session.getAttribute("user");
        request.setAttribute("doctor", doctor);
        request.getRequestDispatcher(
                "/doctor/dashboard.jsp"
        ).forward(request, response);
    }
}
