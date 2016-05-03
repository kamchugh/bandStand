<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>






















    <form action="updateUser.do" method="GET">
			<h3>Update User</h3>
			<input type="hidden" name="userId" value="${user.id } "> 
			First Name
			<input type="text" name="firstName" value="${user.firstName }" />
			Last Name
			<input type="text" name="lastName" value="${user.lastName }">
			Email
			<input type="text" name="email" value="${user.email }">
			Password
			<input type="password" name="password" value="${user.password }">
			Photo URL
			<input type="text" name="photoUrl" value="${user.photoUrl }">
			<input type="submit" value="Update">
		</form></body>
		
		<br><br><br><br>
		
		
		<c:if test="${user.accessLevel == 2}">
		<form action="Admin.jsp">
			<input type="submit" value="Admin Mode">
		</form>
	</c:if>
</html>