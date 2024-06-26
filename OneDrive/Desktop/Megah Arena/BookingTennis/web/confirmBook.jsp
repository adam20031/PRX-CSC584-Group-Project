<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="java.io.IOException"%>

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
        // Retrieve parameters from the request
        String bookingId = request.getParameter("bookingId");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String duration = request.getParameter("duration");
        String courtId = request.getParameter("courtId");
        String price = request.getParameter("courtPrice");
        String username = request.getParameter("username");
        
        double dura = 0;
        double pri = 0;
        
        try {
            dura = Double.parseDouble(duration);
            pri = Double.parseDouble(price);
        } catch (NumberFormatException e) {
            out.println("Error: Invalid number format for duration or price.");
        }
        
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";
            con = DriverManager.getConnection(url);

            // Prepare the SQL statement
            String sql = "INSERT INTO BOOKING (bookingId, date, time, totalPrice, duration, court_id, username) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            // Set the parameters
            ps.setString(1, bookingId);
            ps.setString(2, date);
            ps.setString(3, time);
            ps.setDouble(4, dura * pri);
            ps.setDouble(5, dura);
            ps.setString(6, courtId);
            ps.setString(7, username);

            // Execute the statement
            int result = ps.executeUpdate();

            if (result == 1) {
                session.setAttribute("bookingId", bookingId);
                response.sendRedirect("viewBook.jsp");
            } else {
                out.println("Error: Data not inserted into database!");
            }
        } catch (ClassNotFoundException e) {
            out.println("Error: Database driver not found.");
        } catch (SQLException e) {
            out.println("SQL error: " + e.getMessage());
        } finally {
            // Close resources
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    out.println("Error closing PreparedStatement: " + e.getMessage());
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    out.println("Error closing Connection: " + e.getMessage());
                }
            }
        }
    %>
</body>
</html>
