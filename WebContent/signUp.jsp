<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="stylesheet/signUp.css" rel="stylesheet" type="text/css"/>
<script src="javascript/angular.min.js"></script>
<script src="javascript/signUp.js"></script>
</head>
<body ng-app="myapp" ng-controller="myctrl">
	<div class="wrapper">
		<form method="POST" action="SignUp" >
			<table>
				<tr>
					<td><h2><b>SignUp</b></h2></td>
					<td style="text-align:right">
						<a href="index.jsp" class="myclose"><b>Home</b></a>
					</td>
				</tr>
				<tr>
					<td><b>Name</b></td>
					<td><input type="text" required pattern="[a-zA-Z ]+" title="Invalid Name Format" name="name" class="form-control"/></td>
				</tr>
				<tr>
					<td><b>Gender</b></td>
					<td>
						<input type="radio" name="gender" value="Male" checked="checked"/><b>Male</b>&nbsp;&nbsp;
						<input type="radio" name="gender" value="Female" /><b>Female</b>
					</td>
				</tr>
				<tr>
					<td><b>Email</b></td>
					<td>
						<input type="email" name="email" required ng-change="checkEmail();" id="email" class="form-control" ng-model="postEmail.email"/>
						<br>
						<p ng-show="emailMessage" class="error"><small><b>Email Already Registered</b></small></p>
					</td>
				</tr>
				<tr>
					<td><b>Password</b></td>
					<td>
						<input type="password" name="password" required required pattern=".{6,}" title="Password must be six character long" id="password" ng-keyup="confirmPassword();" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td><b>Confirm Password</b></td>
					<td>
						<input type="password" name="confpassword" required pattern=".{6,}" title="Password must be six character long" id="confpassword" ng-keyup="confirmPassword();" class="form-control"/>
						<br>
						<p ng-show="passwordMessage" class="error"><small><b>Confirm Your Password</b></small></p>
					</td>
				</tr>
				<tr>
					<td><input type="submit" name="add" value="SignUp" ng-disabled="flag" class="btn btnsubmit"/></td>
				</tr>
			</table>
		</form>
	</div>
	<video autoplay loop muted play-inline class="mybackground" >
		<source src="videos/background.mp4" type="video/mp4" />
	</video>
</body>
</html>