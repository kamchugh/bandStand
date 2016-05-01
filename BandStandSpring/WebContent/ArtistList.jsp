<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h1>I'm printing things</h1>

	<h1>User id: ${user.id}</h1>
	<h1>Hi there, ${user.firstName}</h1>

	I'd like to...

	<form action="getAllArtistsforUser.do" method="GET">
	User ID test <input type="text" name="userID" value="${user.id}">
		<input type="submit" value="Get all artists">
	</form>


<c:forEach var="artist" items="${allArtistsforUser}">
	<c:if test="${! empty(artist)}">
	
	${artist.id}
	${artist.name}
		<form action="getArtistById.do" method="GET">
		<input type="text" name="userID" value="${user.id}"> <input
			type="text" name="artistID" value="${artist.id}"> <input type="submit"
			value="go to band page">
	</form>
	
	
	</c:if>
</c:forEach>







</html>