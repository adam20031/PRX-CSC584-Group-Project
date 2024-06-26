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
        <title>Court List</title>
        
    </head>
    <body>
        <ul>
        <li><a href="ViewStaffList.jsp">Staff</a></li>
        <li><a href="viewbooks.jsp">Customer Booked</a></li>
        <li><a href="viewCourt.jsp">Court</a></li>
        <li><a href="ViewCustomerList.jsp">Customer Details</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">Log Out</a></li>
        </ul>
        <br><br>
    <center>
        
        <div id = "container">
            
        <div class = "container3">
        <center>
        <br>
        <h1><b>Court List</b></h1>
        <center><h3>PVC Court ID : 1-7</h3></center>
        <center><h3>Rubber Court ID : 8-14</h3></center>
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APP.COURT
                </sql:query>
                    
                <table border="3">
                    <!-- column headers -->
                    <tr>
                        <c:forEach var="columnName" items="${result.columnNames}"> <!--court list title example court_id, price-->
                            <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="row" items="${result.rowsByIndex}"> <!---list database dlm kotak-->
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
                    <br>
                    <a href = "updateCourt.jsp"><input type = "button" value = "Edit" style = "font-size:20px" class="button"></a>
                    <a href = "addCourt.html"><input type = "button" value = "Add Court" style = "font-size:20px" class="button"></a>
                    <a href = "deleteCourt.jsp"><input type = "button" value = "Delete Court" style = "font-size:20px" class="button"></a>
        </div>
        </div>
    </center>
    </body>
</html>
