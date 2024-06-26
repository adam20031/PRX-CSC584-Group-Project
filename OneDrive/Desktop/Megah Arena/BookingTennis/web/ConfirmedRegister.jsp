<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import= "java.sql.SQLException"%>
<%@page import= "java.sql.PreparedStatement"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Page</title>
    </head>
    <body>
        <jsp:useBean id="cust" scope="session" class="guest.bean.customer" />
        <jsp:setProperty name="cust" property="*" />
        
    

        <!-- Insert into database -->
        <%
            String username = request.getParameter("username");
            String user_fullname = request.getParameter("user_fullname");
            String user_gender = request.getParameter("user_gender");
            String user_number = request.getParameter("user_number");
            String user_password = request.getParameter("user_password");
           
            Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";

            Connection con = DriverManager.getConnection(url);
            PreparedStatement ps = con.prepareStatement("INSERT into GUEST(username, user_fullname, user_password, user_number, user_gender) values(?, ?, ?, ?, ?)");

            ps.setString(1, username);
            ps.setString(2, user_fullname);
            ps.setString(3, user_password);
            ps.setString(4, user_number);
            ps.setString(5, user_gender);

            int statement = ps.executeUpdate();
            
            if (statement == 1) 
            {
                response.sendRedirect("Login.jsp");
                session.setAttribute("username", username);
            } 
            else 
            {
                out.println("Error.. Data not in database!");
            }

        %>
    </body> 
</html>
    

