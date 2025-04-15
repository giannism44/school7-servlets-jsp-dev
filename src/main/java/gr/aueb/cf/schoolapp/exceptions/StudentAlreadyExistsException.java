package gr.aueb.cf.schoolapp.exceptions;

import java.io.Serial;

public class StudentAlreadyExistsException extends Exception{
    @Serial
    private static final long serialVersionUID = 1L;

    public StudentAlreadyExistsException(String message) {
        super(message);
    }
}
