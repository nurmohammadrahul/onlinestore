<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADDBOOKS</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body text-center">
					<h4 class="text-center">ADD Books</h4>
					<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg }</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failMsg }">
					<p class="text-center text-danger">${failMsg }</p>
					<c:remove var="failMsg" scope="session"/>
					</c:if>
					 <form action="../add_books" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input type="text"
									class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Author Name"
									required="required" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Price"
									required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
					              	class="form-control" id="inputState"
									required="required" name="bstatus">
									<option selected>Select</option>
									<option value="Active"> Active</option>
									<option value="Inactive"> Inactive</option>
									</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
					              	class="form-control-file" id="exampleFormControlFile1" type="file"
									required="required" name="bimg">
									
							</div>
							<hr>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">ADD</button>
							</div>

						</form>
					</div>
				</div>
			</div>
			</div>
			</div>
	<hr>
	<%@include file="footer.jsp"%>
</body>
</html>