<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="getUserAccess.do" method="GET">
		<div>getUserAccess.do</div>
		<input type="text" name="userID" value=""> <input
			type="submit">
	</form>
	<form action="setUserAccessToAdmin.do" method="GET">
		<div>setUserAccessToAdmin.do</div>
		<input type="text" name="userID" value=""> <input
			type="submit">
	</form>
	<form action="setUserAccessToUser.do" method="GET">
		<div>setUserAccessToUser.do</div>
		<input type="text" name="userID" value=""> <input
			type="submit">
	</form>
	<form action="getAllArtists.do" method="GET">
		<div>getAllArtists.do</div>

		<input type="submit">
	</form>
	<form action="getAllUsers.do" method="GET">
		<div>getAllUsers.do</div>

		<input type="submit">
	</form>
	<form action="getArtistById.do" method="GET">
		<div>getArtistById.do</div>
		<input type="text" name="artistID" value=""> <input
			type="submit">
	</form>
	<form action="getUserById.do" method="GET">
		<div>getUserById.do</div>
		<input type="text" name="userID" value=""> <input
			type="submit">
	</form>
	<form action="addArtist.do" method="GET">
		<div>Add New Artist</div>
		<input type="text" name="artistName" value="">Name <input
			type="text" name="artistEmail" value="">Email <input
			type="password" name="artistPassword" value="">Password <input
			type="submit">
	</form>

	<form action="deleteArtistById.do" method="GET">
		<div>deleteArtistById.do</div>
		<input type="text" name="artistId" value="">artistId <input
			type="submit">
	</form>
	<form action="addUser.do" method="GET">
		<div>Add New User</div>
		<input type="text" name="userFirstName" value="">userFirstName
		<input type="text" name="userLastName" value="">userLastName <input
			type="text" name="userEmail" value="">Email <input
			type="password" name="userPassword" value="">Password <input
			type="submit">
	</form>
	<form action="deleteUserById.do" method="GET">
		<div>deleteUserById.do</div>
		<input type="text" name="userId" value="">userId <input
			type="submit">
	</form>
	<form action="getAllBookings.do" method="GET">
		<div>getAllBookings.do</div>
		<input type="submit">
	</form>
	<form action="getConfirmedBookings.do" method="GET">
		<div>getConfirmedBookings.do</div>
		<input type="submit">
	</form>
	<form action="getUnConfirmedBookings.do" method="GET">
		<div>getUnConfirmedBookings.do</div>
		<input type="submit">
	</form>
	<form action="updateUserEmail.do" method="GET">
		<div>updateUserEmail.do</div>
		<input type="hidden" name="userId" value="1"> <input
			type="text" name="email" value=""> <input type="submit">
	</form>
	<form action="setConfirmedBooking.do" method="GET">
		<div>setConfirmedBooking.do</div>
		<input type="hidden" name="bookingId" value="1"> <input
			type="submit">
	</form>
	<form action="setUnConfirmedBooking.do" method="GET">
		<div>setUnConfirmedBooking.do</div>
		<input type="hidden" name="bookingId" value="1"> <input
			type="submit">
	</form>


	<!-- Kaylee's forms  -->
	<form action="getUserByEmail.do" method="GET">
		getUserByEmail.do/ input email <input type="text" name="email"
			value=""> getUserByEmail.do/ input password <input
			type="text" name="password" value=""> <input type="submit">
	</form>

	<!--  Bruno's forms -->

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
                
    ${booking.bookingDate }<br />
    ${booking.id }<br />
    ${booking.confirmed }<br />
    ${booking.artist.email }<br />
	</c:forEach>
	<br>
	<br>
	<br>
	<br>

	<form action="searchByGenre.do" method="GET">
		<div>Search By Genre</div>
		<input type="text" name="genre" value="EDM"> <input
			type="submit">

	</form>

	<c:forEach var="name" items="${allg}">
        ${name.artist.name}: ${name.artist.email }
    </c:forEach>
    
    <a href="ArtistList.jsp">User Homepage</a>

</body>
</html>
