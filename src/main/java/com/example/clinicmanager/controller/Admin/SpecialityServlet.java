package com.example.clinicmanager.controller.Admin;


import com.example.clinicmanager.dto.DepartmentDTO;
import com.example.clinicmanager.dto.SpecialtyDTO;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Speciality;
import com.example.clinicmanager.repository.DepartmentRepository;
import com.example.clinicmanager.repository.SpecialityRepository;
import com.example.clinicmanager.repository.impl.ImplDepartmentRepository;
import com.example.clinicmanager.repository.impl.ImplSpecialityRepository;
import com.example.clinicmanager.service.DepartmentService;
import com.example.clinicmanager.service.SpecialityService;
import com.example.clinicmanager.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/speciality")
public class SpecialityServlet extends HttpServlet {

    private SpecialityService specialityService;
    private DepartmentService departmentService;

    @Override
    public void init() {
        EntityManager em = JpaUtil.getEntityManager();

        SpecialityRepository specialityRepository = new ImplSpecialityRepository(em);
        DepartmentRepository departmentRepository = new ImplDepartmentRepository(em);
        specialityService = new SpecialityService(specialityRepository,departmentRepository);
        departmentService = new DepartmentService(departmentRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SpecialtyDTO> specialityList = specialityService.getAllSpeciality();
        List<DepartmentDTO> departmentList = departmentService.getALLDepartment();

        request.setAttribute("departments", departmentList);
        request.setAttribute("specialities", specialityList);

        request.getRequestDispatcher("/admin/speciality.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action.equals("create")) {
                int id = Integer.parseInt(request.getParameter("id"));

                String name = request.getParameter("name");

                specialityService.create(name,id);
                response.sendRedirect(
                        request.getContextPath() + "/admin/speciality"
                );

            } else if (action.equals("update")) {

                int speciality_id = Integer.parseInt(request.getParameter("speciality_id"));
                int department_id = Integer.parseInt(request.getParameter("department_id"));
                String name = request.getParameter("name");
                specialityService.update(speciality_id,name,department_id);
                response.sendRedirect(
                        request.getContextPath() + "/admin/speciality"
                );
            }else if (action.equals("delete")) {

                int id = Integer.parseInt(request.getParameter("id"));
                specialityService.delete(id);
                response.sendRedirect(
                        request.getContextPath() + "/admin/speciality"
                );
            }
        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }
    }
}
