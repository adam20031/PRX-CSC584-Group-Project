/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

/**
 *
 * @author ASUS
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection 
{
    Connection con = null;
    String url = "jdbc:derby://localhost:1527/bookingcourt";
    String username = "app";
    String password = "app";
    

    {
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            }

            catch(ClassNotFoundException e)
            {
                e.printStackTrace();
            }

            try 
            {
                con = DriverManager.getConnection(url,username,password);
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("Printing connection object" + con);

    }
}
