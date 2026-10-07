package com.example.clinicmanager.filter;

import com.example.clinicmanager.model.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({
        "/patient/*",
        "/doctor/*",
        "/admin/*",
        "/staff/*"
        }
)
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        User user = (User) session.getAttribute("user");

        boolean authorized = false;


        if (path.startsWith("/patient/") && user instanceof Patient) {

            authorized = true;

        } else if (path.startsWith("/doctor/") && user instanceof Doctor) {

            authorized = true;

        } else if (path.startsWith("/admin/") && user instanceof Admin) {

            authorized = true;

        } else if (path.startsWith("/staff/") && user instanceof Staff) {

            authorized = true;
        }

        if (!authorized) {
            httpResponse.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );
            return;
        }
        chain.doFilter(request, response);
    }
}
