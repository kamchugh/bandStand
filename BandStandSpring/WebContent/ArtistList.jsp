<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Search Artists</title>
<link
	href="data:image/x-icon;base64,AAABAAEAEBAAAAAAAABoBQAAFgAAACgAAAAQAAAAIAAAAAEACAAAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAAAAAAAmpqaAHx8fACMjIwA4eHhAKenpwDHx8cATU1NALKysgDw8PAA6enpAGhoaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQACCgAAAAAAAAAAAAAACgAAAAEAAAkECQAAAAAAAAAGAAcAAAMAAAAKAAAAAAAAAAAAAAAFAAAAAAAAAAAAAAAAAAAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAAAAAAAAAAHAAAAAAAAAAAAAAAAAAAAAAAAAAoIBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAOH/AADBjwAA4QcAAP0HAAD9hwAA/fcAAP33AAD99wAA/fcAAPz3AAD8BwAA/AcAAP/HAAD//wAA//8AAP//AAA="
	rel="icon" type="image/x-icon" />

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="stylesheet.css">
<link rel="stylesheet" href="custom.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<!-- Navigation -->
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
			<a class="navbar-brand" href="ArtistList.jsp">BandStand</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li><a href="updateMyInfoClick.do"> Edit my Account</a></li>
				<li><c:if test="${user.accessLevel == 2}">
						<a href="Admin.jsp">Admin Portal</a>
					</c:if></li>
				<li><a href="userLogOut.do">Log out</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>



	<div class="container">
		<br> <br> <br> <br>
		<c:if test="${! empty(noRating)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You didn't select a rating!</h3>
		</c:if>
		<c:if test="${! empty(noGenre)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You didn't select a genre!</h3>
		</c:if>
		<c:if test="${! empty(noName)}">
			<%-- ${booking.id} --%>
			<h3 class="orangeText">You didn't select an artist!</h3>
		</c:if>

		<%-- <h1>User id: ${user.id}</h1> --%>
		<h1 style="padding-bottom: 20px">
			Hi there, <span class="orangeText"> ${user.firstName}. </span>
		</h1>


		<button style="margin-bottom: 10px" class="btn btn-default"
			onclick="document.getElementById('id01').style.display='block'">
			View Your Bookings</button>

		<div id="id01" class="w3-container w3-red" style="display: none">
			<span onclick="this.parentElement.style.display='none'"
				class="w3-closebtn">&times; Close bookings</span>

			<p class="lead">
			<div class="elements">
				<c:if test="${! empty(user.bookings)}">
					<c:forEach var="b" items="${user.bookings}">
						<c:if test="${! empty(b)}">
							<div class="bookingsBorder">
								${b.artist.name} for ${b.bookingDate} is
								<c:if test="${b.confirmed == true}">
										confirmed.
								</c:if>
								<c:if test="${b.confirmed == false}">
										unconfirmed.
								</c:if>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty(user.bookings)}">
				You don't have any booking yet.
				</c:if>

			</div>
			</p>

		</div>

		<!-- <form class="form-inline">
 -->
		<div class="row">
			<ul class="list-inline" style="padding-top: 10px; margin-left: 15px">
				<li>
					<form action="getAllArtistsUser.do" method="GET">

						<input class="btn btn-default" type="submit"
							value="See All Artists">
					</form>
				</li>




				<li>
					<form action="searchByName.do" method="GET">
						<!-- 					<div>Search By Name</div>
 -->
						<select class="form-control" name="name">
							<option selected="selected">Select Artist</option>

							<c:forEach var="name" items="${all}">
								<option value="${name.name}">${name.name}</option>
							</c:forEach>
						</select>
				</li>
				<li><input class="btn btn-default" type="submit" value="Go">
					</form></li>




				<li>
					<form action="searchByGenre.do" method="GET">
						<!-- 				<div>Search By Genre</div>
 -->
						<select class="form-control" name="genre">
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
				</li>
				<li><input class="btn btn-default" type="submit" value="Go">
					</form></li>



				<li>
					<form action="searchByRating.do" method="GET">
						<input type="hidden" name="userId" value="1"> <select
							class="form-control" name="rating">
							<option selected="selected">Select Rating</option>

							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
				</li>
				<li><input class="btn btn-default" type="submit" value="Go">
					</form></li>
			</ul>


		</div>






		<!-- </form>
 -->
		<c:if test="${ empty(filterArtist)}">
			<br>
			<c:forEach var="singleArtist" items="${all}">
				<a
					href="getArtistById.do?artistID=${singleArtist.id}&userID=${user.id}">
					<table class="table">

						<tbody>
							<tr>
								<td><img src="${singleArtist.photos[0].url}" height=200
									width=200 class="img-rounded" /></td>
								<td colspan="3">
									<h4 class="orangeText bottomPadding10">${singleArtist.name}</h4> 
<div class="ellipsis">
									<p style = "color: black;"> ${singleArtist.description } </p> </div>
								</td>


							</tr>
						</tbody>
					</table>
				</a>
			</c:forEach>
		</c:if>

		<c:forEach var="artist2" items="${filterArtist}">

			<table class="table">
				<tbody>
					<tr>
						<td><a
							href="getArtistById.do?artistID=${artist2.id}&userID=${user.id}">
								<img src="${artist2.photos[0].url}" height=200 width=200
								class="img-rounded" />
						</a></td>
						<td colspan="3">
							<h4 class="orangeText">${artist2.name}</h4>
							<div class="ellipsis">
								${artist2.description } <br> <a
									href="getArtistById.do?artistID=${artist2.id}&userID=${user.id}">
									<h4>Read more</h4>
								</a>


							</div>
						</td>


					</tr>
				</tbody>
			</table>

		</c:forEach>


		<%-- <c:forEach var="booking" items="${bookings}">

	<table class="table">
		<thead>
			<tr>
				<td>Booking ID</td>
				<td>Booking Date</td>
				<td>Confirmed Status</td>
				<td>Artist Booked</td>
			</tr>
		</thead>
		<tr>
			<td>${booking.id }</td>
			<td>${booking.bookingDate }</td>
			<td>${booking.confirmed }</td>
			<td>${booking.artist.name }</td>
		</tr>
		<tbody>
		</tbody>

	</table>

</c:forEach> --%>


		<c:if test="${showForm == 'true'}">

			<div class="jumbotron text-center">


				<div>

					<img src="${user.photoUrl }" height=200 width=200
						class="img-circle text-center">
				</div>



				<form class="text-center form-horizontal "
					action="updateUserByUser.do" method="GET">

					<div>
						<input type="hidden" name="userId" value="${user.id } ">
					</div>

					<br> <br>
					<div class="form-group text-center">
						<label for="inputEmail3"
							class="col-sm-2 col-sm-offset-3 control-label">First Name
						</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="firstName"
								value="${user.firstName }" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 col-sm-offset-3 control-label">Last Name
						</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="lastName"
								value="${user.lastName }">
						</div>
					</div>


					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 col-sm-offset-3 control-label">Email </label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="email"
								value="${user.email }">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 col-sm-offset-3 control-label">Password </label>
						<div class="col-sm-3">
							<input class="form-control" type="password" name="password"
								value="${user.password }">
						</div>
					</div>

					<div class="form-group">
						<label for="inputPassword3"
							class="col-sm-2 col-sm-offset-3 control-label">Photo URL
						</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="photoUrl"
								value="${user.photoUrl }">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-5">
							<button type="submit" class="btn btn-default">Update!</button>
						</div>
					</div>
				</form>

			</div>

		</c:if>
		<br> <br> <br> <br>

	</div>



	<footer class="panel-footer">
	<div class="container footerText">Copyright BandStand 2016</div>
	</footer>
</body>

</html>