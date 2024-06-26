/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;
import java.io.Serializable;


public class staff implements Serializable
{
    private String ad_username;
    private String admin_fullname;
    private String admin_gender;
    private String admin_number;
    private String admin_password;
    
     public staff()  
     {
        
        ad_username = null;
        admin_fullname = null;
        admin_gender = null;
        admin_number = null;
        admin_password = null;
    }
    
    
    public staff(String ad_username, String admin_fullname, String admin_gender, String admin_number, String admin_password)
    {
        this.ad_username = ad_username;
        this.admin_fullname = admin_fullname;
        this.admin_gender = admin_gender;
        this.admin_number = admin_number;
        this.admin_password = admin_password;
    }
    
    public String getUsername()
    {
        return ad_username;
    }
    
    public String getName()
    {
        return admin_fullname;
    }
    
    public String getGender()
    {
        return admin_gender;
    }
    
    public String getPhoneNo()
    {
        return admin_number;
    }
    
    public String getPass()
    {
        return admin_password;
    }
    
    public void setUsername (String ad_username)
    {
        this.ad_username = ad_username;
    }
    
    public void setName (String admin_fullname)
    {
        this.admin_fullname = admin_fullname;
    }
    
    public void setPhoneNo (String admin_number)
    {
        this.admin_number = admin_number;
    }
    
    public void setGender (String admin_gender)
    {
        this.admin_gender = admin_gender;
    }    
    
    public void setPass (String admin_password)
    {
        this.admin_password = admin_password;
    
    }
}
