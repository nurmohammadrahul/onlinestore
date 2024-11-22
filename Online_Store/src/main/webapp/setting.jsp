<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="javax.servlet.http.HttpSession"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<base>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-solid fa-book fa-3x"></i>
						</div>
						
						<h3>My Order</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-solid fa-pen-to-square fa-3x"></i>
						</div>
						
						<h3>Profile</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="address.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-solid fa-address-book fa-3x"></i>
						</div>
						
						<h3>Address</h3>
						
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-danger">
						<i class="fas fa-solid fa-file-signature fa-3x"></i>
						</div>
						
						<h3>Help Center</h3>
						<h3>Contact Us</h3>
						<h3>crack@gmail.com</h3>
						</div>
					</div>
				</a>
			</div>
		</div>

	</div>

	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>