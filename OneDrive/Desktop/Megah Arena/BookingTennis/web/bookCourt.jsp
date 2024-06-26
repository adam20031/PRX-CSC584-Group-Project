<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/bookingcourt;create=true" user="app" password="app" />
<!DOCTYPE html>
<html>
<head>
    <title>Book Court</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="othersTemplate.css" rel="stylesheet" type="text/css" />
    <link href="MenuBar.css" rel="stylesheet" type="text/css" />
    <style>
        .container6 {
            width: 45%;
            max-height: 80vh; /* Changed height to max-height for better content fitting */
            position: absolute;
            top: 50%;
            left: 50%;
            background-color: rgba(211, 222, 220, 0.8);
            transform: translate(-50%, -50%);
            border-radius: 20px;
            opacity: 80%;
            color: black;
            padding: 20px; /* Added padding for better spacing inside the container */
            box-sizing: border-box; /* Ensure padding is included in the width/height calculation */
            overflow-y: auto; /* Allows for vertical scrolling if the content overflows */
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse; /* Added to prevent spacing between table cells */
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"] {
            width: calc(100% - 22px); /* Adjust width to fit within the container padding */
            padding: 10px;
            font-size: 20px;
            box-sizing: border-box;
        }
        input[type="submit"], input[type="reset"] {
            font-size: 20px;
            padding: 10px 20px;
            margin-top: 10px; /* Added margin for spacing between buttons and input fields */
        }
    </style>
</head>
<body>

    <c:set var="username" scope="session" value="${username}"/>
    <ul>
        <li><a href="bookCourt.jsp">Court Booking</a></li>
        <li><a href="viewBook.jsp">Booked</a></li>
        <li><a href="ViewProfile.jsp">Profile</a></li>
        <li style="float:right"><a class="active" href="Login.jsp">Log Out</a></li>
    </ul>
    <br><br>

    <center>
        <div id="container">
            <div class="container6">
                <br>
                <div>
                    <center><h1>Book Court</h1></center>
                </div>
                <center><h3>Court List</h3></center>
                <center><h3>Hard Court ID : 1-4</h3></center>
                <center><img src="image/hardcourt.jpg" alt="Hard Court" style="width:50%; height:auto;"/></center>
                <center><h3>Grass Court ID : 5-8</h3></center>
                <center><img src="image/grasscourt.jpg" alt="Grass Court" style="width:50%; height:auto;"/></center>
                <center><h3>Clay Court ID : 9-12</h3></center>
                <center><img src="image/claycourt.jpg" alt="Clay Court" style="width:50%; height:auto;"/></center>
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APP.COURT
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
                <form action="confirmBook.jsp" method="POST">
                    <table cellpadding="3"><br>
                        <tr>
                            <td>Booking Id:</td>
                            <td><input type="text" style="font-size:25px" name="bookingId" required/></td>
                        </tr>
                        <tr>
                            <td>Date:</td>
                            <td><input type="date" style="font-size:25px" name="date" required/></td>
                        </tr>
                        <tr>
                            <td>Time:</td>
                            <td><input type="time" style="font-size:25px" name="time" required/></td>
                        </tr>
                        <tr>
                            <td>Duration:</td>
                            <td><input type="number" style="font-size:25px" name="duration" required/></td>
                        </tr>
                        <tr>
                            <td>Court Id:</td>
                            <td><input type="text" style="font-size:25px" name="courtId" required/></td>
                        </tr>
                        <tr>
                            <td>Court Price:</td>
                            <td><input type="number" style="font-size:25px" name="courtPrice" required/></td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" style="font-size:25px" name="username" required/></td>
                        </tr>
                    </table>
                    <center><br>
                        <input type="submit" style="font-size:20px" value="Book Now" class="button">
                        <input type="reset" style="font-size:20px" value="Clear" class="button">
                    </center>
                </form>
            </div>
        </div>
    </center>
</body>
</html>
