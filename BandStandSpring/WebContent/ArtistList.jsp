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

<title>Bare - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="stylesheet.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="ArtistList.jsp">BandStand</a>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="#">Hello, ${user.firstName }</a></li>
			<li>
				<!--                         <a href="#">Services</a>
 -->
			</li>
			<li>
				<!--                         <a href="#">Contact</a>
 -->
			</li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container --> </nav>

<body>
	<div class="container">
		<br> <br> <br> <br>

		<%-- 	<h1>User id: ${user.id}</h1>
		<h1>Hi there, ${user.firstName}</h1> --%>

		I'd like to... <br> <br>

<!-- <form class="form-inline">
 -->
		<div class="row">
			<div class="col-xs-2">

				<form action="getAllArtistsUser.do" method="GET">

					<input class="btn btn-default" type="submit"
						value="See All Artists">
				</form>
		

			</div>
			<div class="col-xs-2">

				<form action="searchByName.do" method="GET">
					<!-- 					<div>Search By Name</div>
 -->
					<select class="form-control" name="name">
						<option selected="selected">Select Artist</option>

						<c:forEach var="name" items="${all}">
							<option value="${name.name}">${name.name }</option>
						</c:forEach>
					</select> <input class="btn btn-default" type="submit" value="Go">
				</form>



				<!-- 				<button class="btn btn-default" type="submit">Search Name</button>-->
			</div>
			<div class="col-xs-2">


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


					</select> <input class="btn btn-default" type="submit" value="Go">
				</form>

			</div>
			<div class="col-xs-2">
				<form action="searchByRating.do" method="GET">
					<input type="hidden" name="userId" value="1"> <select
						class="form-control" name="rating">
						<option selected="selected">Select Rating</option>

						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> <input class="btn btn-default" type="submit" value="Go">
				</form>
			</div>
			<div class="col-xs-2">
				<form action="searchBookingsByUserId.do" method="GET">

					<input type="text" name="userId" value="${user.id }"> <input
						class="btn btn-default" type="submit" value="See My Bookings">
				</form>

			</div>
			<div class="col-xs-2">
				<button class="btn btn-default" type="submit">Update My
					Info</button>
			</div>
		</div>




<!-- </form>
 -->

		<br> <br> <br> <br>



		<c:forEach var="artist2" items="${artist}">
<%-- 			<c:forEach var="photos" items="${ artist2}">
 --%>				<table class="table">
					<thead>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="getArtistById.do?artistID=${artist2.id}&userID=${user.id}">
							<img src="${artist2.photos[0].url}" height=200 width=200 class="img-rounded"/></a>
							</td>
							<td colspan="3">Artist: ${artist2.name} <br><br> ${artist2.email} <br><br> ${artist2.description } 
							<br><br> </td>
							<td></td>
							<td colspan="3"></td>
						</tr>
					</tbody>
				</table>
<%--         ${artist2.photos}
 --%><%-- 			</c:forEach>
 --%>		</c:forEach>


		<br> <br> <br> <br>



		<c:forEach var="booking" items="${bookings}">

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

		</c:forEach>
		<br> <br> <br> <br>



		<c:forEach var="artist" items="${ratingMatch}">
        ${artist.name}: ${artist.email}
    </c:forEach>




		<br> <br> <br> <br>

	</div>
</html>