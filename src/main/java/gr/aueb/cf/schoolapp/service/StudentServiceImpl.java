package gr.aueb.cf.schoolapp.service;

import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dto.FiltersDTO;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.dto.StudentUpdateDTO;
import gr.aueb.cf.schoolapp.exceptions.*;
import gr.aueb.cf.schoolapp.mapper.StudentMapper;
import gr.aueb.cf.schoolapp.model.Student;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class StudentServiceImpl implements IStudentService{

    private final IStudentDAO studentDAO;

    public StudentServiceImpl(IStudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    @Override
    public StudentReadOnlyDTO insertStudent(StudentInsertDTO dto)
            throws StudentDAOException, StudentAlreadyExistsException {
        Student student;
        Student insertedStudent;

        try {
            student = StudentMapper.mapStudentInsertToModel(dto);
            if (studentDAO.getStudentByVat(dto.getVat()) != null)
                throw new StudentAlreadyExistsException("Student with vat" + dto.getVat() + " exists");
            insertedStudent = studentDAO.insert(student);
            return StudentMapper.mapStudentToReadOnlyDTO(insertedStudent).orElse(null);
        } catch (StudentDAOException | StudentAlreadyExistsException e) {
            throw e;
        }
    }

    @Override
    public StudentReadOnlyDTO updateStudent(Integer id, StudentUpdateDTO dto)
            throws StudentDAOException, StudentAlreadyExistsException, StudentNotFoundException {
        Student student;
        Student fetchedStudent;

        try {
            if (studentDAO.getById(id) == null)
                throw new StudentNotFoundException("Student with id " + id + " was not found");


            fetchedStudent = studentDAO.getStudentByVat(dto.getVat());
            if (fetchedStudent != null && !fetchedStudent.getId().equals(dto.getId())) {
                throw new StudentAlreadyExistsException("Student with id: " + dto.getId() + " already exists");
            }
            student = StudentMapper.mapStudentUpdateToModel(dto);
            Student updatedStudent =  studentDAO.update(student);
            return StudentMapper.mapStudentToReadOnlyDTO(updatedStudent).orElse(null);
        } catch (StudentDAOException | StudentNotFoundException e) {
            throw e;
        }
    }

    @Override
    public void deleteStudent(Integer id)
            throws StudentDAOException, StudentNotFoundException {
        try {
            if (studentDAO.getById(id) == null) {
                throw new StudentNotFoundException("Student not found");
            }
            studentDAO.delete(id);
        } catch (StudentDAOException | StudentNotFoundException e) {
            throw e;
        }
    }

    @Override
    public StudentReadOnlyDTO getStudentById(Integer id)
            throws StudentDAOException, StudentNotFoundException {
        Student student;
        try {
            student = studentDAO.getById(id);

            if (student == null) {
                throw new StudentNotFoundException(" Ο μαθητής με ID = " + id + " δεν βρέθηκε στη βάση.");
            }

            return StudentMapper.mapStudentToReadOnlyDTO(student)
                    .orElseThrow(() -> new StudentNotFoundException(" Σφάλμα κατά τη μετατροπή σε DTO."));
        } catch (StudentNotFoundException | StudentDAOException e) {
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getAllStudents() throws StudentDAOException {
        List<Student> students;

        try {
            students = studentDAO.getAll();
            return students.stream()
                    .map(StudentMapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getStudentByLastname(String lastname) throws StudentDAOException {
        List<Student> students;

        try {
            students = studentDAO.getByLastname(lastname);

            return students.stream()
                    .map(StudentMapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
            throw e;
        }
    }

    @Override
    public List<StudentReadOnlyDTO> getFilteredStudent(FiltersDTO filters) throws StudentDAOException {
        List<Student> students;

        try{
            students = studentDAO.getFilteredStudents(filters.getFirstname(), filters.getLastname());
            return students.stream()
                    .map(StudentMapper::mapStudentToReadOnlyDTO)
                    .flatMap(Optional::stream)
                    .collect(Collectors.toList());
        }catch (StudentDAOException e){
            throw e;
        }
    }
}
