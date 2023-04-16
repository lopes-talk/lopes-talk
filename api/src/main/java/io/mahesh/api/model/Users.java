package io.mahesh.api.model;
import io.mahesh.api.data.entity.UserEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    private String id;

    @NonNull
    private String userName;

    @NonNull 
    private String password;

    @NonNull
    private String firstName;
    
    @NonNull
    private String lastName;

    @NonNull
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
