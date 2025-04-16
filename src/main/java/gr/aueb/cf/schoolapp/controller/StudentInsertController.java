package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentInsertDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentAlreadyExistsException;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import gr.aueb.cf.schoolapp.validator.StudentValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/school-app/students/insert")
public class StudentInsertController  extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{

        try {
            List<City> cities = cityService.getAllCities();
            req.setAttribute("cities", cities);

            // Check for any persisted form data from previous POST
            if (req.getSession().getAttribute("formData") != null) {

                Map<String, Object> formData = (Map<String, Object>) req.getSession().getAttribute("formData");

                // Transfer all attributes to request scope
                formData.forEach(req::setAttribute);

                // Clear session data
                req.getSession().removeAttribute("formData");
            }

            req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp").forward(req, resp);

        } catch (SQLException e) {
            handleError(req, resp, "Error retrieving cities: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Map<String, Object> formData = new HashMap<>();

        StudentInsertDTO insertDTO = new StudentInsertDTO(
                req.getParameter("firstname"),
                req.getParameter("lastname"),
                req.getParameter("vat"),
                req.getParameter("fathername"),
                req.getParameter("phoneNum"),
                req.getParameter("email"),
                req.getParameter("street"),
                req.getParameter("streetNum"),
                req.getParameter("zipcode"),
                req.getParameter("cityId") != null ? Integer.parseInt(req.getParameter("cityId")) : 0
        );

        formData.put("insertDTO", insertDTO);

        try {
            Map<String, String> errors = StudentValidator.validate(insertDTO);

            if (!errors.isEmpty()) {
                errors.forEach((field, message) ->
                        formData.put(field + "Message", message));

                req.getSession().setAttribute("formData", formData);
                resp.sendRedirect(req.getContextPath() + "/school-app/students/insert");
                return;
            }

            StudentReadOnlyDTO readOnlyDTO = studentService.insertStudent(insertDTO);
            req.getSession().setAttribute("studentInfo", readOnlyDTO);

            resp.sendRedirect(req.getContextPath() + "/school-app/student-inserted");

        } catch (IOException | StudentDAOException | StudentAlreadyExistsException e) {
            formData.put("errorMessage", e.getMessage());
            req.getSession().setAttribute("formData", formData);
            resp.sendRedirect(req.getContextPath() + "/school-app/students/insert");
        } catch (NumberFormatException e) {
            formData.put("errorMessage", "Invalid city selection");
            req.getSession().setAttribute("formData", formData);
            resp.sendRedirect(req.getContextPath() + "/school-app/students/insert");
        }
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("errorMessage", message);
        req.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(req, resp);
    }
}
