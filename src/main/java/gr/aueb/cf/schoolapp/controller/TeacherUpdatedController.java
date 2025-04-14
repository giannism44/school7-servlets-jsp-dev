package gr.aueb.cf.schoolapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/teacher-updated")
public class TeacherUpdatedController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("message", "Ο καθηγητής ενημερώθηκε με επιτυχία!");
        request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
    }
}
