package io.mahesh.api.data.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import io.mahesh.api.model.Users;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

/**
 * User Entity: Represent the User table in the database
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document("Users")
public class UserEntity {
    @Id
    private String _id;

    @NonNull
    @Indexed(unique = true)
    String userName;

    @NonNull
    private String password;

    @NonNull
    private String firstName;

    @NonNull
    private String lastName;

    @NonNull
    private String pronouns;

    private int age;

    /**
     * Converts Users Model ==> UserEntity
     */
    public UserEntity(Users user) {
        this._id = user.get_id();
        this.userName = user.getUserName();
        this.password = user.getPassword();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.pronouns = user.getPronouns();
        this.age = user.getAge();
    }
}
