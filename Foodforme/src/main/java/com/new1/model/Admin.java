package com.new1.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "admins") 
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username; 
    private String password; 
    private String email;    

    
    public Admin() {
        
    }

    public Admin(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
        
    }

   
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

    @Override
    public String toString() {
        return "Admin{" +
               "id=" + id +
               ", username='" + username + '\'' +
               ", password='[PROTECTED]'" + 
               ", email='" + email + '\'' +
               '}';
    }
}