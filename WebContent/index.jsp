<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="user.UserBean" %>
<%@ page import="user.UserBasicInfo" %>
<%@ page import="control.Category" %>
<%@ page import="control.GetCategory" %>
<%@ page import="post.NEWS_HEADLINES" %>
<%@ page import="user.PostBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Democratic</title>
<!-- ------------------------------------ External Links ------------------------------------ -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="http://vjs.zencdn.net/6.2.8/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="javascript/angular.min.js"></script>
<script src="javascript/myModule.js"></script>
<script src="javascript/GetIndexPost.js"></script>
<link rel="stylesheet" href="stylesheet/index.css">
<!-- ------------------------------------------------------------------------------------------ -->
<c:set var="id" value="${cookie.DEMOCRATIC_User_id.value}" />
<c:set var="userObject" value="${UserBasicInfo.getUserdata(id)}" />
</head>
<body ng-app="myapp">
	<!-- ============= upper navigation bar ================= -->
	<nav class="navbar mynavbar" id="home">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Democratic</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${id!=null}">
					<li><a href="UserDashboard.jsp">Welcome ${userObject.getUserName()}</a></li>
					<li><a href="UserLogoutController">Logout</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="signUp.jsp">Signup</a></li>
					<li><a href="Login.jsp">Login</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	</nav>
	<!-- ============= upper navigation bar end ============= -->
	<!-- ================== Header start ==================== -->
	<haeder class="col-sm-12 myheader" >
		<center><h1><b>Democratic&nbsp;&nbsp;<small>Powered By CUTM</small></b></h1></center>
	</haeder>
	<!-- =================== Header End ===================== -->
	<!-- ==================== Main Image Slider =================== -->
	<div style="height:30%">
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top:0px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
      <li data-target="#myCarousel" data-slide-to="8"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active" style="height:500px">
        <img src="images/sports.jpg" alt="Sports News" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/tech.jpg" alt="Technology" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/poli.jpg" alt="Politics" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/food.jpg" alt="Food" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/education.jpg" alt="Education" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/automobile.jpg" alt="Education" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/business.png" alt="Business" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/environment.jpg" alt="Environment" style="width:100%">
      </div>
      <div class="item" style="height:500px" >
        <img src="images/entertainment.jpg" alt="Entertainment" style="width:100%">
      </div>
    </div>
  </div>
  </div>
  <!-- ==================== Main Image Slider End =================== -->
  <!-- ==================== My Navigation Bar ======================= -->
  <c:set var="Category" value="${GetCategory.category()}" />
  <div ng-controller="GET_INDEX_POST">
	<div class="col-sm-12">
		<center>
			<ul class="category">
				<li><b><a href="#home">Home</a></b></li>
 				<c:forEach var="object" items="${Category}">
 				<li><b><a href="#mycontent" ng-click="getNews(${object.getCategoryId()})">${object.getCategoryName()}</a></b></li>
 				</c:forEach>
	 		</ul>
 		</center>
	</div>
	<div>
		<center>
		<ul class="selectPost">
		<li><input type="radio" ng-model="tablename" value="adminpost"/>&nbsp;<b>People</b></li>
		<li><input type="radio" ng-model="tablename" value="userpost"/>&nbsp;<b>Democratic</b></li>
		<li><input type="radio" ng-model="tablename" value=""/>&nbsp;<b>All</b></li>
		</ul>
		</center>
	</div>
	<div class="container">
		<div>
			<div>
				<h1 style="color:  #34495e"><b>Welcome To Democratic&nbsp;&nbsp;&nbsp;<small>Powered By CUTM</small></b></h1>
				<h4 style="color: #922b21"><b>Headlines</b></h4>
				<c:set var="mylist" value="${NEWS_HEADLINES.getHeadlines()}" />
				<marquee>
					<c:forEach var="elements" items="${mylist}">
						<small style="color: #2471a3"><b>${elements.getPostName()}&nbsp;&nbsp;&nbsp;</b></small>
					</c:forEach>
				</marquee>
			</div>
			<div  class="sm-col-12 mycontent" id="mycontent" ng-cloak="" >			      	
		      	<table ng-repeat="x in mylist" ng-hide="x.tablename==tablename" class="table" >
		      		<tr>
		      			<td colspan="2"><h3 style="color: #34495e"><b>{{x.name}}</b></h3></td>
		      		</tr>
		      		<tr>
		      			<td style="width:30%">
	      					<table>
		      					<tr>
						      		<td style="padding:1%"><image src="GET_POST_MEDIA?requestFileIndex=1&requestId={{x.postId}}&requestTableName={{x.tablename}}" height="200px" width="400px" /></td>
					      		</tr>
					      		<tr>
					      			<td style="padding:1%"><image src="GET_POST_MEDIA?requestFileIndex=2&requestId={{x.postId}}&requestTableName={{x.tablename}}" height="200px" width="400px" /></td>
					      		</tr>
				      		</table>
		      			</td>
		      			<td style="width:70%">
		      				<table style="width:100%">
					      		<tr>
						      		<td><textarea class="form-control" rows="20" disabled style="color: #212f3c;font-weight: bold;">{{x.body}}</textarea></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
							<td colspan="2"> 
							<button data-toggle="collapse" data-target="#post{{x.postId}}video" class="btn btn-primary">Video</button>
							<div id="post{{x.postId}}video" class="collapse">
								 <video id="my-video" class="video-js" controls preload="auto" width="500" height="240" data-setup="{}">
	   								<source src="GET_POST_MEDIA?requestFileIndex=3&requestId={{x.postId}}&requestTableName={{x.tablename}}" type='video/mp4'>
	    							<source src="GET_POST_MEDIA?requestFileIndex=3&requestId={{x.postId}}&requestTableName={{x.tablename}}" type='video/webm'>
	 							 </video>
							</div> 
						</td>
					</tr>
				</table>
		      </div>
	      </div>
      </div>
</div>
<footer style="" class="myfooter">
		<center><h1>Thankyou To Join Us&nbsp;&nbsp;&nbsp;<small><b>Powered By CUTM</b></small></h1></center>
	</footer>
  <!-- ==================== My Navigation Bar ======================= -->
</body>
</html>