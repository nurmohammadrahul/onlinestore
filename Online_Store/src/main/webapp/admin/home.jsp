<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration: none;
color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
			<a href="addbooks.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fas fa-duotone fa-book-medical fa-4x text-danger"></i><br><br>
					<h3>ADD BOOKS</h3>
					-------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
					<i class="fas fa-duotone fa-book fa-4x text-warning"></i><br><br>
					<h3>ALL BOOKS</h3>
					-------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
			<a href="order.jsp">
				<div class="card">
					<div class="card-body text-center">
				<i class="fas fa-regular fa-boxes-stacked fa-4x text-primary"></i><br><br>
					<h3>ORDER</h3>
					-------------
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
	
	<hr>
	<%@include file="footer.jsp"%>
</body>
</html>