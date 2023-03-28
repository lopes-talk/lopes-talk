package io.mahesh.api.model;

import org.springframework.data.mongodb.core.mapping.Document;

import io.mahesh.api.data.entity.UserEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("Users")
public class Users {
    private String _id;

    private String userName;

    private String password;

    private String firstName;

    private String lastName;

    private String pronouns;
    // private Pronouns pronouns;

    private int age;

    // private List<Tasks> dailyTasks;

    /**
     * Id-only contructor
     * 
     * @param _id User ID
     */
    public Users(String _id) {
        this._id = _id;
    }

    /**
     * Converts UserEntity obj ==> UserModel obj
     */
    public Users(UserEntity user) {
        this._id = user.get_id();
        this.userName = user.getUserName();
        this.password = user.getPassword();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.pronouns = user.getPronouns();
        this.age = user.getAge();
    }
}
