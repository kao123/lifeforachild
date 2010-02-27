package org.lifeforachild.domain;

import java.lang.String;
import org.lifeforachild.domain.Country;
import org.lifeforachild.domain.DiabetesCentre;
import org.lifeforachild.domain.UserGroup;

privileged aspect User_Roo_JavaBean {
    
    public String User.getUsername() {    
        return this.username;        
    }    
    
    public void User.setUsername(String username) {    
        this.username = username;        
    }    
    
    public String User.getPassword() {    
        return this.password;        
    }    
    
    public void User.setPassword(String password) {    
        this.password = password;        
    }    
    
    public boolean User.isEnabled() {    
        return this.enabled;        
    }    
    
    public void User.setEnabled(boolean enabled) {    
        this.enabled = enabled;        
    }    
    
    public UserGroup User.getUserGroup() {    
        return this.userGroup;        
    }    
    
    public void User.setUserGroup(UserGroup userGroup) {    
        this.userGroup = userGroup;        
    }    
    
    public Country User.getCountry() {    
        return this.country;        
    }    
    
    public void User.setCountry(Country country) {    
        this.country = country;        
    }    
    
    public DiabetesCentre User.getCentre() {    
        return this.centre;        
    }    
    
    public void User.setCentre(DiabetesCentre centre) {    
        this.centre = centre;        
    }    
    
}