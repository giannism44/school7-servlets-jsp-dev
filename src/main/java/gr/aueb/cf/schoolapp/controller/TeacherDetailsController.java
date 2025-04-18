package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.ITeacherDAO;
import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.TeacherDAOImpl;
import gr.aueb.cf.schoolapp.dto.TeacherReadOnlyDTO;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.ITeacherService;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.TeacherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/school-app/teachers/details")
public class TeacherDetailsController extends HttpServlet {

    ITeacherDAO teacherDAO = new TeacherDAOImpl();
    ITeacherService teacherService = new TeacherServiceImpl(teacherDAO);

    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            TeacherReadOnlyDTO teacher = teacherService.getTeacherById(id);

            // Βρες το όνομα της πόλης
            List<City> cities = cityService.getAllCities();
            String cityName = cities.stream()
                    .filter(city -> city.getId().equals(teacher.getCityId()))
                    .findFirst()
                    .map(City::getName)
                    .orElse("Άγνωστη Πόλη");

            request.setAttribute("teacher", teacher);
            request.setAttribute("cityName", cityName);

            request.getRequestDispatcher("/WEB-INF/jsp/teacher-details.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Ο καθηγητής δεν βρέθηκε.");
            request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
        }
    }
}
