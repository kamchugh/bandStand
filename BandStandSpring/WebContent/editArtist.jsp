<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<button style="margin-top: 10px;" class="btn btn-default" type="btn btn-default">Update Artist</button>
			</form>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>