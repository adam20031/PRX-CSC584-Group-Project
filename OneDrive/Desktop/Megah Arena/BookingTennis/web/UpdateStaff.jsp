<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/bookingcourt;create=true" user="app" password="app" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="othersTemplate.css" rel="stylesheet" type="text/css" />
        <link href="MenuBar.css" rel="stylesheet" type="text/css" />
        <title>Update Admin</title>
    </head>
    <body >
        <ul>
        <li><a href="ViewStaffList.jsp">Staff</a></li>
        <li><a href="viewbooks.jsp">Customer Booked</a></li>
        <li><a href="viewCourt.jsp">Court</a></li>
        <li><a href="ViewCustomerList.jsp">Customer Details</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">Log Out</a></li>
        </ul>
        <br><br>
        <div class="container2">
            <br><br>
            <center><h1><b>Update Staff Info</b></h1></center>
        
        <c:set var="ad_username" value="${param.ad_username}"/>
        <c:set var="admin_fullname" value="${param.admin_fullname}"/>
        <c:set var="admin_password" value="${param.admin_password}"/>
        
        <sql:update var="exception" dataSource="${myDatasource}">
            UPDATE APP.ADMIN
            SET ADMIN_FULLNAME = ?, ADMIN_PASSWORD = ?
            WHERE AD_USERNAME = ?
            
            <sql:param value="${admin_fullname}" />
            <sql:param value="${admin_password}" />
            <sql:param value="${ad_username}" />
        </sql:update>
             
        <center> 
        <form action="UpdateStaff.jsp" method="POST">
        <br>
            Username: <input type ="text" name="ad_username" style = "font-size:20px">
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT AD_USERNAME FROM APP.ADMIN
                        </sql:query>
                        <br><br>
            Name: <input type="text" name="admin_fullname" style = "font-size:20px"><br><br>
            Password: <input type="password" name="admin_password" style = "font-size:20px"/><br><br>
            <input type="submit" value="Update" style = "font-size:20px" class="button">
            <a href = "ViewStaffList.jsp"><input type = "button" value = "View Staff" style = "font-size:20px" class="button"></a>
        </form>
        </center>

        </div>
        
        
    </body>
</html>
