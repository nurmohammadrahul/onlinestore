<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
			<div class="card">
			<div class="card-body">
			<h4 class="text-center text-primary">Edit Profile</h4>
			<c:if test="${not empty succmsg }">
						<p class="text-center text-danger">${succmsg }</p>
						<c:remove var="succmsg" scope="session"/>
						</c:if>
			<form action="update" method="post">
			<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" value="${userobj.name }"
									required="required" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${userobj.email }"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="${userobj.phno }"
									required="required" name="phn">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							
							<hr>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Edit Profile</button>
							</div>

						</form>
			
			
			</div>
			</div>
				
			</div>
			</div>
		
	</div>

	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>