package com.example.clinicmanager.controller.Admin;

import com.example.clinicmanager.model.Admin;
import com.example.clinicmanager.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Admin admin = (Admin) session.getAttribute("user");
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);;
    }
}
