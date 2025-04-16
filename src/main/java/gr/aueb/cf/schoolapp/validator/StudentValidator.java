package gr.aueb.cf.schoolapp.validator;

import gr.aueb.cf.schoolapp.dto.BaseStudentDTO;

import java.util.HashMap;
import java.util.Map;

public class StudentValidator<T> {

    private StudentValidator(){

    }

    public static <T extends BaseStudentDTO> Map<String, String> validate(T dto){
        Map<String, String> errors = new HashMap<>();

        if (dto.getFirstname().length() < 2 || dto.getFirstname().length() > 32) {
            errors.put("firstname", "Το όνομα πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getFirstname().matches("^.*\\s+.*$")) {
            errors.put("firstname", "Το όνομα δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getLastname().length() < 2 || dto.getLastname().length() > 32) {
            errors.put("lastname", "Το επώνυμο πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getLastname().matches("^.*\\s+.*$")) {
            errors.put("lastname", "Το επώνυμο δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getVat().length() < 9 || dto.getVat().length() > 12) {
            errors.put("vat", "Το ΑΦΜ πρέπει να είναι μεταξύ 9 και 12 ψηφία");
        }

        if (dto.getVat().matches("^.*\\s+.*$")) {
            errors.put("vat", "Το ΑΦΜ δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getFatherName().length() < 2 || dto.getFatherName().length() > 32) {
            errors.put("fathername", "Το Επώνυμο Πατρός πρέπει να είναι μεταξύ 2 και 32 ψηφία");
        }

        if (dto.getFatherName().matches("^.*\\s+.*$")) {
            errors.put("fathername", "Το Επώνυμο Πατρός δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getPhoneNum().length() < 8 || dto.getPhoneNum().length() > 15) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου πρέπει να είναι μεταξύ 8 και 15 ψηφία");
        }

        if (dto.getPhoneNum().matches("^.*\\s+.*$")) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου δεν πρέπει να περιλαμβάνει κενά");
        }


        // More validations

        return errors;
    }
}
