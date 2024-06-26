<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer: Sign In</title>
    </head>

    <body>
        <jsp:useBean id="cust" scope="session" class="guest.bean.customer" />
        <jsp:setProperty name="cust" property="*" />
        

        <%
            ResultSet rs = null;

            String username = request.getParameter("username");
            String user_password = request.getParameter("user_password");

            Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";

            Connection con = DriverManager.getConnection(url);
            PreparedStatement ps = con.prepareStatement("SELECT * from GUEST where username=? and user_password=?");

            if ((!(username.equals(null) || username.equals("")) && !(user_password.equals(null) || user_password.equals("")))) 
            {
                try 
                {
                    ps.setString(1, username);
                    ps.setString(2, user_password);

                    rs = ps.executeQuery();

                    if (rs.next()) 
                    {
                        username = rs.getString("username");
                        user_password = rs.getString("user_password");

                        if (username.equals(username) && user_password.equals(user_password)) 
                        {

                            session.setAttribute("username", username);
                            session.setAttribute("user_password", user_password);
                            response.sendRedirect("bookCourt.jsp");
                        }
                    } 
                    else 
                    {
                        out.println("Invalid username or password!");
                    }

                    rs.close();
                    ps.close();
                } 
                catch (SQLException sqe) 
                {
                    out.println(sqe);
                }
            }
        %>
    </body>
</html>

