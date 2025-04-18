package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/school-app/students/details")
public class StudentDetailsController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);

    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            StudentReadOnlyDTO student = studentService.getStudentById(id);

            // Ανάκτηση και εύρεση του ονόματος της πόλης
            List<City> cities = cityService.getAllCities();
            String cityName = cities.stream()
                    .filter(city -> city.getId().equals(student.getCityId()))
                    .findFirst()
                    .map(City::getName)
                    .orElse("Άγνωστη Πόλη");

            request.setAttribute("student", student);
            request.setAttribute("cityName", cityName);

            request.getRequestDispatcher("/WEB-INF/jsp/student-details.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Ο μαθητής δεν βρέθηκε.");
            request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
        }
    }
}
