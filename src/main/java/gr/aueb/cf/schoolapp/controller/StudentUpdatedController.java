package gr.aueb.cf.schoolapp.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/student-updated")
public class StudentUpdatedController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("message", "Ο μαθητής ενημερώθηκε με επιτυχία!");
        request.getRequestDispatcher("/WEB-INF/jsp/success2.jsp").forward(request, response);
    }
}
