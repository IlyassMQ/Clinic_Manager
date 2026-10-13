package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.DoctorDTO;
import com.example.clinicmanager.exceptions.DepartmentNotFound;
import com.example.clinicmanager.exceptions.DoctorNotFoundException;
import com.example.clinicmanager.exceptions.SpecialityNotFoundException;
import com.example.clinicmanager.mapper.DepartmentMapper;
import com.example.clinicmanager.mapper.DoctorMapper;
import com.example.clinicmanager.model.Department;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.model.Speciality;
import com.example.clinicmanager.repository.DepartmentRepository;
import com.example.clinicmanager.repository.DoctorRepository;
import com.example.clinicmanager.repository.SpecialityRepository;
import com.example.clinicmanager.util.PasswordHash;

import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class DoctorService {

    private final DoctorRepository doctorRepository;
    private final SpecialityRepository specialityRepository;
    private final DepartmentRepository departmentRepository;

    public DoctorService(
            DoctorRepository doctorRepository,
            SpecialityRepository specialityRepository,
            DepartmentRepository departmentRepository
    ) {
        this.doctorRepository = doctorRepository;
        this.specialityRepository = specialityRepository;
        this.departmentRepository = departmentRepository;
    }

    public void create(
            String firstName,
            String lastName,
            String email,
            String phone,
            String password,
            String matricule,
            String title,
            int specialityId,
            int departmentId
    ) throws NoSuchAlgorithmException {

        Optional<Department> department =
                departmentRepository.findById(departmentId);

        if (department.isEmpty()) {
            throw new IllegalArgumentException(
                    "Department not found"
            );
        }

        Optional<Speciality> speciality =
                specialityRepository.findById(specialityId);

        if (speciality.isEmpty()) {
            throw new IllegalArgumentException(
                    "Speciality not found"
            );
        }

        byte[] saltByte = PasswordHash.salt();

        String salt =
                Base64.getEncoder()
                        .encodeToString(saltByte);

        String hashedPassword =
                PasswordHash.hashPassword(
                        password,
                        saltByte
                );

        Doctor doctor = new Doctor(
                UUID.randomUUID(),
                firstName,
                lastName,
                email,
                phone,
                hashedPassword,
                salt,
                matricule,
                title,
                speciality.get(),
                department.get()
        );

        doctorRepository.save(doctor);
    }

    public void update(
            UUID doctorId,
            String firstName,
            String lastName,
            String email,
            String phone,
            String matricule,
            String title,
            int specialityId,
            int departmentId
    ) {

        Optional<Doctor> doctor = doctorRepository.findById(doctorId);

        if (doctor.isEmpty()) {
            throw new DoctorNotFoundException();
        }

        Optional<Department> department = departmentRepository.findById(departmentId);

        if (department.isEmpty()) {
            throw new DepartmentNotFound();
        }

        Optional<Speciality> speciality = specialityRepository.findById(specialityId);

        if (speciality.isEmpty()) {
            throw new SpecialityNotFoundException();
        }

        Doctor doctorToUpdate = doctor.get();

        doctorToUpdate.setFirstName(firstName);
        doctorToUpdate.setLastName(lastName);
        doctorToUpdate.setEmail(email);
        doctorToUpdate.setPhone(phone);
        doctorToUpdate.setMatricule(matricule);
        doctorToUpdate.setTitle(title);
        doctorToUpdate.setSpecialty(speciality.get());
        doctorToUpdate.setDepartment(department.get());

        doctorRepository.update(doctorToUpdate);
    }

    public void delete(UUID doctorId) {

        Optional<Doctor> doctor = doctorRepository.findById(doctorId);

        if (doctor.isEmpty()) {
            throw new DoctorNotFoundException();
        }

        Doctor doctorToDelete = doctor.get();

        doctorRepository.delete(doctorToDelete);
    }

    public List<DoctorDTO> getAllDoctor() {
        List<Doctor> doctors = doctorRepository.findAll();
       return doctors.stream().map(DoctorMapper::toDto).toList();
    }

    public Optional<DoctorDTO> getDoctorById(UUID id) {
        Optional<Doctor> doctor = doctorRepository.findById(id);

        if (doctor.isEmpty()) {
            return Optional.empty();
        }

        return Optional.of(DoctorMapper.toDto(doctor.get()));
    }
}