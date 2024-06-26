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
        <title>Update Book</title>
    </head>
    <body >
        <ul>
        <li><a href="ViewStaffList.jsp">STAFF</a></li>
        <li><a href="viewbooks.jsp">BOOK LIST</a></li>
        <li><a href="newBook.jsp">ADD NEW BOOK</a></li>
        <li><a href="ViewCustomerList.jsp">CUSTOMER LIST</a></li>
        <li><a href="borrowedBook.jsp">BORROWED LIST</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">LOG OUT</a></li>
        </ul>
        <br><br>
        <div class="container12">
            <br>
            <center><h1><b>UPDATE BOOK</b></h1></center>
        
        <c:set var="book_id" value="${param.book_id}"/>
        <c:set var="book_seriesNo" value="${param.book_seriesNo}"/>
        <c:set var="book_availability" value="${param.book_availability}"/>
        
        <sql:update var="exception" dataSource="${myDatasource}">
            UPDATE BOOK
            SET BOOK_SERIESNO = ?, BOOK_AVAILABILITY = ?
            WHERE BOOK_ID = ?
            
            <sql:param value="${book_seriesNo}"/>
            <sql:param value="${book_availability}"/>
            <sql:param value="${book_id}" />
        </sql:update>
             
        <center> 
        <form action="UpdateBook.jsp" method="POST">
        <br>
        ID : <select name="book_id" style = "font-size:20px">
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT BOOK_ID FROM BOOK
                </sql:query>
                    
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <c:forEach var="column" items="${row}">
                            <option> <c:out value="${column}" /> </option>
                        </c:forEach>
                    </c:forEach>
                 </select><br><br>
            
            SERIES NUMBER : <input type="text" name="book_seriesNo" style = "font-size:20px"><br><br>
            AVAILABLE : <select name='book_availability' style = "font-size:20px">
                        <option value ="yes" style = "font-size:20px">Yes</option>
                        <option value ="no" style = "font-size:20px">No</option>
                        </select><br><br><br><br>
            <input type="submit" value="UPDATE" style = "font-size:20px">
            <a href = "viewbooks.jsp"><input type = "button" value = "VIEW BOOK" style = "font-size:20px"></a>
        </form>
        </center>

        </div>
        
        
    </body>
</html>
