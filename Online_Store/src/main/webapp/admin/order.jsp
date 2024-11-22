<%@page import="com.entity.BookOrder"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.entity.User"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ALL BOOKS</title>
<%@include file="allCss.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>
<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
<h3 class="text-center">Hello Admin</h3>
<table class="table">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col"> Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Book Name</th>
     <th scope="col">Author</th>
     <th scope="col">Price</th>
     <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
   	<%
			 User u=(User)session.getAttribute("userobj");
			 OrderDAOImpl dao= new OrderDAOImpl(DBConnect.getConn());
			 List<BookOrder>blist=dao.getBook();
			 for(BookOrder b :blist){%>
			 	<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAdd() %></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>

			</tr>
				 
			 <%}
			%>
		
  </tbody>
</table>

</body>
</html>