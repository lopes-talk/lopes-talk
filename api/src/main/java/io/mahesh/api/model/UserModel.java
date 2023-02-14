package io.mahesh.api.model;

import io.mahesh.api.data.entity.UserEntity;
//import javax.validation.Valid;
import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class UserModel {
    private int id;
    // @Valid //should be fixed with line 3. however still having error
    private CredentialsModel creds;

    private String FirstName;

    private String LastName;

    private String Pronouns;

    private int Age;

    /**
     * Id-only contructor
     * 
     * @param id User ID
     */
    public UserModel(int id) {
        this.id = id;
    }

    /**
     * Converts UserEntity-->UserModel obj
     */
    public UserModel(UserEntity user) {
        /** ERROR: method get___() is undefined for the type UserEntity */
        // this.id = user.getUser_id();
        // this.creds = new CredentialsModel(user.getUserName(), user.getPassword());
        // this.FirstName = user.getFirstName();
        // this.LastName = user.getLastname();
        // this.Pronouns = user.getPronouns();
        // this.Age = user.getAge();
    }
}
