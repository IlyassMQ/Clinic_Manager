package com.example.clinicmanager.mapper;

import com.example.clinicmanager.dto.UserDTO;
import com.example.clinicmanager.model.User;

public class UserMapper {

    public static UserDTO toDto(User user){
        UserDTO dto = new UserDTO(user.getId(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhone());
        return dto;
    }
}
