<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource"
    driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/bookingcourt" user="app"
    password="app"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="othersTemplate.css" rel="stylesheet" type="text/css" />
    <link href="MenuBar.css" rel="stylesheet" type="text/css" />
    <title>Booked Court</title>
</head>
<body>
    <ul>
        <li><a href="ViewStaffList.jsp">Staff</a></li>
        <li><a href="viewbooks.jsp">Customer Booked</a></li>
        <li><a href="viewCourt.jsp">Court</a></li>
        <li><a href="ViewCustomerList.jsp">Customer Details</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">Log Out</a></li>
    </ul>
     
    <center>
        <div id="container">
            <div class="container4">
                <center><h1>Booked Court</h1></center>
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT BOOKINGID, DATE, TIME, DURATION, TOTALPRICE, USERNAME, COURT_ID FROM BOOKING
                </sql:query>
                <br>
                <table border="1">
                    <tr>
                        <c:forEach var="columnName" items="${result.columnNames}">
                            <th><c:out value="${columnName}"/></th>
                        </c:forEach>
                    </tr>
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <a href="DeleteBook.jsp"><input type="button" value="Delete" style="font-size:20px" class="button"></a>
            </div>
        </div>
    </center>
</body>
</html>
