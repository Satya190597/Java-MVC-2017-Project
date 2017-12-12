<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link  href="stylesheet\Login.css" rel="stylesheet"/>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Login User</title>
</head>
<body>
	<center>
		<div style="width:30%" class="loginform">
			<form method="POST" action="UserLoginController">
				<table style="width:100%">
					<tr>
						<td><h2><b>Login User</b></h2></td>
						<td style="text-align:right"><a href="index.jsp"><b>Home</b></a></td>
					</tr>
					<tr>
						<td><b>Email</b></td>
					</tr>
					<tr>
						<td colspan="2" ><input type="email" class="form-control" required name="email" /></td>
					</tr>
					<tr>
						<td><b>Password</b></td>
					</tr>
					<tr>
						<td colspan="2" ><input type="password" class="form-control" required name="password" /></td>
					</tr>
					<tr>
						<c:set var="message" value='${requestScope["errormessage"]}' />
						<td colspan="2"><c:if test="${not empty message}"><b><span>Invalid Email Or Password</span></b></c:if></td>
					</tr>
					<tr>
						<td><input type="submit" name="login" class="btn login" value="Login"/></td>
						<td style="text-align:right"><a class="btn signup" href="signUp.jsp">Sign Up</a></td>
					</tr>
					<tr>
						<td colspan="2"><c:if test="${not empty message}"><a class="forgetpassword" href="ForgetPassword.jsp">Forget Password</a></c:if></td>
					</tr>
				</table>
			</form>
		</div>
	</center>
	<video autoplay loop muted play-inline class="mybackground" >
		<source src="videos/background.mp4" type="video/mp4" />
	</video>
</body>
</html>