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
			<form method="POST" action="ForgetPassword">
				<table style="width:100%">
					<tr>
						<td><h2><b>Forget Password</b></h2></td>
						<td style="text-align:right"><a href="index.jsp"><b>Home</b></a></td>
					</tr>
					<tr>
						<td><b>Email</b></td>
					</tr>
					<tr>
						<td colspan="2" ><input type="email" class="form-control" required name="email" /></td>
					</tr>
					<tr>
						<td><input type="submit" name="login" class="btn login" value="Send Password"/></td>
						<td style="text-align:right"><a class="btn signup" href="Login.jsp">Login</a></td>
					</tr>
					<tr>
						<c:set var="status" value="${param.status}" />
						<td colspan="2"><b>${status}</b></td>
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