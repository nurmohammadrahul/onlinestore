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
<title>Edit Address</title>
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
			<div class="col-md-4 offset-md-4">
			<div class="card">
			<div class="card-body">
			<h4 class="text-center text-primary">Address</h4>
			<form action="register" method="post">
						<div class="form-row">
																<div class="form-group col-md-12">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="number"
										class="form-control" id="inputPassword4" value="">
								</div>
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-warning">ADD ADDRESS</button>
								 
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