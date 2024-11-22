<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">User Login</h4>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-danger">${succMsg }</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failmsg }">
						<p class="text-center text-danger">${failmsg }</p>
						<c:remove var="failmsg" scope="session"/>
						</c:if>
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp"
									placeholder="Enter email" required="required">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder="Password" required="required">
							</div>

							<hr>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> if you don't have an account <a href="register.jsp">Create
									Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>