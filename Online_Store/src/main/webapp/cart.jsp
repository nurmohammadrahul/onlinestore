<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
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
<title>Cart Page</title>
<base>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-danger text-center" role="alert">${succMsg }</div>
			<c:remove var="succMsg" scope="session"/>

	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Books</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice=0.0;
								for (Cart c : cart) {
									totalPrice=c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid() %>"
										class="btn btn-bm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
								<td>Total Price</td>
								<td></td>
								<td></td>
								<td><%=totalPrice %></td>
								</tr>





							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Details</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="name" name="name"
										class="form-control" id="inputEmail4" value="<%=u.getName()%>"readonly="readonly"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email" name="email"
										class="form-control" id="inputEmail4" value="<%=u.getEmail()%>" readonly="readonly"required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
									name="phn"	type="number" class="form-control" id="inputEmail4" value="<%=u.getPhno()%>"required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address"class="form-control" id="inputPassword4" value=""required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text" name="city"
										class="form-control" id="inputEmail4" value=""required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text" name="zip"
										class="form-control" id="inputPassword4" value=""required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control" name="payment"required>
									<option value="select">select</option>
									<option value="COD">COD</option>
								</select>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
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