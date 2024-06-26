/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package guest.bean;
import java.io.Serializable;

public class customer implements Serializable
{
    private String username;
    private String user_fullname;
    private String user_gender;
    private String user_number;
    private String user_password;
    
     public customer()  
     {
        
        username = null;
        user_fullname = null;
        user_gender = null;
        user_number = null;
        user_password = null;
    }
    
    
    public customer(String username, String user_fullname, String user_gender, String user_number, String user_password)
    {
        this.username = username;
        this.user_fullname = user_fullname;
        this.user_gender = user_gender;
        this.user_number = user_number;
        this.user_password = user_password;
    }
    
    public String getUsername()
    {
        return username;
    }
    
    public String getName()
    {
        return user_fullname;
    }
    
    public String getGender()
    {
        return user_gender;
    }
    
    public String getPhoneNo()
    {
        return user_number;
    }
    
    public String getPassword()
    {
        return user_password;
    }
    
    public void setUsername (String username)
    {
        this.username = username;
    }
    
    public void setName (String user_fullname)
    {
        this.user_fullname = user_fullname;
    }
    
    public void setGender (String user_gender)
    {
        this.user_gender = user_gender;
    }
    
    public void setPhoneNo (String user_number)
    {
        this.user_number = user_number;
    }
    
    public void setPassword (String user_password)
    {
        this.user_password = user_password;
    }
}
