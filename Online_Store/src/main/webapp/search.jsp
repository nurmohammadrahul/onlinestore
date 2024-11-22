<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
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
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body>
<%
	User u=(User)session.getAttribute("userobj");
	%>
<c:if test="${not empty addCart }">
<div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center text-white">Online Bookstore</h1>
	</div>
	<!-- New Books -->
	<div class="container mt-2">
		<h2 class="text-center">Search Result</h2>
		<div class="row">
			
			<%
			String ch=request.getParameter("ch");
			  BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls>list=dao.getBookBySearch(ch);
			for(BookDtls b: list){%>
			<div class="col-md-3">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName() %>"
							style="width: 200px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor() %></p>
						<div class="row">
						 <%if(u==null){
							 %>
							 <a href="" class="btn btn-primary btn-sm ml-1">Details</a> <a
								href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-bangladeshi-taka-sign"></i> <%=b.getPrice()%></a>
							<a href="login.jsp" class="btn btn-success btn-sm ml-1">Add To Cart</a>
						<%}else{ %>
						 <a href="" class="btn btn-primary btn-sm ml-1">Details</a> <a
								href="cart?bid=<%=b.getBookID() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-bangladeshi-taka-sign"></i> <%=b.getPrice()%></a>
							<a href="cart?bid=<%=b.getBookID() %>&&uid=<%=u.getId() %>" class="btn btn-success btn-sm ml-1">Add To Cart</a>
						<%} %>
							
						</div>
					</div>
				</div>
				</div>
			<%}
			%>
				
			

		</div>
	</div>
	<!-- End of New Book -->
	<hr>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>