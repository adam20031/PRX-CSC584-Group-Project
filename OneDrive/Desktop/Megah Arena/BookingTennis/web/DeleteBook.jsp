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
        <title>Delete Booked</title>
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
        <div class ="container9">
        <c:set var="id" value="${param.id}"/>
        
        <c:if test="${(id!=null)&&(id!='select')}">
            <c:catch var="exception">
                <sql:update var="id" dataSource="${myDatasource}">
                    DELETE FROM BOOKING WHERE BOOKINGID = ?
                    <sql:param value="${id}"/>
                </sql:update>       
            </c:catch>
        </c:if>
             
        <br>
        <form action="DeleteBook.jsp" method="POST">
            ID : <select name="id" style = "font-size:20px">
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT BOOKINGID FROM BOOKING
                </sql:query>
                    
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <c:forEach var="column" items="${row}">
                            <option> <c:out value="${column}" /> </option>
                        </c:forEach>
                    </c:forEach>
            </select> 
            
            <input type="submit" value="Delete" style = "font-size:20px" class="button">
        </form>
                
                <br>
                
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APP.BOOKING
                </sql:query>
                    
                <table border="1">
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
                
        </div>
    </center>
        
    </body>
</html>

