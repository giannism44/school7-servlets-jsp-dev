package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.authentication.AuthenticationProvider;
import gr.aueb.cf.schoolapp.dao.ITeacherDAO;
import gr.aueb.cf.schoolapp.dao.IUserDAO;
import gr.aueb.cf.schoolapp.dao.TeacherDAOImpl;
import gr.aueb.cf.schoolapp.dao.UserDAOImpl;
import gr.aueb.cf.schoolapp.exceptions.UserDAOException;
import gr.aueb.cf.schoolapp.dto.UserLoginDTO;
import gr.aueb.cf.schoolapp.service.ITeacherService;
import gr.aueb.cf.schoolapp.service.IUserService;
import gr.aueb.cf.schoolapp.service.TeacherServiceImpl;
import gr.aueb.cf.schoolapp.service.UserServiceImpl;
import gr.aueb.cf.schoolapp.exceptions.UserNotFoundException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private final IUserDAO userDAO = new UserDAOImpl();
    private final IUserService userService = new UserServiceImpl(userDAO);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("WEB-INF/jsp/login2.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ADMIN_TIMEOUT = 30 * 60; // 30 mins
        // Data binding
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserLoginDTO userLoginDTO = new UserLoginDTO(username, password);

        boolean principleIsAuthenticated = false;
        try {
            principleIsAuthenticated = AuthenticationProvider.authenticate(userLoginDTO);

            if (!principleIsAuthenticated) {
                request.setAttribute("error", "Invalid credentials");
                request.getRequestDispatcher("/WEB-INF/jsp/login2.jsp").forward(request, response);
                return;
            }

            HttpSession oldSession = request.getSession(false);
            // no session exists before
            // we explicitly create a session with getSession(true)
            // that is that tomcat creates a jsessionid, but does not store it to backend
            // session object. it is just a placeholder. to create a session object and
            // thus create state at backend you have to call getSession(true) or getSession()
            if (oldSession != null) {
                oldSession.invalidate(); // Destroy attacker's session
            }
            HttpSession session = request.getSession(true); // create a session object
            session.setAttribute("authenticated", true);
            session.setAttribute("username", username);
            session.setAttribute("role", userService.getUserByUsername(username).getRoleType().name());

            if (session.getAttribute("role").equals("ADMIN")) { // overwrites web.xml
                session.setMaxInactiveInterval(ADMIN_TIMEOUT);  // Admin get 30-min sessions
            }

            //response.sendRedirect(request.getContextPath() + "/school-app/dashboard");
            response.sendRedirect(request.getContextPath() + "/school-app/dashboard");


//                response.sendRedirect(request.getContextPath() + "/login?isError=true");

        } catch (UserDAOException | UserNotFoundException e) {
            //response.sendRedirect(request.getContextPath() + "/login?isError=true");
            request.setAttribute("error", "Authentication Error");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        }
    }
}
