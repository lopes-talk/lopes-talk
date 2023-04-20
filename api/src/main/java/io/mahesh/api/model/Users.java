package io.mahesh.api.model;

import io.mahesh.api.data.entity.UserEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
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
    @Size(min = 5, max = 15, message = "Username must be between {min} and {max} characters")
    private String userName;

    @NotNull
    @NotBlank
    @Size(min = 8, max = 15, message = "Password must be between {min} and {max} characters")
    @Pattern(regexp = ".*[!@#$%^&+=].*", message = "Password must contain at least one special character")
    private String password;

    @NotNull
    @NotBlank
    @Size(min = 3, max = 40, message = "First name must be between {min} and {max} characters")
    private String firstName;
    
    @NotNull
    @NotBlank
    @Size(min = 3, max = 40, message = "Last name must be between {min} and {max} characters")
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
