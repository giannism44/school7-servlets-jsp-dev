package gr.aueb.cf.schoolapp.controller;


import gr.aueb.cf.schoolapp.dao.IStudentDAO;
import gr.aueb.cf.schoolapp.dao.StudentDAOImpl;
import gr.aueb.cf.schoolapp.dto.FiltersDTO;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.service.IStudentService;
import gr.aueb.cf.schoolapp.service.StudentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/school-app/students/view")
public class StudentViewController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<StudentReadOnlyDTO> studentReadOnlyDTOS;

        String filterFirstname = request.getParameter("firstname");
        filterFirstname = filterFirstname == null ? "" : filterFirstname;

        String filterLastname = request.getParameter("lastname");
        filterLastname = filterLastname == null ? "" : filterLastname;

        FiltersDTO filters = new FiltersDTO(filterFirstname, filterLastname);

        String message = "";

        try{
            studentReadOnlyDTOS = studentService.getFilteredStudent(filters);

            if (studentReadOnlyDTOS.isEmpty()) {
                request.setAttribute("message", "Students not found");
                request.getRequestDispatcher("/WEB-INF/jsp/students-view.jsp").forward(request, response);
                return;
            }

            request.setAttribute("students", studentReadOnlyDTOS);
            request.getRequestDispatcher("/WEB-INF/jsp/students-view.jsp").forward(request, response);
        }catch (StudentDAOException e){
            message = e.getMessage();
            request.setAttribute("message" , message);
            request.getRequestDispatcher("/WEB-INF/jsp/students-view.jsp").forward(request, response);
        }
    }
}
