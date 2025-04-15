package gr.aueb.cf.schoolapp.controller;


import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/students/details")
public class StudentDetailsController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            StudentReadOnlyDTO student = studentService.getStudentById(id);
            request.setAttribute("student",student);
            request.getRequestDispatcher("/WEB-INF/jsp/student-details.jsp").forward(request, response);
        }catch (Exception e){
            request.setAttribute("message","Ο μαθητής δεν βρέθηκε.");
            request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request,response);
        }
    }
}

