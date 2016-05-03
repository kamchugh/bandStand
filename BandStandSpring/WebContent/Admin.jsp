<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	padding-top: 70px;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="startbootstrap-bare-1.0.4 2/css/bootstrap.css">
<title>Administration Portal</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="ArtistList.jsp">Bandstand Home</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li>
						<form class="navbar-brand" action="getAllUsers.do" method="GET">

							<button type="submit" name="getAllUsers" value="getAllUsers"
								class="btn-link">Users</button>
								
						</form>
					</li>
					<li>
						<form class="navbar-brand" action="getAllArtists.do" method="GET">
							<button type="submit" name="getAllArtists" value="getAllArtists"
								class="btn-link">Artists</button>
						</form>
					</li>
					<li>
						<form class="navbar-brand" action="getAllBookings.do" method="GET">

							<button type="submit" name="getAllBookings" value="getAllBookings"
								class="btn-link">Bookings</button>
						</form>
					</li>
					<li>
						<form class="navbar-brand"action="getConfirmedBookings.do" method="GET">
							<button type="submit" name="getConfirmedBookings" value="getConfirmedBookings"
								class="btn-link">Confirmed Bookings</button>
						</form>
					</li>
					<li>
						<form class="navbar-brand"action="getUnConfirmedBookings.do" method="GET">
							<button type="submit" name="getUnConfirmedBookings" value="getUnConfirmedBookings"
								class="btn-link">Unconfirmed Bookings</button>
						</form>
					</li>
				</ul>
			</div>
		</div>

	</nav>

	<div class="continer-fluid">
		<div class="row text-center">
			<div class="col-md-12">
				<h1>Administration Portal</h1>
			</div>

		</div>

		<div class="row text-center">
			<div class="col-sm-6">
				<form action="addArtist.do" method="GET">
					<h3>Add New Artist</h3>
					<div>Artist Name</div>
					<input type="text" name="artistName" value="">
					<div>Artist Email</div>
					<input type="text" name="artistEmail" value="">
					<div>Artist Password</div>
					<input type="password" name="artistPassword" value=""><br>
					<input style="margin-top: 10px;" class="btn btn-default" type="submit" value="Add New Artist">
				</form>
			</div>
			<div class="col-sm-6">
				<form action="addUser.do" method="GET">
					<h3>Add New user</h3>
					<div>User First Name</div>
					<input type="text" name="userFirstName" value="">
					<div>User Last Name</div>
					<input type="text" name="userLastName" value="">
					<div>email</div>
					<input type="text" name="userEmail" value="">
					<div>Password</div>
					<input type="password" name="userPassword" value=""> <br >
					
					<input style="margin-top: 10px;" class="btn btn-default" type="submit" value="Add New User">
				</form>
			</div>
		</div>
		<hr>
	</div>
	<div>

<div class = "container-fluid">
		<table class="table table-hover ">
			<thead class="text-center">
				<tr>
					<c:if test="${not empty allUsers }">
						<h2>Users</h2>
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
									class="btn btn-default" type="submit" value="Set as Admin">
							</form>

						</td>
						<td>
							<form action="setUserAccessToUser.do" method="GET">

								<input type="hidden" name="userID" value="${user.id }">
								<input class="btn btn-default" type="submit" value="Set as User">
							</form>
						</td>
						<td>
							<form action="deleteUserById.do" method="GET">
								<input type="hidden" name="userId" value="${user.id }">
								<input class="btn btn-default" type="submit" value="Delete User">
							</form>
						</td>
						<td>
						<td>
							<form action="loadUserEditPage.do">
								<input type="hidden" name="userId" value="${user.id }">
								<input class="btn btn-default" type="submit" value="Update User">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


	<table class="table table-hover">
		<thead class="text-center">
			<tr>
				<c:if test="${not empty allArtists }">
					<h2>Artists</h2>
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
							<input  class="btn btn-default" type="submit" value="Delete Artist">
						</form>
					</td>
					<td>
						<form action="loadArtistEditPage.do">
							<input type="hidden" name="artistId" value="${artist.id }">
							<input class="btn btn-default" type="submit" value="Update Artist">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
	</div>
	<table class="table table-hover">
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
							<input class="btn btn-default" type="submit" value="Confirm Booking">
						</form>
					</td>
					<td>
						<form action="setUnConfirmedBooking.do" method="GET">

							<input type="hidden" name="bookingId" value="${booking.id}">
							<input class="btn btn-default" type="submit" value="UNconfirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
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
							<input class="btn btn-default" type="submit" value="UNconfirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
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
							<input class="btn btn-default" type="submit" value="Confirm Booking">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<%-- 	<c:if test="${not empty nameUpdated }">
	${nameUpdated }  has been updated
	</c:if> --%>

	<!-- <a href="ArtistList.jsp">User Homepage</a> -->

</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</html>