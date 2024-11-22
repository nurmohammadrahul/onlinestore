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
.back-img {
	background: url(img/a.jpg);
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.card-ho:hover {
	background-color: #e8eaf6;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-danger text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<div class="container-fluid back-img">
		<h1 class="text-center text-white">Online Bookstore</h1>
	</div>

	<!-- Recent Book -->
	<div class="container mt-2">
		<h2 class="text-center">Recent Books</h2>
		<div class="row p-3">

			<%
			BooksDAOImpl dao1 = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao1.getNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<a href="" class="btn btn-primary btn-sm ml-1">Details</a> <a
								href="#" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-bangladeshi-taka-sign"></i> <%=b.getPrice()%></a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
	</div>
	<!-- End of Recent Books -->
	<hr>
	<!-- New Books -->
	<div class="container mt-2">
		<h2 class="text-center">ALL Books</h2>
		<div class="row p-3">

			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card card-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 200px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="" class="btn btn-primary btn-sm ml-1">Details</a> <a
								href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-bangladeshi-taka-sign"></i> <%=b.getPrice()%></a>
							<a href="login.jsp" class="btn btn-success btn-sm ml-1">Add
								To Cart</a>
							<%
							} else {
							%>
							<a href="" class="btn btn-primary btn-sm ml-1">Details</a> <a
								href="cart?bid=<%=b.getBookID()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-bangladeshi-taka-sign"></i> <%=b.getPrice()%></a>
							<a href="cart?bid=<%=b.getBookID()%>&&uid=<%=u.getId()%>"
								class="btn btn-success btn-sm ml-1">Add To Cart</a>
							<%
							}
							%>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
	</div>
	<div class="text-center mt-1">
		<a href="allbooks.jsp" class="btn btn-success btn-lg text-white">View
			All</a>
	</div>
	<!-- End of New Book -->
	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>