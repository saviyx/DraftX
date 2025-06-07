package lk.jiat.draftx.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "user")
@NamedQueries({
        @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email=:email"),
        @NamedQuery(name = "User.findByEmailAndPassword", query = "SELECT u FROM User u WHERE u.email=:email AND u.password=:password"),
})
public class User {
    @Id
    private String email;
    private String name;
    private String contact;
    private String password;
    private String team_name;


    public User() {
    }

    public User(String email, String name, String contact, String password, String team_name) {
        this.email = email;
        this.name = name;
        this.contact = contact;
        this.password = password;
        this.team_name = team_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTeam_name() {
        return team_name;
    }

    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }
}
