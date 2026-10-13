package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.AbsenceDto;
import com.example.clinicmanager.exceptions.AbsenceNotFoundException;
import com.example.clinicmanager.exceptions.DoctorNotFoundException;
import com.example.clinicmanager.mapper.AbsenceMapper;
import com.example.clinicmanager.model.Absence;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.repository.AbsenceRepository;
import com.example.clinicmanager.repository.DoctorRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class AbsenceService {


        private final AbsenceRepository absenceRepository;
        private final DoctorRepository doctorRepository;

    public AbsenceService(AbsenceRepository absenceRepository, DoctorRepository doctorRepository) {
        this.absenceRepository = absenceRepository;
        this.doctorRepository = doctorRepository;
    }


    public void create(UUID doctorId, LocalDate startDate, LocalDate endDate, String reason){
        Optional<Doctor> doctorOp = doctorRepository.findById(doctorId);

        if (doctorOp.isEmpty()){
            throw new DoctorNotFoundException();
        }
        Doctor doctor = doctorOp.get();

        Absence absence = new Absence(doctor,startDate,endDate,reason);

        absenceRepository.save(absence);
    }

    public void update(int absenceId,LocalDate startDate, LocalDate endDate, String reason){
        Optional<Absence> absenceOP = absenceRepository.findById(absenceId);
        if (absenceOP.isEmpty()){
            throw new AbsenceNotFoundException();
        }
        Absence absenceToUpdate = absenceOP.get();

        absenceToUpdate.setStartDate(startDate);
        absenceToUpdate.setEndDate(endDate);
        absenceToUpdate.setReason(reason);

        absenceRepository.update(absenceToUpdate);
    }

    public void delete(int absenceId) {
        Optional<Absence> absenceOP = absenceRepository.findById(absenceId);

        if (absenceOP.isEmpty()) {
            throw new AbsenceNotFoundException();
        }
        Absence absenceToDelete = absenceOP.get();
        absenceRepository.delete(absenceToDelete);
    }

    public List<AbsenceDto> getAllAbsence(){

        List<Absence> absences = absenceRepository.findAll();

        return absences.stream().map(AbsenceMapper::toDto).toList();
    }

    public List<Absence> getByDoctor(UUID doctorId){
        return absenceRepository.findByDoctorId(doctorId);
    }
}
