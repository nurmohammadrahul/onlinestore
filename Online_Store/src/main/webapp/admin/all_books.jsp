<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
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
<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
    <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Status</th>
     <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <% 
  BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
  List<BookDtls> list=dao.getAllBooks();
  for(BookDtls b:list){
	  %>
	  <tr>
      <td><%=b.getBookID()%></td>
      <td><img src="../books/<%=b.getPhotoName()%>"
       style="width:50px; height:50px;"></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getStatus()%></td>
     <td>
     <a href="editbooks.jsp?id=<%=b.getBookID()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
      <a href="../delete?id=<%=b.getBookID()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-delete-left"></i> Delete</a>
     </td>
    </tr>
	<%  
  }
  %>
    
     
  </tbody>
</table>

</body>
</html>