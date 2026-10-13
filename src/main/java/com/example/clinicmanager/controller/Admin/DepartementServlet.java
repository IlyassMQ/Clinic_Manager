package com.example.clinicmanager.controller.Admin;


import com.example.clinicmanager.dto.DepartmentDTO;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.repository.DepartmentRepository;
import com.example.clinicmanager.repository.impl.ImplDepartmentRepository;
import com.example.clinicmanager.service.DepartmentService;
import com.example.clinicmanager.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/departments")
public class DepartementServlet extends HttpServlet {

    private DepartmentService departmentService;
    @Override
    public void init() {
        EntityManager em = JpaUtil.getEntityManager();

        DepartmentRepository departmentRepository = new ImplDepartmentRepository(em);
        departmentService = new DepartmentService(departmentRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DepartmentDTO> departments = departmentService.getALLDepartment();

        request.setAttribute("departments", departments);

        request.getRequestDispatcher("/admin/department.jsp").forward(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action.equals("create")) {
                String name = request.getParameter("name");
                departmentService.create(name);
                response.sendRedirect(
                        request.getContextPath() + "/admin/departments"
                );

            } else if (action.equals("update")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                departmentService.update(id, name);
                response.sendRedirect(
                        request.getContextPath() + "/admin/departments"
                );
            }else if (action.equals("delete")) {

                int id = Integer.parseInt(request.getParameter("id"));
                departmentService.delete(id);
                response.sendRedirect(
                        request.getContextPath() + "/admin/departments"
                );
            }
        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }
    }
}
