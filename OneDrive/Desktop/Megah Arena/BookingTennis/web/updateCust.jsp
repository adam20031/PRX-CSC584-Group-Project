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
        <title>Update Customer</title>
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
        <div class="container6">
            <br><br>
            <center><h1><b>Update Customer Info</b></h1></center>
        
        <c:set var="username" value="${param.username}"/>
        <c:set var="user_fullname" value="${param.user_fullname}"/>
        <c:set var="user_password" value="${param.user_password}"/>
        <c:set var="user_number" value="${param.user_number}"/>
        <c:set var="user_gender" value="${param.user_gender}"/>
        
        <sql:update var="exception" dataSource="${myDatasource}">
            UPDATE APP.GUEST
            SET USER_FULLNAME = ?, USER_PASSWORD = ?, USER_NUMBER = ?, USER_GENDER = ?
            WHERE USERNAME = ?
            
            <sql:param value="${user_fullname}" />
            <sql:param value="${user_password}" />
            <sql:param value="${user_number}" />
            <sql:param value="${user_gender}" />
            <sql:param value="${username}" />
        </sql:update>
             
        <center> 
        <form action="updateCust.jsp" method="POST">
        <br>
            Username: <input type ="text" name="username" style = "font-size:20px">
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT USERNAME FROM APP.GUEST
                        </sql:query>
                        <br><br>
            Full Name: <input type="text" name="user_fullname" style = "font-size:20px"><br><br>
            Gender Type: &nbsp&nbsp <select type="text" style = "font-size:20px" name="user_gender" />
                     <option value='male'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Male &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp    </option>
                     <option value='female'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Female &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </option></select>
                <br><br>
            Phone Number: <input type="text" name="user_fullname" style = "font-size:20px"><br><br>
            Password: <input type="password" name="user_password" style = "font-size:20px"/><br><br>
            <input type="submit" value="Update" style = "font-size:20px" class="button">
            <a href = "ViewCustomerList.jsp"><input type = "button" value = "View Cust" style = "font-size:20px" class="button"></a>
        </form>
        </center>

        </div>
        
        
    </body>
</html>
