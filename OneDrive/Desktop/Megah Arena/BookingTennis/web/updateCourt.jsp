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
        <title>Update Court</title>
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
            <center><h1><b>Update Court Info</b></h1></center>
        
        <c:set var="courtId" value="${param.courtId}"/>
        <c:set var="courtPrice" value="${param.courtPrice}"/>
        
        <sql:update var="exception" dataSource="${myDatasource}">
            UPDATE APP.COURT
            SET PRICE = ?
            WHERE COURT_ID = ?
            
            <sql:param value="${courtPrice}" />
            <sql:param value="${courtId}" />
        </sql:update>
             
        <center> 
        <form action="updateCourt.jsp" method="POST">
        <br>
            Court ID: <input type ="text" name="courtId" style = "font-size:20px">
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT COURT_ID FROM APP.COURT
                        </sql:query>
                        <br><br>
            Price: <input type="number" name="courtPrice" style = "font-size:20px"><br><br>
            <input type="submit" value="Update" style = "font-size:20px" class="button">
            <a href = "viewCourt.jsp"><input type = "button" value = "View Court" style = "font-size:20px" class="button"></a>
        </form>
        </center>

        </div>
        
        
    </body>
</html>
