package gr.aueb.cf.schoolapp.mapper;

import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.dto.StudentUpdateDTO;
import gr.aueb.cf.schoolapp.model.Student;

import java.util.Optional;

public class StudentMapper {

    private StudentMapper(){}

    public static Student mapStudentInsertToModel(StudentInsertDTO dto){
        return new Student(null, dto.getFirstname(), dto.getLastname(), dto.getVat(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Student mapStudentUpdateToModel(StudentUpdateDTO dto){
        return new Student(null, dto.getFirstname(), dto.getLastname(), dto.getVat(),
                dto.getFatherName(), dto.getPhoneNum(), dto.getEmail(), dto.getStreet(), dto.getStreetNum(),
                dto.getZipCode(), dto.getCityId(), null, null, null);
    }

    public static Optional<StudentReadOnlyDTO> mapStudentToReadOnlyDTO(Student student){
        if (student == null) return Optional.empty();

        return Optional.of(new StudentReadOnlyDTO(student.getId(), student.getUuid(), student.getFirstname(),
                student.getLastname(), student.getVat(), student.getFatherName(), student.getPhoneNum(),
                student.getEmail(), student.getStreet(), student.getStreetNum(), student.getZipCode(), student.getCityId()));
    }
}
