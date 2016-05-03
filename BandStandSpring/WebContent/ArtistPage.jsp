<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link type="text/css" rel="stylesheet" href="custom.css" />
<title>Artist's Page</title>

<!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<style>
body {
	padding-top: 70px;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


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
				<a class="navbar-brand" href="#">Bandstand</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="ArtistList.jsp">Search</a></li>
					<li><a href="index1.jsp">Log out</a></li>
					<li><a href="editUser.jsp">Edit my account</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<div class="col-lg-12 text-center">
			 <c:if test="${! empty(date)}">
						<%-- ${booking.id} --%>
						<h3 class="orangeText">
							You booking for <b>${date} </b> is being processed. ${artist.name} will respond to you soon!
						</h3>
					</c:if>

				<h1>${artist.name}</h1>
				<p class="lead">
					<c:forEach var="g" items="${artist.genres}">
						<c:if test="${! empty(g)}">
				${g.genretype}
				</c:if>
					</c:forEach>
				</p>
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel" data-interval="8000">

					<!-- Indicators -->
			<!-- 		<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol> -->

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<div class="item active">
							<img
								src="http://www.artlimited.net/user/0/0/2/5/4/4/9/artlimited_img476686.jpg"
								style="width: 80%; height: 300px;">
						</div>

						<c:forEach items="${artist.photos}" var="photo">
							<div class="item">
								<img src="${photo.url}" style="width:; height: 300px;">

							</div>

						</c:forEach>

					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				<!-- Carousel -->
				<div class="container"
					style="padding-top: 15px; border-style: solid; border-color: black; border-radius: 20px; margin-top: 20px; margin-bottom: 20px;">
					<p class="lead" style="padding-top: 10px;">${artist.description}</p>

<%-- 					<p class="lead">
					<form action="getRatingsByBand.do" method="GET">
						<!-- User ID test -->
						<input type="hidden" name="userID" value="${user.id}"> <input
							type="hidden" name="artistID" value="${artist.id}"> <input
							class="btn btn-default" type="submit" name="RatingsByBand"
							value="Get rating for this artist">
					</form> 
					</p> --%>
					<ul class="list-inline" style="padding-top: 10px;">
					<li> 
					
						<c:if test="${! empty(ratings)}">
							<c:if test="${ratings <= 1}">
								<img
									src="http://fadmagazine.com/wp-content/uploads/one-star-rating.jpg"
									alt="Smiley face" height="42" width="140">
								<%-- ${ratings} --%>
							</c:if>

							<c:if test="${(ratings <= 2) && (ratings > 1)}">
								<img
									src="http://vignette3.wikia.nocookie.net/dickfiguresfanon/images/3/3a/Two-star-rating.png/revision/latest?cb=20140418000000"
									alt="Smiley face" height="42" width="140">

								<%-- ${ratings} --%>
							</c:if>
							<c:if test="${(ratings <= 3) && (ratings > 2)}">
								<img
									src="http://www.gobblertown.com/wp-content/uploads/2015/08/Three-Stars.jpg"
									alt="Smiley face" height="42" width="140">
								<%-- ${ratings} --%>
							</c:if>
							<c:if test="${(ratings <= 5) && (ratings > 4)}">
								<img
									src="http://www.ecofleetuk.com/wp-content/uploads/4-star-rating.png"
									alt="Smiley face" height="42" width="140">
								<%-- ${ratings} --%>
							</c:if>
						<%-- 		<c:if test="${(ratings = NaN)}">
								<p>Not yet rated</p>
							</c:if> --%>
							

						</c:if>
						</li>
						<li>
						<h4 style="padding-bottom: -20px;">${ratings}</h4></li>
					

					<ul class="list-inline" style="padding-top: 10px;">
						<li>See what others had to say!</li>
						<li>
							<form action="getCommentsByBand.do" method="GET">
								<!-- User ID test -->
								<input type="hidden" name="userID" value="${user.id}"> <input
									type="hidden" name="artistID" value="${artist.id}"> <input
									class="btn btn-default" type="submit" name="commentsByBand"
									value="Get all comments for this artist">
							</form>
						<li>
					</ul>


					<c:forEach var="comment" items="${comments}">
						<c:if test="${! empty(comment)}">
							<div class="overflow">
								<dl class="dl-horizontal">
									<dt>${comment.user.firstName}</dt>
									<dd>${comment.body}</dd>
								</dl>

							</div>
							<%-- 	${comment.body}
	${comment.user.firstName} --%>
						</c:if>
					</c:forEach>
				</div>
				<h3 style="padding-top: 10px; padding-bottom: 20px;">Listen to
					${artist.name}'s tunes</h3>
				<div>
					<c:forEach var="a" items="${artist.recordings}">
						<c:if test="${! empty(a)}">
				${a.url}
				</c:if>

					</c:forEach>


				</div>
				<h3 style="padding-top: 10px; padding-bottom: 20px;">Request
					${artist.name}</h3>

				<ul class="list-inline" style="padding-top: 10px;">
					<li>Request this band for a certain date</li>
					<li>
						<form action="addBooking.do" method="GET">
							<!-- User ID test -->
							<input type="hidden" name="userID" value="${user.id}">
							<!-- Artist ID test -->
							<input type="hidden" name="artistID" value="${artist.id}">
							<!-- Month <input type="textarea" name="month" value="10"> Day <input
		type="textarea" name="day" value="23"> Year <input
		type="textarea" name="year" value="2010"> <input type="submit"> -->
							<input class="form-control" type="date" name="date">
					</li>
					<li><input class="btn btn-warning" type="submit"
						name="Book this band"></li>
					</form>
					
					

				</ul>
				<ul class="list-inline" style="padding-top: 10px;">

					<li>
						<form action="getBookingsByBand.do" method="GET">
							<!-- User ID test -->
							<input type="hidden" name="userID" value="${user.id}"> <input
								type="hidden" name="artistID" value="${artist.id}"> <input
								class="btn btn-default" type="submit" name="bookingsByBand"
								value="Check their bookings first">
						</form>
					<li>
				</ul>
				<c:forEach var="booking" items="${bookings}">

					<c:if test="${! empty(booking)}">
						<%-- ${booking.id} --%>
						<p>
							<b>${booking.bookingDate} </b>
						</p>
					</c:if>

				</c:forEach>

				<div class="jumbotron">
					<h3 style="padding-top: 10px; padding-bottom: 20px;">Did
						${artist.name} perform at your event? Let us know what you
						thought!</h3>
					<ul class="list-inline">
						<li>Give ${artist.name} a rating</li>
						<li>
							<form action="addRating.do" method="GET">
								<input type="hidden" name="userID" value="${user.id}"> <input
									type="hidden" name="artistID" value="${artist.id}"> <select
									class="form-control" name="rating">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
						</li>
						<li><input class="btn btn-default" type="submit"></li>
						</form>
						<li>
					</ul>

					<p>Comment on ${artist.name}</p>
					<p>
					<form action="addComment.do" method="GET">
						<input type="hidden" name="userID" value="${user.id}"> <input
							type="hidden" name="artistID" value="${artist.id}">
						<textarea class="form-control" type="text" name="comment"
							value="comment"></textarea>
						<p style="padding-top: 10px;">
							<input class="btn btn-default" type="submit">
						</p>
					</form>
					<p>
					</ul>
				</div>

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<script>
		$('.carousel').carousel({
			interval : 3000
		})
	</script>

	<!-- jQuery Version 1.11.1 -->
	<!-- <script src="js/jquery.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->





	<footer class="panel-footer">
		<div class="container">I'm the footer</div>
	</footer>


	<%-- 	<form action="getAllPhotosForArtist.do" method="GET">
		<input type="hidden" name="artistId" value="${artist.id}"> <input
			type="submit" value="Get Photos">
	</form> --%>

</body>



<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>



</html>