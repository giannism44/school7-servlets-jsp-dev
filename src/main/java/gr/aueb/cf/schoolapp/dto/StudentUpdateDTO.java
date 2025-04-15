package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class StudentUpdateDTO extends BaseStudentDTO{
    private Integer id;

    public StudentUpdateDTO() {
    }

    public StudentUpdateDTO(String firstname, String lastname, String vat,
                            String fatherName, String phoneNum, String email, String street,
                            String streetNum, String zipCode, Integer cityId, Integer id) {
        super(firstname, lastname, vat, fatherName, phoneNum, email, street, streetNum, zipCode, cityId);
        this.id = id;
    }

    @Override
    public String toString() {
        return "StudentUpdateDTO{" +
                "id=" + id +
                '}' + super.toString();
    }
}
