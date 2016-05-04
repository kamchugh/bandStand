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
					<li><a class="nabvar-brand" href="ArtistList.jsp">Home</a></li>
					<li><a class="navbar-brand" href="Admin.jsp">Admin Home</a></li>
					</li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

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
		<h3 class="orangeText">You've successfully removed a recording from
			${artist.name}!</h3>
	</c:if>
	<div class="elements">
		<div class="container">
			<div class="row text-center">
				<form action="updateArtist.do" method="GET">
					<h3>Edit Artist</h3>
					<div>Id</div>
					<input type="placeholder" name="id" value="${artist.id}">
					<div>Artist Name</div>
					<input type="text" name="name" value="${artist.name}">
					<div>Artist Email</div>
					<input type="text" name="email" value="${artist.email}">
					<div>Artist Password</div>
					<input type="text" name="password" value="${artist.password}">
					<div>Artist Description</div>
					<input type="text" name="description" value="${artist.description}">
					<br>
					<button style="margin-top: 10px;" class="btn btn-default"
						type="submit">Update Artist</button>
				</form>
			</div>
		</div>
		<div class="container">
			<div class="row text-center">

				<h3 style="padding-bottom: 25px;"> Add Multiples</h3>
				<form action="addRecording.do" method="GET">

					<input type="hidden" name="artistID" value="${artist.id} ">
					<input type="placeholder" name="recording" value=" ">
					<div>
						<button style="margin-top: 10px;"
							class="btn btn-default bottomMargin" type="submit">Add
							Recording</button>
					</div>
				</form>
				<form action="addPhoto.do" method="GET">

					<input type="hidden" name="artistID" value="${artist.id} ">
					<input type="placeholder" name="photo" value=" ">
					<div>
						<button style="margin-top: 10px;"
							class="btn btn-default bottomMargin" type="submit">Add
							photo</button>
					</div>
				</form>
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

	<button style="margin-bottom: 10px; margin-top: 30px; margin-left: 20px;" class="btn btn-default"
		onclick="document.getElementById('id01').style.display='block'">
		View photos</button>

	<div id="id01" class="w3-container w3-red" style="display: none">
		<span onclick="this.parentElement.style.display='none'"
			class="w3-closebtn">&times; Close photos</span>

		<c:forEach items="${artist.photos}" var="photo">
			<div class="item">
				<img src="${photo.url}" style="width: 200px; height: 200px;">
				<form action="deletePhoto.do" method="GET">
				<input type="text" name="artistID" value="${artist.id}">
				<input type="text" name="photo" value="${photo.id} ">
					<button style="margin-top: 10px;"
						class="btn btn-default bottomMargin" type="submit">Delete
						photo</button>
				</form>

			</div>

		</c:forEach>
	</div>
	
	
	<button style="margin-bottom: 10px; margin-top: 30px; margin-left: 20px;" class="btn btn-default"
		onclick="document.getElementById('id02').style.display='block'">
		View Recordings</button>

	<div id="id02" class="w3-container w3-red" style="display: none">
		<span onclick="this.parentElement.style.display='none'"
			class="w3-closebtn">&times; Close recordings</span>

		<c:forEach items="${artist.recordings}" var="recording">
			<div class="item">
				${recording.url}
				<form action="deleteRecording.do" method="GET">
				<input type="text" name="artistID" value="${artist.id}">
				<input type="text" name="recording" value="${recording.id} ">
					<button style="margin-top: 10px;"
						class="btn btn-default bottomMargin" type="submit">Delete
						Recording</button>
				</form>

			</div>

		</c:forEach>
	</div>

</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>