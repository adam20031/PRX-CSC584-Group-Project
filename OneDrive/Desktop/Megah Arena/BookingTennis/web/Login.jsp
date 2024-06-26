<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="loginTemplate.css" rel="stylesheet" type="text/css" />
        <title>User Login</title>
    </head>
    <body>
        <div>
            <center><h1>Megah Tennis Court</h1></center>
        </div>
        <center>
        <div id = "container">
            <div class="content_box">
            <h2>Customer Login</h2>
            <form action="ConfirmedLogin.jsp" method="POST" >
            <center>
            <table cellspacing="10" cellpadding="8">
	    	<tr><td>Username:</td><td> <input type="text" name="username"/></td></tr>			
		<tr><td>Password:</td><td> <input type="password" name="user_password"/></td></tr>
            </table>
            </center>
                <center><br>
                    <input type="submit" value="Login" class="button" style="font-size:20px;">
                    <input type="reset" value="Clear" class="button" style="font-size:20px;">
                </center>
            <center>
                <br>
                Sign up for free --> <a href="Register.html" style="text-decoration:none;">Register now</a>.
                <br>
                For staff only --> <a href="LoginStaff.jsp" style = "text-decoration:none;">Staff Login</a>.
            </center>
            </form>
            </div>
        </div>
        </center>
    </body>
</html>
