<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artist Page</title>
</head>
<body>
</body>
${artist.name} ${artist.description} ${artist.id} User id: ${user.id}

<br> Give this artist a rating
<form action="addRating.do" method="GET">
	<input type="hidden" name="userID" value="${user.id}"> <input
		type="hidden" name="artistID" value="${artist.id}"> <select
		name="rating">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select> <input type="submit">
</form>

Comment on this band
<form action="addComment.do" method="GET">
	<input type="hidden" name="userID" value="${user.id}"> <input
		type="hidden" name="artistID" value="${artist.id}"> <input
		type="text" name="comment" value="comment"> <input
		type="submit">
</form>

Book this band for a certain date
<form action="addBooking.do" method="GET">
	User ID test <input type="text" name="userID" value="${user.id}">
	Artist ID test <input type="text" name="artistID" value="${artist.id}">
	Month <input type="textarea" name="month" value="10"> Day <input
		type="textarea" name="day" value="23"> Year <input
		type="textarea" name="year" value="2010"> <input type="submit">
</form>

<form action="getCommentsByBand.do" method="GET">
	<input type="text" name="artistID" value="${artist.id}"> <input
		type="submit" name="commentsByBand"
		value="Get all comments for this artist">
</form>
<c:forEach var="comment" items="${comments}">
	<c:if test="${! empty(comment)}">
	${comment.body}
	</c:if>
</c:forEach>
</body>
</html>