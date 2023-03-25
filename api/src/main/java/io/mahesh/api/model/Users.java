package io.mahesh.api.model;

import lombok.Data;

@Data
public class Users {
    private int id;
    // @Valid
    // private Credentials creds;

    private String userName;

    private String password;

    private String firstName;

    private String lastName;

    private String pronouns;

    private int age;

    // public Users(int id, Credentials creds, String firstName, String lastName,
    // String pronouns, int age) {
    public Users(int id, String userName, String password, String firstName, String lastName, String pronouns, int age) {
        super();
        this.id = id;
        // this.creds = creds;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.pronouns = pronouns;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // public Credentials getCreds() {
    //     return creds;
    // }

    // public void setCreds(Credentials creds) {
    //     this.creds = creds;
    // }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPronouns() {
        return pronouns;
    }

    public void setPronouns(String pronouns) {
        this.pronouns = pronouns;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
