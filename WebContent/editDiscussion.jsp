<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="admin.GetDiscussion" %>
<%@ page import="control.GetCategory" %>
<%@ page import="admin.DiscussionBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="uikit/css/uikit.min.css" />
	<script src="uikit/js/uikit.min.js"></script>
	<script src="uikit/js/uikit-icons.min.js"></script>
	<title>Edit Your Discussion</title>
	<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
	<div class="uk-container">
	<div class="uk-tile uk-tile-primary"><h2>Welcome Admin</h2>&nbsp;&nbsp;&nbsp;<small>Democratic Powered By CUTM</small></div>
	<c:set var="discussionId" value="${param.id}"></c:set>
	<c:set var="dataObject" value="${GetDiscussion.getDiscussion(discussionId)}" />
	<form method="POST" action="UpdateDiscussion?id=${discussionId}" class="uk-from uk-form-width-large uk-margin">
		<div class="uk-margin">
			<label class="uk-form-label"><b>Discussion Topic</b></label>
			<div class="uk-control uk-margin">
				<input type="text" required name="topic" class="uk-input" maxlength="100" minlength="10" value="${dataObject.getTopic()}" />
			</div>
		</div>
		<div class="uk-margin">
			<label class="uk-form-label"><b>Discussion Topic</b></label>
			<div class="uk-control uk-margin">
					<textarea required name="description" class="uk-textarea" cols="50" rows="5" maxlength="100" minlength="10">${dataObject.getDescription()}</textarea>
			</div>
		</div>
		<div class="uk-margin">
			<label class="uk-form-label"><b>Discussion Category</b></label>
			<div class="uk-control uk-margin">
				<select name="category" id="category" required class="uk-select uk-form-width-medium">
					<c:set var="list" value="${GetCategory.category()}"/>  
					<c:forEach items="${list}" var="element">
						<c:choose>
							<c:when test="${element.getCategoryId()==dataObject.getCategoryId()}">
								<option value="${element.getCategoryId()}" selected>
								${element.getCategoryName()}
								</option>
							</c:when>
							<c:otherwise>
								<option value="${element.getCategoryId()}">
								${element.getCategoryName()}
								</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="uk-margin">
			<label class="uk-form-label"><b>Discussion Publish Date</b></label>
			<div class="uk-control uk-margin">
				<c:set var="date" value="${fn:split(dataObject.getDate(),'-')}" />
				<select name="day" id="day" required class="uk-select uk-form-width-small">
				<c:forEach var="i" begin="1" end="31">
					<c:choose>
						<c:when test="${i==date[2]}"><option value="${i}" selected>${i}</option></c:when>
						<c:otherwise><option value="${i}">${i}</option></c:otherwise>
					</c:choose>
				</c:forEach>
				</select>
				<select name="month" id="month" required class="uk-select uk-form-width-small">
					<c:forEach var="i" begin="1" end="12">
						<c:choose>
							<c:when test="${i==date[1]}"><option value="${i}" selected>${i}</option></c:when>
							<c:otherwise><option value="${i}">${i}</option></c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<select name="year" id="year" required class="uk-select uk-form-width-small">
					<c:forEach var="i" begin="2017" end="2100">
						<c:choose>
							<c:when test="${i==date[0]}"><option value="${i}" selected>${i}</option></c:when>
							<c:otherwise><option value="${i}">${i}</option></c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="uk-control uk-margin">
			<input type="submit" value="Update" class="uk-button uk-button-primary" />
		</div>
		<div class="uk-control uk-margin">
			<a href="Admin.jsp"><b>Back</b></a>
		</div>
	</form>
	</div>
</body>
</html>