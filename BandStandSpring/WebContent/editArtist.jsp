<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="custom.css">
<title>Edit Artist</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Bandstand</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><c:if test="${user.accessLevel == 2}">
							<a class="nabvar-brand" href="ArtistList.jsp">User Interface</a>
						</c:if>
					<li><c:if test="${user.accessLevel == 2}">
							<a class="nabvar-brand" href="Admin.jsp">Admin Home</a>
						</c:if>
					<li><a href="userLogOut.do">Log out</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="col-lg-12 text-center">
		<c:if test="${! empty(genre)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You've successfully added a genre to
				${artist.name}!</h3>
		</c:if>
		<c:if test="${! empty(photo)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You've successfully added a photo to
				${artist.name}!</h3>
		</c:if>
		<c:if test="${! empty(recording)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You've successfully added a recording to
				${artist.name}!</h3>
		</c:if>
		<c:if test="${! empty(removedPhoto)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You've successfully removed a photo from
				${artist.name}!</h3>
		</c:if>

		<c:if test="${! empty(removedRecording)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You've successfully removed a recording
				from ${artist.name}!</h3>
		</c:if>
	</div>


	<div class="row text-center">
		<div class="bottomMargin">
			<h2 >Edit ${artist.name}'s page</h2>
			<form class action="gotoDummyPage.do" method="GET">
			<input type="hidden" name="id"
					value="${artist.id}">
			<button style="margin-top: 10px;" class="btn btn-default"
					type="submit">See what your page looks like on the site</button>
					</form>
		</div>


		<div class="elements">

			<form class = "orangeBorder sidePadding topBottomPadding" action="updateArtist.do" method="GET">
				<h3>Edit Basic Information</h3>
				<div>Id
				<input class="topBottomMargin10 sideMargin" type="hidden" name="id"
					value="${artist.id}">
				Artist Name
				<input class="topBottomMargin10 sideMargin" type="text" name="name"
					value="${artist.name}"></div>
				<div>Artist Email
				<input class="topBottomMargin10 sideMargin" type="text" name="email"
					value="${artist.email}">
				Artist Password
				<input class="topBottomMargin10 sideMargin" type="text" name="password"
					value="${artist.password}"></div>
				<div>Artist Description
				<input class="topBottomMargin10 sideMargin" type="text" name="description"
					value="${artist.description}"></div>
				<button style="margin-top: 10px;" class="btn btn-default"
					type="submit">Update Artist</button>
			</form>

		</div>

		<br> 
		
		<div style="margin-left: 35px; margin-right: 35px;">
		<h3  style="padding-bottom: 25px;">Add Multiples</h3>
		<div class="elements">
			<div>
				<form action="addRecording.do" method="GET">

					<input type="hidden" name="artistID" value="${artist.id} ">
					<input type="placeholder" name="recording" value=" ">
					<div>
						<button style="margin-top: 10px;"
							class="btn btn-default bottomMargin" type="submit">Add
							Recording</button>
					</div>
				</form>
			</div>
			<div>
				<form class = "sidePadding" action="addPhoto.do" method="GET">

					<input type="hidden" name="artistID" value="${artist.id} ">
					<input type="placeholder" name="photo" value=" ">
					<div>
						<button style="margin-top: 10px;"
							class="btn btn-default bottomMargin" type="submit">Add
							photo</button>
					</div>

				</form>
			</div>
			<div>
				<form action="addGenre.do" method="GET">
					<input type="hidden" name="artistID" value="${artist.id} ">
					<select class="btn btn-default" name="genre">
						<option selected="selected">Select Genre</option>

						<option value="Jazz">Jazz</option>
						<option value="Brass">Brass</option>
						<option value="EDM">EDM</option>
						<option value="Jazz">Jazz</option>
						<option value="Reggae">Reggae</option>
						<option value="Brass">Brass</option>
						<option value="Piano">Piano</option>
						<option value="Country">Country</option>
						<option value="Alternative">Alternative</option>

					</select>
					<div>
						<button style="margin-top: 10px;" class="btn btn-default"
							type="submit">Add genre</button>
					</div>
				</form>
			</div>
		</div>
</div>
	</div>
	<div>
	<h3 style="text-align: center;">Delete</h3>

	<div class="elements">
		<div>

			<button
				style="margin-bottom: 10px; margin-top: 30px; margin-left: 20px;"
				class="btn btn-default"
				onclick="document.getElementById('id01').style.display='block'">
				View photos</button>

			<div id="id01" class="w3-container w3-red" style="display: none">
				<span onclick="this.parentElement.style.display='none'"
					class="w3-closebtn">&times; Close photos</span>

				<c:forEach items="${artist.photos}" var="photo">
					<div class="item">
						<img src="${photo.url}" style="width: 200px; height: 200px;">
						<form action="deletePhoto.do" method="GET">
							<input type="hidden" name="artistID" value="${artist.id}">
							<input type="hidden" name="photo" value="${photo.id} ">
							<button style="margin-top: 10px;"
								class="btn btn-default bottomMargin" type="submit">Delete
								photo</button>
						</form>

					</div>

				</c:forEach>
			</div>
		</div>
		<div>



			<button
				style="margin-bottom: 10px; margin-top: 30px; margin-left: 20px;"
				class="btn btn-default"
				onclick="document.getElementById('id02').style.display='block'">
				View Recordings</button>

			<div id="id02" class="w3-container w3-red" style="display: none">
				<span onclick="this.parentElement.style.display='none'"
					class="w3-closebtn">&times; Close recordings</span>

				<c:forEach items="${artist.recordings}" var="recording">
					<div class="item">
						${recording.url}
						<form action="deleteRecording.do" method="GET">
							<input type="hidden" name="artistID" value="${artist.id}">
							<input type="hidden" name="recording" value="${recording.id} ">
							<button style="margin-top: 10px;"
								class="btn btn-default bottomMargin" type="submit">Delete
								Recording</button>
						</form>

					</div>

				</c:forEach>
			</div>
		</div>
		<div>


			<button
				style="margin-bottom: 10px; margin-top: 30px; margin-left: 20px;"
				class="btn btn-default"
				onclick="document.getElementById('id03').style.display='block'">
				View Genres</button>

			<div id="id03" class="w3-container w3-red" style="display: none">
				<span onclick="this.parentElement.style.display='none'"
					class="w3-closebtn">&times; Close genres</span>

				<c:forEach items="${artist.genres}" var="genre">
					<div class="item">
						${genre.genretype}
						<form action="deleteGenre.do" method="GET">
							<input type="hidden" name="artistID" value="${artist.id}">
							<input type="hidden" name="genre" value="${genre.id} ">
							<button style="margin-top: 10px;"
								class="btn btn-default bottomMargin" type="submit">Delete
								Genre</button>
						</form>

					</div>

				</c:forEach>
			</div>
		</div>
		</div>

		<div class="elements" style="margin-left: 35px; margin-right: 35px;">
			<h3 style="text-align: center;">Your bookings</h3>

			<table class="table table-hover">
				<thead class="text-center">
					<tr>
						<c:if test="${not empty artist.bookings}">

							<th>ID</th>
							<th>Date</th>
							<th>User</th>
							<th>User Email</th>
							<th>Confirmed</th>
						</c:if>
					<tr>
				</thead>
				<tbody>
					<c:forEach items="${artist.bookings}" var="booking">
						<tr>

							<td>${booking.id}</td>
							<td>${booking.bookingDate}</td>
							<td>${booking.user.firstName}</td>
							<td>${booking.user.email}</td>
							<td>${booking.confirmed}</td>
							<c:if test="${booking.confirmed == false}">
								<td>
									<form action="setConfirmedBookingtoArtist.do" method="GET">

										<input type="hidden" name="bookingId" value="${booking.id}">
										<input type="hidden" name="artistId" value="${artist.id}">
										<input class="btn btn-default" type="submit"
											value="Confirm Booking">
									</form>
								</td>
							</c:if>
							<c:if test="${booking.confirmed == true}">
								<td>
									<form action="setUnConfirmedBookingtoArtist.do" method="GET">

										<input type="hidden" name="bookingId" value="${booking.id}">
										<input type="hidden" name="artistId" value="${artist.id}">
										<input class="btn btn-default" type="submit"
											value="UNconfirm Booking">
									</form>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>