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
						<input type="text" name="userID" value="${user.id}"> <input
							type="text" name="artistID" value="1"> <input
							type="submit" value="submit">
					</form>

				</c:if>


			</c:forEach>

		</c:when>
	</c:choose>

	<br>
	<br>

	<form action="searchByName.do" method="GET">
		<div>Search By Name</div>
		<select name="name">
			<c:forEach var="name" items="${all}">
				<option value="${name.name}">${name.name }</option>
			</c:forEach>
		</select> <input type="submit">
	</form>

	<br>
	<br> ${artist.email }

	<br>
	<br>

	<form action="searchBookingsByUserId.do" method="GET">
		<div>List Bookings by userid</div>

		<input type="text" name="userId" value="1"> <input
			type="submit">
	</form>
	<c:forEach var="booking" items="${bookings}">
                
        <table>
        <thead>
        <tr>
        	<td>Booking ID</td>
        	<td>Booking Date</td>
        	<td>Confirmed Status</td>
        </tr>
        </thead>
        	<tr>
        	<td>${booking.id }</td>
        	<td>${booking.bookingDate }</td>
        	<td>${booking.confirmed }</td>
        	</tr>
        <tbody>
        </tbody>
        
        </table>        
   
	</c:forEach>
	<br>
	<br>
	<br>
	<br>


	<form action="searchByGenre.do" method="GET">
		<div>Search By Genre</div>

		<select name="genre">
			<option value="Jazz">Jazz</option>
			<option value="Brass">Brass</option>
			<option value="EDM">EDM</option>
			<option value="Jazz">Jazz</option>
			<option value="Reggae">Reggae</option>
			<option value="Brass">Brass</option>
			<option value="Piano">Piano</option>
			<option value="Country">Country</option>
			<option value="Alternative">Alternative</option>


		</select> <input type="submit">
	</form>
	
	<table>
        <thead>
        <tr>
        	<td>Booking ID</td>
        	<td>Booking Date</td>
        	<td>Confirmed Status</td>
        </tr>
        </thead>
        	<tr>
        	<td>${booking.id }</td>
        	<td>${booking.bookingDate }</td>
        	<td>${booking.confirmed }</td>
        	</tr>
        <tbody>
        </tbody>
        
        </table>    

	<c:forEach var="name" items="${allg}">
        ${name.artist.name}: ${name.artist.email }
    </c:forEach>
</html>