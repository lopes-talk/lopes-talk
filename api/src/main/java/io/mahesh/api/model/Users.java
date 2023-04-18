package io.mahesh.api.model;

import io.mahesh.api.data.entity.UserEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private String id;

    @NotNull
    @NotBlank
    private String userName;

    @NotNull
    @NotBlank
    private String password;

    @NotNull
    @NotBlank
    private String firstName;
    
    @NotNull
    @NotBlank
    private String lastName;

    @NotNull
    @NotBlank
    private String pronouns;

    /**
     * Id-only contructor
     * 
     * @param _id User ID
     */
    public Users(String id) {
        this.id = id;
    }

    /**
     * Converts UserEntity obj ==> User Model obj
     */
    public Users(UserEntity user) {
        this.id = user.getId();
        this.userName = user.getUserName();
        this.firstName = user.getFirstName();
        this.lastName = user.getLastName();
        this.pronouns = user.getPronouns();
    }
}
