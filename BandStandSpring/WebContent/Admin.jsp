<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administration Portal</title>
</head>
<body>
	<h1>Administartion Portal</h1>
	<div>
		<form action="addArtist.do" method="GET">
			<h3>Add New Artist</h3>
			<div>Artist Name</div>
			<input type="text" name="artistName" value="">
			<div>Artist Email</div>
			<input type="text" name="artistEmail" value="">
			<div>Artist Password</div>
			<input type="password" name="artistPassword" value=""><input
				type="submit" value="Add New Artist">
		</form>
		<form action="addUser.do" method="GET">
			<h3>Add New user</h3>
			<div>User First Name</div>
			<input type="text" name="userFirstName" value="">
			<div>User Last Name</div>
			<input type="text" name="userLastName" value="">
			<div>email</div>
			<input type="text" name="userEmail" value="">
			<div>Password</div>
			<input type="password" name="userPassword" value="">Password
			<input type="submit" value="Add New User">
		</form>
	</div>
	<hr>

	<div>
		<h3>Display All Users</h3>
		<form action="getAllUsers.do" method="GET">

			<input type="submit">
		</form>

		<table class="table table-hover">
			<thead class="text-center">
				<tr>
					<c:if test="${not empty allUsers }">

						<th>First Name</th>
						<th>Last name</th>
						<th>ID</th>
						<th>email</th>
						<th>Access Level</th>
					</c:if>
				<tr>
			</thead>
			<tbody>

				<c:forEach items="${allUsers}" var="user">
					<tr>

						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.id}</td>
						<td>${user.email}</td>
						<td>${user.accessLevel}</td>
						<td>
							<form action="setUserAccessToAdmin.do" method="GET">

								<input type="hidden" name="userID" value="${user.id}"> <input
									type="submit" value="Set as Admin">
							</form>

						</td>
						<td>
							<form action="setUserAccessToUser.do" method="GET">

								<input type="hidden" name="userID" value="${user.id }">
								<input type="submit" value="Set as User">
							</form>
						</td>
						<td>
							<form action="deleteUserById.do" method="GET">
								<input type="hidden" name="userId" value="${user.id }">
								<input type="submit" value="Delete User">
							</form>
						</td>
						<td>
						<td>
							<form action="loadUserEditPage.do">
								<input type="hidden" name="userId" value="${user.id }">
								<input type="submit" value="Update User">
							</form>
						</td>
					</tr>
				</c:forEach>

				<%-- <c:forEach items ="${employeeList}" var = "item">
					<tr>
					
					</tr>
				</c:forEach> --%>

			</tbody>
		</table>
		<h3>Display All Artists</h3>
		<form action="getAllArtists.do" method="GET">
			<input type="submit">
		</form>
	</div>
	<table class="table table-hover">
		<thead class="text-center">
			<tr>
				<c:if test="${not empty allArtists }">

					<th>Name</th>
					<th>Description</th>
					<th>ID</th>
					<th>email</th>
				</c:if>
			<tr>
		</thead>
		<tbody>

			<c:forEach items="${allArtists}" var="artist">
				<tr>

					<td>${artist.name}</td>
					<td>${artist.description}</td>
					<td>${artist.id}</td>
					<td>${artist.email}</td>
					<td>
						<form action="deleteArtistById.do" method="GET">
							<input type="hidden" name="artistId" value="${artist.id }">
							<input type="submit" value="Delete Artist">
						</form>
					</td>
					<td>
						<form action="loadArtistEditPage.do">
							<input type="hidden" name="artistId" value="${artist.id }">
							<input type="submit" value="Update Artist">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h2>Bookings</h2>
	<div>
		<form action="getAllBookings.do" method="GET">

			<input type="submit" value="Get All Bookings">
		</form>
		<form action="getConfirmedBookings.do" method="GET">
			<input type="submit" value="Get Confirmed Bookings">
		</form>
		<form action="getUnConfirmedBookings.do" method="GET">
			<input type="submit" value="Get UNconfirmed Bookings">
		</form>
	</div>
	<table>
		<thead class="text-center">
			<tr>
				<c:if test="${not empty bookings }">

					<th>ID</th>
					<th>Date</th>
					<th>Artist</th>
					<th>User</th>
					<th>Confirmed</th>
				</c:if>
			<tr>
		</thead>
		<tbody>
			<c:forEach items="${bookings}" var="booking">
				<tr>

					<td>${booking.id}</td>
					<td>${booking.bookingDate}</td>
					<td>${booking.artist.id}</td>
					<td>${booking.user.id}</td>
					<td>${booking.confirmed}</td>
					<td>
						<form action="setConfirmedBooking.do" method="GET">

							<input type="hidden" name="bookingId" value="${booking.id}">
							<input type="submit" value="Confirm Booking">
						</form>
					</td>
					<td>
						<form action="setUnConfirmedBooking.do" method="GET">

							<input type="hidden" name="bookingId" value="${booking.id}">
							<input type="submit" value="UNconfirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table>
		<thead class="text-center">
			<tr>
				<c:if test="${not empty confirmedBookings }">

					<th>ID</th>
					<th>Date</th>
					<th>Artist</th>
					<th>User</th>
				</c:if>
			<tr>
		</thead>
		<tbody>
			<c:forEach items="${confirmedBookings}" var="booking">
				<tr>

					<td>${booking.id}</td>
					<td>${booking.bookingDate}</td>
					<td>${booking.artist.id}</td>
					<td>${booking.user.id}</td>
					<td>${booking.confirmed}</td>
					<td>
						<form action="setUnConfirmedBooking.do" method="GET">

							<input type="hidden" name="bookingId" value="${booking.id}">
							<input type="submit" value="UNconfirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table>
		<thead class="text-center">
			<tr>
				<c:if test="${not empty unConfirmedBookings }">

					<th>ID</th>
					<th>Date</th>
					<th>Artist</th>
					<th>User</th>
				</c:if>
			<tr>
		</thead>
		<tbody>
			<c:forEach items="${unConfirmedBookings}" var="booking">
				<tr>

					<td>${booking.id}</td>
					<td>${booking.bookingDate}</td>
					<td>${booking.artist.id}</td>
					<td>${booking.user.id}</td>
					<td>${booking.confirmed}</td>
					<td>
						<form action="setConfirmedBooking.do" method="GET">

							<input type="hidden" name="bookingId" value="${booking.id}">
							<input type="submit" value="Confirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>