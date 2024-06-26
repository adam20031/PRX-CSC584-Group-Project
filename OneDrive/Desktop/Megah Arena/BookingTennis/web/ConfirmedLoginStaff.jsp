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
        <title>Staff: Sign In</title>
    </head>

    <body>
        <jsp:useBean id="staff" scope="session" class="staff.staff" />
        <jsp:setProperty name="staff" property="*" />
        

        <%
            ResultSet rs = null;

            String ad_username = request.getParameter("ad_username");
            String admin_password = request.getParameter("admin_password");

           Class.forName("org.apache.derby.jdbc.ClientDataSource");
            String url = "jdbc:derby://localhost:1527/bookingcourt;create=true;user=app;password=app";

            Connection con = DriverManager.getConnection(url);
            PreparedStatement ps = con.prepareStatement("SELECT * from ADMIN where ad_username=? and admin_password=?");

            if ((!(ad_username.equals(null) || ad_username.equals("")) && !(admin_password.equals(null) || admin_password.equals("")))) {
                try {

                    ps.setString(1, ad_username);
                    ps.setString(2, admin_password);

                    rs = ps.executeQuery();

                    if (rs.next()) {
                        ad_username = rs.getString("ad_username");
                        admin_password = rs.getString("admin_password");

                        if (ad_username.equals(ad_username) && admin_password.equals(admin_password)) 
                        {

                            session.setAttribute("ad_username", ad_username);
                            response.sendRedirect("viewbooks.jsp");
                        }
                    } else {
                        out.println("Invalid username and password!");
                    }

                    rs.close();
                    ps.close();
                } catch (SQLException sqe) {
                    out.println(sqe);
                }
            }
        %>
    </body>
</html>
