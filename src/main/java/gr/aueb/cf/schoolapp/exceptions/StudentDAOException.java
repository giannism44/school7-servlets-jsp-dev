package gr.aueb.cf.schoolapp.exceptions;

import java.io.Serial;

public class StudentDAOException extends Exception{
    @Serial
    private static final long serialVersionUID = 1L;

    public TeacherDAOException(String s) {
        super(s);
    }
}
