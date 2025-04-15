package gr.aueb.cf.schoolapp.dao;

import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.Student;

import javax.swing.text.Style;
import java.util.List;

public interface IStudentDAO {

    Student insert(Student student) throws StudentDAOException;
    Student update(Student student) throws StudentDAOException;
    void delete(Integer id) throws StudentDAOException;
    Student getById(Integer id) throws StudentDAOException;
    List<Student> getAll() throws StudentDAOException;

    Student getByUUID(String uuid) throws StudentDAOException;
    List<Student> getByLastname(String Lastname) throws StudentDAOException;
    Student getStudentByVat(String vat) throws StudentDAOException;
    List<Student> getFilteredStudents(String firstname, String lastname) throws StudentDAOException;
}
