<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<form action="getAllArtists.do" method="GET">

		<input type="submit" value="Get all artists">
	</form>
	<c:choose>
		<c:when test="${! empty(allArtists)}">
		I'm getting all the artists
			<c:forEach var="individualArtist" items="${allArtists}">
				<c:if test="${! empty(individualArtist)}">
		${individualArtist.firstName}
		${individualArtist.lastName}
		<form action="getArtistById.do" method="GET">
		
		 <input
			type="submit" name="artistID" value="1">
	</form> 
		
		</c:if>


			</c:forEach>

		</c:when>
	</c:choose>
</html>