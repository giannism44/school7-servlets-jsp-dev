package gr.aueb.cf.schoolapp.dao;

import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.util.DBUtil;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class StudentDAOImpl implements IStudentDAO {


    @Override
    public Student insert(Student student) throws StudentDAOException {
        String sql = "INSERT INTO students (firstname, lastname, vat, fathername, phone_num," +
                " email, street, street_num, zipcode, city_id, uuid, created_at, updated_at)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Student insertedStudent = null;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql,
                     Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, student.getFirstname());
            ps.setString(2, student.getLastname());
            ps.setString(3, student.getVat());
            ps.setString(4, student.getFatherName());
            ps.setString(5, student.getPhoneNum());
            ps.setString(6, student.getEmail());
            ps.setString(7, student.getStreet());
            ps.setString(8, student.getStreetNum());
            ps.setString(9, student.getZipCode());
            ps.setInt(10, student.getCityId());
            ps.setString(11, UUID.randomUUID().toString());
            ps.setTimestamp(12, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(13, Timestamp.valueOf(LocalDateTime.now()));
            ps.executeUpdate();

            ResultSet rsGeneratedKeys = ps.getGeneratedKeys();

            if (rsGeneratedKeys.next()) {
                int generatedId = rsGeneratedKeys.getInt(1);
                insertedStudent =  getById(generatedId);
            }

            return insertedStudent;
        }catch (SQLException e) {
            throw new StudentDAOException("SQL error inserting student with vat: " + student.getVat());
        }
    }

    @Override
    public Student update(Student student) throws StudentDAOException {
        String sql = "UPDATE students SET firstname = ?, lastname = ?, vat = ?, fathername = ?, phone_num = ?," +
                " email = ?, street = ?, street_num = ?, zipcode = ?, city_id = ?," +
                " updated_at = ? WHERE id = ?";
        Student  updatedStudent;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, student.getFirstname());
            ps.setString(2, student.getLastname());
            ps.setString(3, student.getVat());
            ps.setString(4, student.getFatherName());
            ps.setString(5, student.getPhoneNum());
            ps.setString(6, student.getEmail());
            ps.setString(7, student.getStreet());
            ps.setString(8, student.getStreetNum());
            ps.setString(9, student.getZipCode());
            ps.setInt(10, student.getCityId());
//            ps.setTimestamp(11, Timestamp.valueOf(teacher.getUpdatedAt()));
            ps.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));
            ps.setInt(12, student.getId());

            ps.executeUpdate();

            updatedStudent = getById(student.getId());
            // logging
            return updatedStudent;
        } catch (SQLException e) {
            e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in update student with vat: " + student.getVat());
        }
    }

    @Override
    public void delete(Integer id) throws StudentDAOException {
        String sql = "DELETE FROM students WHERE id = ?";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            // logging
        } catch (SQLException e) {
            // e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in delete with student id: " + id);
        }
    }

    @Override
    public Student getById(Integer id) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE id = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("vat"),
                        rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"), rs.getString("street"),
                        rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"), rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("updated_at").toLocalDateTime());
            }
            return student;
        } catch (SQLException e) {
            e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get by id with id: " + id);
        }
    }

    @Override
    public List<Student> getAll() throws StudentDAOException {
        String sql = "SELECT * FROM student";
        Student student;
        List<Student> students = new ArrayList<>();
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            rs = ps.executeQuery();

            while (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("vat"),
                        rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"), rs.getString("street"),
                        rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"), rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
        } catch (SQLException e) {
            //e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get all");
        }
        return students;
    }

    @Override
    public Student getByUUID(String uuid) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE uuid = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, uuid);
            rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("vat"),
                        rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"), rs.getString("street"),
                        rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"), rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("updated_at").toLocalDateTime());
            }
            return student;
        } catch (SQLException e) {
            // e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get by uuid with uuid: " + uuid);
        }
    }

    @Override
    public List<Student> getByLastname(String lastname) throws StudentDAOException {
        List<Student> students = new ArrayList<>();
        Student student;
        String sql = "SELECT * FROM students WHERE lastname LIKE ?";
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, lastname + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("vat"),
                        rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"), rs.getString("street"),
                        rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"), rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
            return students;
        } catch (SQLException e) {
            // e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in get with lastname: " + lastname);
        }
    }

    @Override
    public Student getStudentByVat(String vat) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE vat = ?";
        Student student = null;
        ResultSet rs;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, vat);
            rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"), rs.getString("vat"),
                        rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"), rs.getString("street"),
                        rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"), rs.getString("uuid"),
                        rs.getTimestamp("created_at").toLocalDateTime(), rs.getTimestamp("updated_at").toLocalDateTime());
            }
        } catch (SQLException e) {
            //e.printStackTrace();
            throw new StudentDAOException("SQL error in get with vat: " + vat);
        }
        return student;
    }

    @Override
    public List<Student> getFilteredStudents(String firstname, String lastname) throws StudentDAOException {
        String sql = "SELECT * FROM students WHERE firstname LIKE ? AND lastname LIKE ?";
        List<Student> students = new ArrayList<>(); // isEmpty == true
        ResultSet rs;
        Student student;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, firstname + "%");
            ps.setString(2, lastname + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                student = new Student(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
                        rs.getString("vat"), rs.getString("fathername"), rs.getString("phone_num"), rs.getString("email"),
                        rs.getString("street"), rs.getString("street_num"), rs.getString("zipcode"), rs.getInt("city_id"),
                        rs.getString("uuid"), rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getTimestamp("updated_at").toLocalDateTime());
                students.add(student);
            }
            // Logging
            students.forEach(System.out::println);
            return students;
        } catch (SQLException e) {
            e.printStackTrace();
            // logging
            throw new StudentDAOException("SQL error in filtered get");
        }
    }
}
