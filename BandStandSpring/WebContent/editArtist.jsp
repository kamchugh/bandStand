<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateArtist.do" method="GET">
			<h3>Add New Artist</h3>
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
			<input
				type="submit" value="Update Artist">
		</form>
</body>
</html>