<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
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
					<h4 class="text-center">Edit Books</h4>
					
					<%
					int id=Integer.parseInt(request.getParameter("id"));
					BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
					BookDtls b =dao.getBookById(id);
					%>
					
					
					 <form action="../edit_books" method="post">
					 <input type="hidden" name="id" value="<%=b.getBookID()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input type="text"
									class="form-control" id="exampleInputName1"
									aria-describedby="emailHelp" value="<%=b.getBookName()%>"
									required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getAuthor()%>"
									required="required" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getPrice()%>"
									required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
					              	class="form-control" id="inputState"
									required="required" name="bstatus">
									<%
									if("Active".equals(b.getStatus())){%>
										<option value="Active"> Active</option>
									<%}else{%>
										<option value="Inactive"> Inactive</option>
									<%}
									
									%>
									
									
									</select>
							</div>
							
							<hr>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Edit</button>
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