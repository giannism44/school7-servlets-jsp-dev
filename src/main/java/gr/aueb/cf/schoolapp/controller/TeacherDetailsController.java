package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.ITeacherDAO;
import gr.aueb.cf.schoolapp.dao.TeacherDAOImpl;
import gr.aueb.cf.schoolapp.dto.TeacherReadOnlyDTO;
import gr.aueb.cf.schoolapp.model.Teacher;
import gr.aueb.cf.schoolapp.service.ITeacherService;
import gr.aueb.cf.schoolapp.service.TeacherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/teachers/details")
public class TeacherDetailsController extends HttpServlet {

     ITeacherDAO teacherDAO = new TeacherDAOImpl();
     ITeacherService teacherService = new TeacherServiceImpl(teacherDAO);


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            TeacherReadOnlyDTO teacher = teacherService.getTeacherById(id);
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("/WEB-INF/jsp/teacher-view.jsp").forward(request, response);
        }catch (Exception e){
            request.setAttribute("message","Ο καθηγητής δεν βρέθηκε.");
            request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request,response);
        }
    }
}
