package com.example.clinicmanager.controller.Auth;

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

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        EntityManager em = JpaUtil.getEntityManager();

        UserRepository userRepository = new ImplUserRepository(em);

        authService = new AuthService(userRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/auth/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String cin = request.getParameter("cin");
        LocalDate birthDate = LocalDate.parse(request.getParameter("birthDate"));
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        try {
            authService.register(firstName, lastName, email, phone, password, cin, birthDate, gender, address);
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }catch (IllegalArgumentException e){
            request.setAttribute(
                    "error",
                    e.getMessage()
            );
            request.getRequestDispatcher("/auth/register.jsp")
                    .forward(request, response);
        }


    }
}