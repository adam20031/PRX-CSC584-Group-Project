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
    <title>My Booked Court</title>
</head>
<body>
    <ul>
        <li><a href="bookCourt.jsp">Court Booking</a></li>
        <li><a href="viewBook.jsp">Booked</a></li>
        <li><a href="ViewProfile.jsp">Profile</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">Log Out</a></li>
    </ul>
    <br><br>
    <center>
        <div id="container">
            <div class="container5">
                <center>
                <br>
                <h1><b>My Booked Court</b></h1>

                <c:set var="username" scope="session" value="${username}"/>
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT BOOKINGID, DATE, TIME, DURATION, TOTALPRICE, USERNAME, COURT_ID FROM APP.BOOKING WHERE USERNAME = '${username}'
                </sql:query>

                <table border="3">
                    <!-- column headers -->
                    <tr>
                        <c:forEach var="columnName" items="${result.columnNames}">
                            <th><c:out value="${columnName}"/></th>
                        </c:forEach>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
                <br>
            </div>
        </div>
    </center>
</body>
</html>
