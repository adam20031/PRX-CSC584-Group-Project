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
            String ad_username = request.getParameter("ad_username");
            String admin_fullname = request.getParameter("admin_fullname");
            String admin_gender = request.getParameter("admin_gender");
            String admin_number = request.getParameter("admin_number");
            String admin_password = request.getParameter("admin_password");
           
            Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";

            Connection con = DriverManager.getConnection(url);
            PreparedStatement ps = con.prepareStatement("INSERT into ADMIN(ad_username, admin_fullname, admin_gender, admin_number, admin_password) values(?, ?, ?, ?, ?)");

            ps.setString(1, ad_username);
            ps.setString(2, admin_fullname);
            ps.setString(3, admin_gender);
            ps.setString(4, admin_number);
            ps.setString(5, admin_password);

            int statement = ps.executeUpdate();
            
            if (statement == 1) 
            {
                response.sendRedirect("ViewStaffList.jsp");
                session.setAttribute("ad_username", ad_username);
            } 
            else 
            {
                out.println("Error.. Data not in database!");
            }

        %>
    </body> 
</html>
    

