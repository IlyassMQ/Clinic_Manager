package com.example.clinicmanager.service;

import com.example.clinicmanager.dto.DisponibilityDTO;
import com.example.clinicmanager.exceptions.DisponibilityNotFoundException;
import com.example.clinicmanager.exceptions.DoctorNotFoundException;
import com.example.clinicmanager.mapper.DisponibilityMapper;
import com.example.clinicmanager.model.Disponibility;
import com.example.clinicmanager.model.Doctor;
import com.example.clinicmanager.repository.DisponibilityRepository;
import com.example.clinicmanager.repository.DoctorRepository;

import javax.print.Doc;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class DisponibilityService {


    private final DisponibilityRepository disponibilityRepository;
    private final DoctorRepository doctorRepository;


    public DisponibilityService(DoctorRepository doctorRepository, DisponibilityRepository disponibilityRepository) {
        this.doctorRepository = doctorRepository;
        this.disponibilityRepository = disponibilityRepository;
    }

    public void create(UUID doctorId, String dayOfWeek, LocalTime startTime, LocalTime endTime, LocalDate validFrom, LocalDate validUntil){
        Optional<Doctor> doctorOP = doctorRepository.findById(doctorId);
        if (doctorOP.isEmpty()){
            throw new DoctorNotFoundException();
        }
        Doctor doctor = doctorOP.get();
        Disponibility disponibility = new Disponibility(doctor,dayOfWeek,startTime,endTime,validFrom,validUntil);
        disponibilityRepository.save(disponibility);

    }


    public List<Disponibility> getByDoctorId(UUID doctorId){
        return disponibilityRepository.findByDoctorId(doctorId);
    }

    public void update(int disponibilityId, String dayOfWeek, LocalTime startTime, LocalTime endTime, LocalDate validFrom, LocalDate validUntil){
       Optional<Disponibility> disponibilityOP = disponibilityRepository.findById(disponibilityId);
       if (disponibilityOP.isEmpty()){
           throw new DisponibilityNotFoundException();
       }
       Disponibility disponibilityToUpdate = disponibilityOP.get();

        disponibilityToUpdate.setDayOfWeek(dayOfWeek);
        disponibilityToUpdate.setStartTime(startTime);
        disponibilityToUpdate.setEndTime(endTime);
        disponibilityToUpdate.setValidFrom(validFrom);
        disponibilityToUpdate.setValidUntil(validUntil);
        
        disponibilityRepository.update(disponibilityToUpdate);
    }
    
    public void delete(int disponibilityId){
        Optional<Disponibility> disponibilityOP = disponibilityRepository.findById(disponibilityId);
        if (disponibilityOP.isEmpty()){
            throw new DisponibilityNotFoundException();
        }
        Disponibility disponibilityToDelete = disponibilityOP.get();
        
        disponibilityRepository.delete(disponibilityToDelete);
        
    }
    
    public List<DisponibilityDTO> getAllDisponibilty(){
        List<Disponibility> disponibilities  = disponibilityRepository.findAll();
        return disponibilities.stream().map(DisponibilityMapper::toDto).toList();
    }
}
