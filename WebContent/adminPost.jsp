<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="uikit/css/uikit.min.css" />
<script src="uikit/js/uikit.min.js"></script>
<script src="uikit/js/uikit-icons.min.js"></script>
<script src="javascript/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="stylesheet/jquery-ui.css">
<script src="javascript/jquery-ui.js"></script>
<script src="javascript/addNews.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page import="control.GetCategory" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function() 
			{
			    $( ".mydate" ).datepicker({ 
			    	dateFormat: 'yy-mm-dd',
			        changeYear: true,
			        changeMonth: true,
			        yearRange: '2016:'+'2200:'
			    	}); 
			});
</script>
<style>
	.mydiv
	{
		padding: 5%;
	}
</style>
</head>
<body>
	<div style="width:100%" class="uk-grid">
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
						<input type="date" name="date" class="mydate uk-input" required/>
					</div>
				</div>
				<div class="uk-margin">
					<input type="submit" name="Post" id="add"  value="Post" onclick="return checkFiles();" class="uk-button uk-button-primary uk-button-large"/>
				</div>
		</form>
		<c:set var="flag" value="${param['flag']}" />
		<c:if test="${flag>0}">
			<small style="color: #2e4053"><b>Status: Data Saved !</b></small>
		</c:if>
		<c:if test="${flag==0}">
			<small style="color: #c0392b"><b>Status: Something Went Wrong !</b></small>
		</c:if>
	</div>
</body>
</html>