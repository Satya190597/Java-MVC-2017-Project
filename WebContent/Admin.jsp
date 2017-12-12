<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="uikit/css/uikit.min.css" />
<script src="uikit/js/uikit.min.js"></script>
<script src="uikit/js/uikit-icons.min.js"></script>
<script src="javascript/addNews.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="control.GetCategory" %>
<%@ page import="admin.AdminBean" %>
<%@ page import="admin.GetDiscussion" %>
<%@ page import="control.GetCategory" %>
<%@ page import="admin.DiscussionBean" %>
<%@ page import="post.POST_BEAN" %>
<%@ page import="post.GET_POST_MEDIA" %>
<%@ page import="user.GetUserName" %>
<title>Insert title here</title>
<script>	
	function ToggleVerifyContenet(id)
	{
		var status=document.getElementById(id).style.display
		if(status=='none')
		{
			document.getElementById(id).style.display='block';
		}
		else
		{
			document.getElementById(id).style.display='none';
		}
	}
	function ToggleDiscussion(id)
	{
		var status=document.getElementById(id).style.display
		if(status=='none')
		{
			document.getElementById(id).style.display='block';
		}
		else
		{
			document.getElementById(id).style.display='none';
		}
	}
	function GoToVerifyPost()
	{
		document.getElementById("VerifyPost").click();
	}
	function GoToUnVerifyPost()
	{
		document.getElementById("UnVerifyPost").click();
	}
</script>
</head>
<body>
	<c:set var="myvalue_one" value='${param["goto"]}'></c:set>
	<c:set var="myvalue_two" value='${param["gotonext"]}'></c:set>
	<c:set var="myobject" value="${sessionScope['adminObject']}"></c:set>
	<c:if test="${myobject==null}">
		 <c:redirect url = "adminLogin.jsp"/>
	</c:if>
	<div class="uk-container">
		<div class="uk-tile uk-tile-primary"><h2>Welcome Admin</h2>&nbsp;&nbsp;&nbsp;<small>Democratic Powered By CUTM</small></div>
		<ul class="uk-subnav uk-subnav-pill" uk-switcher="animation: uk-animation-slide-left-medium, uk-animation-slide-right-medium">
    		<li><a href="#" >Add Post</a></li>
    		<li><a href="#">Add Discussion</a></li>
    		<li><a href="#">All Discussion</a></li>
    		<li><a href="#" id="VerifyPost">Verify Post</a></li>
    		<li><a href="#" id="UnVerifyPost">UnVerify Post</a></li>
		</ul>
		<ul class="uk-switcher uk-margin">
		    <li>
		    	<div>
		    		<h2><b>Add Your Post</b></h2>
					<form action="AdminAddPost" method="POST" enctype="multipart/form-data" class="uk-form-stacked">
							<div class="uk-margin">
								<div><label class="uk-form-label"><b>Post Name</b></label></div>
								<div class="uk-form-controls"><input type="text" name="name" class="uk-input" required id="input1"/></div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Post Category</b></label>
								<div class="uk-controls">
									<select name="category" class="uk-select" style="width:30%">
										<c:set var="list" value="${GetCategory.category()}" />
										<c:forEach items="${list}" var="element">
										<option value="${element.getCategoryId()}" >${element.getCategoryName()}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Post Body</b></label>
								<div class="uk-controls">
									<textarea name="body" class="uk-textarea"  rows="10" cols="200" required id="input2"></textarea>
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Post Work</b></label>
								<div class="uk-controls">
									<textarea name="work" class="uk-textarea"  rows="10" cols="200" required id="input2"></textarea>
								</div>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Primary Image</b></label>
								<div class="uk-controls">
									<div class="js-upload" uk-form-custom>
				    					<input type="file" name="image1" onchange="Image1();" id="postImage1" required/>
				    					<button class="uk-button uk-button-default" type="button" tabindex="-1">Select</button>
									</div>
								</div>
								<!-- My old Upload Code  <input type="file" name="image1" onchange="Image1();" id="postImage1" required class="mdl-textfield__input"/></td> -->
							</div>
							<div class="uk-margin">
								<label class="uk-form-label" id="image11" style="display:none"><b>Invalid Image Format</b></label><label id="image12" style="display:none"><b>Size is not suitable</b></label>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Secondary Image</b></label>
								<div class="uk-controls">
									<div class="js-upload" uk-form-custom>
				    					<input type="file" name="image2" onchange="Image2();" id="postImage2" required/>
				    					<button class="uk-button uk-button-default" type="button" tabindex="-1">Select</button>
									</div>
								</div>
								<!--  <input type="file" name="image2" onchange="Image2();" id="postImage2" required class="btn btn-warning"/> -->
							</div>
							<div class="uk-margin">
								<label class="uk-form-label" id="image21" style="display:none"><b>Invalid Image Format</b></label><label id="image22" style="display:none"><b>Size is not suitable</b></label>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Video</b></label>
								<div class="uk-controls">
									<div class="js-upload" uk-form-custom>
				    					<input type="file" name="video1" onchange="Video1();" id="postVideo1" required/>
				    					<button class="uk-button uk-button-default" type="button" tabindex="-1">Select</button>
									</div>
								</div>
								<!--  <input type="file" name="video1" onchange="Video1();" id="postVideo1" required class="btn btn-warning"/> -->
							</div>
							<div class="uk-margin">
								<label class="uk-form-label" id="image31" style="display:none"><b>Invalid Video Format</b></label><label id="image32" style="display:none"><b>Size is not suitable</b></label>
							</div>
							<div class="uk-margin">
								<label class="uk-form-label"><b>Date To Publish</b></label>
								<div class="uk-controls">
									<input type="date" name="date" class="uk-input" required/>
								</div>
							</div>
							<div class="uk-margin">
								<input type="submit" name="Post" id="add"  value="Post" onclick="return checkFiles();" class="uk-button uk-button-primary uk-button-large"/>
							</div>
					</form>
		    	</div>
		    </li>
		    <li>
		 		<form method="POST" action="AddDiscussion?adminId=${myobject.getId()}" class="uk-form-stacked">
		 			<div class="uk-margin">
		 				<label class="uk-form-label"><b>Discussion Topic</b></label>
						<div class="uk-control">
							<input type="text" required name="topic" class="uk-input uk-form-width-large" maxlength="100" minlength="10" />
						</div>
					</div>
					<div class="uk-margin">
		 				<label class="uk-form-label"><b>Discussion Content</b></label>
						<div class="uk-control">
							<textarea required name="description" class="uk-textarea uk-form-width-large" cols="50" rows="5" maxlength="100" minlength="10"></textarea>
						</div>
					</div>
					<div class="uk-margin">
		 				<label class="uk-form-label"><b>Discussion Category</b></label>
						<div class="uk-control">
							<select name="category" id="category" required class="uk-select uk-form-width-medium">
								<option value="" selected>-- Category --</option>
								<c:set var="list" value="${GetCategory.category()}"/>  
								<c:forEach items="${list}" var="element">
									<option value="${element.getCategoryId()}">
									${element.getCategoryName()}
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="uk-margin">
		 				<label class="uk-form-label"><b>Discussion Publish Date</b></label>
						<div class="uk-control">
							<select name="day" id="day" required class="uk-select uk-form-width-small">
								<option value="" selected>-- Day --</option>
								<c:forEach var="i" begin="1" end="31">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<select name="month" id="month" required class="uk-select uk-form-width-small">
								<option value="" selected>-- Month --</option>
								<c:forEach var="i" begin="1" end="12">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<select name="year" id="year" required class="uk-select uk-form-width-small">
								<option value="" selected>-- Year --</option>
								<c:forEach var="i" begin="2017" end="2100" >
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="uk-margin">
						<div class="uk-control">
							<input type="submit" value="Add" class="uk-button uk-button-primary"/>
						</div>
					</div>
				</form>
		    </li>
		    <li>
		    	<table class="uk-table">
					<tr>
						<td>
							<b>Topic</b>
						</td>
						<td>
							<b>Description</b>
						</td>
						<td>
							<b>Category</b>
						</td>
						<td>
							<b>Publish</b>
						</td>
						<td>
							<b>Delete</b>
						</td>
						<td>
							<b>Edit</b>
						</td>
					</tr>
					<c:set var="mydataObject" value="${GetDiscussion.getAdminDiscussion(myobject.getId())}" />
					<c:forEach items="${mydataObject}" var="elements">
						<tr>
							<td>
								<small>${elements.getTopic()}</small>
							</td>
							<td>
								<small>${elements.getDescription()}</small>
							</td>
							<td>
								<c:set var="list" value="${GetCategory.category()}"/>  
								<c:forEach items="${list}" var="element">
									<c:if test="${element.getCategoryId()==elements.getCategoryId()}">
										<small>${element.getCategoryName()}</small>
									</c:if>
								</c:forEach>
							</td>
							<td>
								<small>${elements.getDate()}</small>
							</td>
							<td>
								<a href='DeleteDiscussion?id=${elements.getId()}' style="color:#922b21"><b>Delete</b></a>
							</td>
							<td>
								<a href='editDiscussion.jsp?id=${elements.getId()}'><b>Edit</b></a>
							  <!--  <button class="uk-button" onclick="ToggleDiscussion('myDiscussion${elements.getId()}')">Hero</button> -->
							</td>
						</tr>
					</c:forEach>
				</table>
				<div>
				</div>
		  	</li>
		  	<li>
		  		<form method="POST" action="Admin_GetUserPost" id="myformVisit" class="uk-form">	
		  			<div class="uk-margin">		
		  				<div class="uk-control">
							<select name="categoryId" class="uk-select uk-form-width-medium">
								<c:set var="mylist" value="${GetCategory.category()}" />
								<c:forEach items="${mylist}" var="elements">
									<option value="${elements.getCategoryId()}">${elements.getCategoryName()}</option>
								</c:forEach>
							</select>
							<input type="submit" value="Search" name="categoryId" class="uk-button"/>
						</div>
					</div>	
				</form>
				<c:set var="mylist" value="${requestScope.mylistUnverifiedPost}" />
				<c:if test="${empty mylist}">
					<p class="uk-text-danger"><b>No Data Found</b></p>
				</c:if>
				<c:forEach items="${mylist}" var="element">
					<form method="POST" action="Verify?postId=${element.getPostId()}&adminId=1">
						<div><h3 onclick="ToggleVerifyContenet('VerifyContenet${element.getPostId()}')">${element.getName()}</h3></div>
						<div id="VerifyContenet${element.getPostId()}" style="display:none">
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post Body</b></label>
							<div class="uk-control uk-margin">
								<textarea rows="30" cols="100" class="uk-textarea" readonly>${element.getBody()}</textarea>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post Work</b></label>
							<div class="uk-control uk-margin">
								<textarea rows="5" cols="100" class="uk-textarea" readonly>${element.getWork()}</textarea>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Primary Image</b></label>
							<div class="uk-control uk-margin">
								<image class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=1&requestId=${element.getPostId()}&requestTableName=userPost" width="500px" height="300px" />
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Secondary Image</b></label>
							<div class="uk-control uk-margin">
								<image class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=2&requestId=${element.getPostId()}&requestTableName=userPost" width="500px" height="300px" />
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Video</b></label>
							<div class="uk-control uk-margin">
						      	<video width="500" height="240" controls>
						  		<source class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=3&requestId=${element.getPostId()}&requestTableName=userPost" type="video/mp4">
								</video>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post By : ${GetUserName.getUserName(element.getAdminId())}</b></label>
						</div>
						<div class="uk-margin">
							<input type="submit" value="Verify" onclick="return confirm('Are you sure you want to verify this post !');" class="uk-button uk-button-primary"/>
						</div>
						</div>
					</form>
				</c:forEach>
		  	</li>
		  	<li>
		  		<form method="POST" action="Admin_GetUserPost_next" id="myformVisit" class="uk-form">	
		  			<div class="uk-margin">		
		  				<div class="uk-control">
							<select name="categoryId" class="uk-select uk-form-width-medium">
								<c:set var="mylist" value="${GetCategory.category()}" />
								<c:forEach items="${mylist}" var="elements">
									<option value="${elements.getCategoryId()}">${elements.getCategoryName()}</option>
								</c:forEach>
							</select>
							<input type="submit" value="Search" name="categoryId" class="uk-button"/>
						</div>
					</div>	
				</form>
				<c:set var="mylist" value="${requestScope.mylistverifiedPost}" />
				<c:if test="${empty mylist}">
					<p class="uk-text-danger"><b>No Data Found</b></p>
				</c:if>
				<c:forEach items="${mylist}" var="element">
					<form method="POST" action="DiVerify?postId=${element.getPostId()}&adminId=1">
						<div><h3 onclick="ToggleVerifyContenet('VerifyContenet${element.getPostId()}')">${element.getName()}</h3></div>
						<div id="VerifyContenet${element.getPostId()}" style="display:none">
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post Body</b></label>
							<div class="uk-control uk-margin">
								<textarea rows="30" cols="100" class="uk-textarea" readonly>${element.getBody()}</textarea>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post Work</b></label>
							<div class="uk-control uk-margin">
								<textarea rows="5" cols="100" class="uk-textarea" readonly>${element.getWork()}</textarea>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Primary Image</b></label>
							<div class="uk-control uk-margin">
								<image class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=1&requestId=${element.getPostId()}&requestTableName=userPost" width="500px" height="300px" />
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Secondary Image</b></label>
							<div class="uk-control uk-margin">
								<image class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=2&requestId=${element.getPostId()}&requestTableName=userPost" width="500px" height="300px" />
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Video</b></label>
							<div class="uk-control uk-margin">
						      	<video width="500" height="240" controls>
						  		<source class="uk-border-rounded" src="GET_POST_MEDIA?requestFileIndex=3&requestId=${element.getPostId()}&requestTableName=userPost" type="video/mp4">
								</video>
							</div>
						</div>
						<div class="uk-margin">
							<label class="uk-form-label"><b>Post By : ${GetUserName.getUserName(element.getAdminId())}</b></label>
						</div>
						<div class="uk-margin">
							<input type="submit" value="Verify" onclick="return confirm('Are you sure you want to verify this post !');" class="uk-button uk-button-primary"/>
						</div>
						</div>
					</form>
				</c:forEach>
		  	</li>
		</ul>
	</div>
	<c:if test="${myvalue_one!=null}">
		<script>GoToVerifyPost()</script>
	</c:if>
	<c:if test="${myvalue_two!=null}">
		<script>GoToUnVerifyPost()</script>
	</c:if>
</body>
</html>