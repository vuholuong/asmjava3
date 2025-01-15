package entities;

import java.io.Serializable;

public class User implements Serializable {
	
    private int userId;       // user_id
    private String name;      // name
    private String email;     // email
    private String password;   // password
    private String role;      // role

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public boolean isBoss() {
    	return this.role.equalsIgnoreCase("LECTURER");
    }
}
