package com.example.clinicmanager.controller.Admin;

import com.example.clinicmanager.dto.DepartmentDTO;
import com.example.clinicmanager.dto.DoctorDTO;
import com.example.clinicmanager.dto.SpecialtyDTO;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.model.Speciality;
import com.example.clinicmanager.repository.DepartmentRepository;
import com.example.clinicmanager.repository.DoctorRepository;
import com.example.clinicmanager.repository.SpecialityRepository;
import com.example.clinicmanager.repository.impl.ImplDepartmentRepository;
import com.example.clinicmanager.repository.impl.ImplDoctorRepository;
import com.example.clinicmanager.repository.impl.ImplSpecialityRepository;
import com.example.clinicmanager.service.DepartmentService;
import com.example.clinicmanager.service.DoctorService;
import com.example.clinicmanager.service.SpecialityService;
import com.example.clinicmanager.util.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

@WebServlet("/admin/doctor")
public class DoctorCRUDServlet extends HttpServlet {

    private DoctorService doctorService;
    private DepartmentService departmentService;
    private SpecialityService specialityService;

    @Override
    public void init() {

        EntityManager em = JpaUtil.getEntityManager();

        DoctorRepository doctorRepository = new ImplDoctorRepository(em);

        DepartmentRepository departmentRepository = new ImplDepartmentRepository(em);

        SpecialityRepository specialityRepository = new ImplSpecialityRepository(em);

        doctorService = new DoctorService(doctorRepository, specialityRepository, departmentRepository);

        departmentService = new DepartmentService(departmentRepository);

        specialityService = new SpecialityService(specialityRepository, departmentRepository);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DoctorDTO> doctors = doctorService.getAllDoctor();
        List<DepartmentDTO> departments = departmentService.getALLDepartment();
        List<SpecialtyDTO> specialities = specialityService.getAllSpeciality();
        request.setAttribute("doctors", doctors);
        request.setAttribute("departments",departments);
        request.setAttribute("specialities",specialities);

        request.getRequestDispatcher(
                "/admin/doctor.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            if (action.equals("create")) {

                String firstName = request.getParameter("firstName");

                String lastName = request.getParameter("lastName");

                String email = request.getParameter("email");

                String phone = request.getParameter("phone");

                String password = request.getParameter("password");

                String matricule = request.getParameter("matricule");

                String title = request.getParameter("title");

                int specialityId = Integer.parseInt(
                                request.getParameter("speciality_id"));

                int departmentId =
                        Integer.parseInt(
                                request.getParameter("department_id"));

                doctorService.create(
                        firstName,
                        lastName,
                        email,
                        phone,
                        password,
                        matricule,
                        title,
                        specialityId,
                        departmentId
                );

                response.sendRedirect(
                        request.getContextPath() + "/admin/doctor"
                );

            } else if (action.equals("update")) {

                String id = request.getParameter("id");

                UUID doctorId = UUID.fromString(id);

                String firstName = request.getParameter("firstName");

                String lastName = request.getParameter("lastName");

                String email = request.getParameter("email");

                String phone = request.getParameter("phone");

                String matricule = request.getParameter("matricule");

                String title = request.getParameter("title");

                int specialityId = Integer.parseInt(request.getParameter("speciality_id"));

                int departmentId = Integer.parseInt(request.getParameter("department_id"));

                doctorService.update(
                        doctorId,
                        firstName,
                        lastName,
                        email,
                        phone,
                        matricule,
                        title,
                        specialityId,
                        departmentId
                );

                response.sendRedirect(
                        request.getContextPath() + "/admin/doctor"
                );

            } else if (action.equals("delete")) {

                UUID doctorId = UUID.fromString(request.getParameter("id"));

                doctorService.delete(doctorId);

                response.sendRedirect(
                        request.getContextPath() + "/admin/doctor"
                );
            }

        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        } catch (IllegalArgumentException e) {

            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}