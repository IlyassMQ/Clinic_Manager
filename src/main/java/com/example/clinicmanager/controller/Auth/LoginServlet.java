package com.example.clinicmanager.controller.Auth;

import com.example.clinicmanager.exceptions.InvalidCredentialsException;
import com.example.clinicmanager.model.Admin;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.model.Patient;
import com.example.clinicmanager.model.Staff;
import com.example.clinicmanager.model.User;
import com.example.clinicmanager.repository.UserRepository;
import com.example.clinicmanager.repository.impl.ImplUserRepository;
import com.example.clinicmanager.service.AuthService;
import com.example.clinicmanager.util.JpaUtil;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {

        EntityManager em = JpaUtil.getEntityManager();
        UserRepository userRepository = new ImplUserRepository(em);
        authService = new AuthService(userRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            User user = authService.login(email, password);

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if (user instanceof Patient) {

                response.sendRedirect(
                        request.getContextPath() + "/patient/dashboard"
                );

            } else if (user instanceof Doctor) {

                response.sendRedirect(
                        request.getContextPath() + "/doctor/dashboard"
                );

            } else if (user instanceof Admin) {

                response.sendRedirect(
                        request.getContextPath() + "/admin/dashboard"
                );

            } else if (user instanceof Staff) {

                response.sendRedirect(
                        request.getContextPath() + "/staff/dashboard"
                );
            }

        } catch (InvalidCredentialsException e) {

            request.setAttribute(
                    "error",
                    e.getMessage()
            );

            request.getRequestDispatcher("/auth/login.jsp")
                    .forward(request, response);
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}