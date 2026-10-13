package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.SpecialtyDTO;
import com.example.clinicmanager.exceptions.DepartmentNotFound;
import com.example.clinicmanager.exceptions.SpecialityNotFoundException;
import com.example.clinicmanager.mapper.DepartmentMapper;
import com.example.clinicmanager.mapper.SpecialtyMapper;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Speciality;
import com.example.clinicmanager.repository.DepartmentRepository;
import com.example.clinicmanager.repository.SpecialityRepository;

import java.util.List;
import java.util.Optional;

public class SpecialityService {
    private final SpecialityRepository specialityRepository;
    private final DepartmentRepository departmentRepository;


    public SpecialityService(SpecialityRepository specialityRepository, DepartmentRepository departmentRepository) {
        this.specialityRepository = specialityRepository;
        this.departmentRepository = departmentRepository;
    }

        public void create(String name, int departmentId) {

            Optional<Department> departmentOP = departmentRepository.findById(departmentId);
            if (departmentOP.isEmpty()){
                throw new DepartmentNotFound();
            }

            Department department = departmentOP.get();

            Speciality speciality = new Speciality(
                    name,
                    department
            );
            specialityRepository.save(speciality);
        }

    public void update(int specialityId, String name, int departmentId) {
        Optional<Speciality> specialityOP = specialityRepository.findById(specialityId);

        if (specialityOP.isEmpty()){
            throw new SpecialityNotFoundException();
        }

        Optional<Department> departmentOP = departmentRepository.findById(departmentId);
        if (departmentOP.isEmpty()){
            throw new DepartmentNotFound();
        }

        Department department = departmentOP.get();
        Speciality speciality = specialityOP.get();

        speciality.setName(name);
        speciality.setDepartment(department);

        specialityRepository.update(speciality);
    }

    public void delete(int id){
        Optional<Speciality> specialityOP = specialityRepository.findById(id);

        if (specialityOP.isEmpty()){
            throw new SpecialityNotFoundException();
        }
        Speciality specialityToDelete = specialityOP.get();
        specialityRepository.delete(specialityToDelete);
    }

    public List<SpecialtyDTO> getAllSpeciality(){
        List<Speciality> specialities = specialityRepository.findAll();
        return specialities.stream().map(SpecialtyMapper::toDto).toList();
    }

    public Optional<SpecialtyDTO> getSpecialityById(int id){
        Optional<Speciality> speciality = specialityRepository.findById(id);

        if (speciality.isEmpty()) {
            return Optional.empty();
        }

        return Optional.of(SpecialtyMapper.toDto(speciality.get()));
    }

}
