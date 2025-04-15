package gr.aueb.cf.schoolapp.exceptions;

import java.io.Serial;

public class StudentNotFoundException extends Exception{
    @Serial
    private static final long serialVersionUID = 1L;

    public StudentNotFoundException(String message) {
        super(message);
    }
}
