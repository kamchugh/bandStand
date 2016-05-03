
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
<title>Edit User</title>
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


<!-- 	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<a class="nabvar-brand" href="ArtistList.jsp">Home</a>
				</div>
				<div class="col-md-6">
					<a class="navbar-brand" href="Admin.jsp">Admin</a>
				</div>
			</div>
		</div>
	</nav> -->
	<div class="container">
		<div class="row text-center">
			<form action="updateUser.do" method="GET">
				<h3>Update User</h3>
				<div>ID</div>
				<input type="hidden" name="userId" value="${user.id } ">
				<div>First Name</div>
				<input type="text" name="firstName" value="${user.firstName }" />
				<div>Last Name</div>
				<input type="text" name="lastName" value="${user.lastName }">
				<div>Email</div>
				<input type="text" name="email" value="${user.email }">
				<div>Password</div>
				<input type="password" name="password" value="${user.password }">
				<div>Photo URL</div>
				<input type="text" name="photoUrl" value="${user.photoUrl }">
				<br> <input style="margin-top: 10px;" class="btn btn-default" type="submit" value="Update">
			</form>
		</div>
	</div>
</body>

<br>
<br>
<br>
<br>


<%-- <c:if test="${user.accessLevel == 2}">
	<form action="Admin.jsp">
		<input type="submit" value="Admin Mode">
	</form>
</c:if> --%>

</html>