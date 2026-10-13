package com.example.clinicmanager.dto;

public class SpecialtyDTO {
    private int id;
    private String name;
    private String departmentName;
    private int departmentId;

    public SpecialtyDTO(int id, String name, String departmentName, int departmentId) {
        this.id = id;
        this.name = name;
        this.departmentName = departmentName;
        this.departmentId = departmentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
}
