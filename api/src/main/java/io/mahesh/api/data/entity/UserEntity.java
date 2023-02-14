package io.mahesh.api.data.entity;

import io.mahesh.api.model.UserModel;
import io.micrometer.common.lang.NonNull;
import jakarta.persistence.Column;
import jakarta.persistence.Id;

/**
 * User Entity: users information
 */
public class UserEntity {
    @Id
    private int User_id;

    @Column
    @NonNull
    String UserName;

    @Column
    @NonNull
    private String Password;

    @Column
    @NonNull
    private String FirstName;

    @Column
    @NonNull
    private String LastName;

    @Column
    @NonNull
    private String Pronouns;

    @Column
    @NonNull
    private int Age;

    /**
     * Converts UserModel-->UserEntity
     */
    public UserEntity(UserModel user) {
        this.User_id = user.getId();
        this.UserName = user.getCreds().getUserName();
        this.Password = user.getCreds().getPassword();
        this.FirstName = user.getFirstName();
        this.LastName = user.getLastName();
        this.Pronouns = user.getPronouns();
        this.Age = user.getAge();
    }
}
