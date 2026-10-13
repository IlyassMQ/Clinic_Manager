package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.DepartmentDTO;
import com.example.clinicmanager.model.Department;

public class DepartmentMapper {

    public static DepartmentDTO toDto(Department department){
        DepartmentDTO dto = new DepartmentDTO(department.getId(), department.getName());

        return dto;
    }
}
