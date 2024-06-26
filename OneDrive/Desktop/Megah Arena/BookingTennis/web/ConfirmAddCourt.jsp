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
            String courtId = request.getParameter("courtId");
            String courtPrice = request.getParameter("courtPrice");
           
            Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";

            Connection con = DriverManager.getConnection(url);
            PreparedStatement ps = con.prepareStatement("INSERT into COURT(court_id, price) values( ?, ?)");

            ps.setString(1, courtId);
            ps.setString(2, courtPrice);

            int statement = ps.executeUpdate();
            
            if (statement == 1) 
            {
                response.sendRedirect("viewCourt.jsp");
                session.setAttribute("courtId", courtId);
            } 
            else 
            {
                out.println("Error.. Data not in database!");
            }

        %>
    </body> 
</html>