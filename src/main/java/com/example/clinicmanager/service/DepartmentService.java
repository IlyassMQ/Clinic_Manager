package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.DepartmentDTO;
import com.example.clinicmanager.exceptions.DepartmentNotFound;
import com.example.clinicmanager.mapper.DepartmentMapper;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.repository.DepartmentRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class DepartmentService {

    private final DepartmentRepository departmentRepository;

    public DepartmentService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public void create(String name){
        Department department = new Department(name);
        departmentRepository.save(department);
    }

    public void update(int id,String name){
       Optional<Department> department = departmentRepository.findById(id);
       if (department.isEmpty()){
           throw new DepartmentNotFound();
       }
       Department departmentToUpdate = department.get();

        departmentToUpdate.setName(name);
        departmentRepository.update(departmentToUpdate);
    }


    public void delete(int id){
        Optional<Department> department = departmentRepository.findById(id);

        if (department.isEmpty()) {
            throw new DepartmentNotFound();
        }
        Department departmentToDelete = department.get();
        departmentRepository.delete(departmentToDelete);
    }

    public List<DepartmentDTO> getALLDepartment(){
       List<Department> departments =  departmentRepository.findAll();
       return departments.stream().map(DepartmentMapper::toDto).toList();
    }

    public Optional<DepartmentDTO> getDepartmentById(int id){
        Optional<Department> department = departmentRepository.findById(id);

        if (department.isEmpty()) {
            return Optional.empty();
        }

        return Optional.of(DepartmentMapper.toDto(department.get()));
    }
}
