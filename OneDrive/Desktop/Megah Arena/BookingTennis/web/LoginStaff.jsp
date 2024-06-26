<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="loginTemplate.css" rel="stylesheet" type="text/css" />
        <title>Staff Login</title>
    </head>
    <body>
        <div>
        <center><h1>Megah Tennis Court</h1></center>
        </div>
    <center>    
    <div id = "container">
        <div class="content_box">
        <h2>Staff Login</h2>
        <form action="ConfirmedLoginStaff.jsp" method="POST">
            <table cellspacing="10" cellpadding="8">	
	    	<tr><td>Username:</td><td> <input type="text" name="ad_username"/></td></tr>			
		<tr><td>Password:</td><td> <input type="password" name="admin_password"/></td></tr>
            </table>
            
            <center><br>
                <input type="submit" style = "font-size:20px" class="button" value="Login">		
                <input type="reset" style = "font-size:20px" class="button" value="Clear">
            </center>
            <br>
            <center>
                For customer use only --> <a href="Login.jsp" style = "text-decoration:none;">Customer Login</a>.
            </center>
        </div>
	</form>
    </div>
    </center>
    </body>
</html>
