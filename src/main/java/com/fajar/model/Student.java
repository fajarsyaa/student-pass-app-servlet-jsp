package com.fajar.model;

public class Student {
    private String studentID;
    private String studentName;
    private String department;
    private int mark;

    // Constructor
    public Student(String studentID, String studentName, String department, int mark) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.department = department;
        this.mark = mark;
    }

    // Getter methods
    public String getStudentID() {
        return studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getDepartment() {
        return department;
    }

    public int getMark() {
        return mark;
    }


    @Override
    public String toString() {
        return "Student{" +
                "studentID=" + studentID +
                ", studentName='" + studentName + '\'' +
                ", department='" + department + '\'' +
                ", mark=" + mark +
                '}';
    }
}

