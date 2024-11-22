<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3" style="height:20px; background-color: #006064;"></div>
<div class="container-fluid ">
	<div id="na"class="row">
		<div class="col-md-3 p-3 text-success">
			<h3><i class="fas fa-light fa-book-open-reader"></i> Online BookStore</h3>
		</div>
		<c:if test="${not empty userobj }">
		<div class="col-md-5 flex p-3">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<div class="col-md-4 p-3">
		<a href="cart.jsp" class="btn btn-lg btn-success"><i class="fa-solid fa-cart-shopping"></i></a>
		<a href="index.jsp" class="btn btn-success">${userobj.name}</a>
		
		
		<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary"><i class="fas fa-solid fa-right-from-bracket"></i> Logout</a>
		</div>
		</c:if>
		<c:if test="${empty userobj }">
		<div class="col-md-6 p-3">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3 p-3">
		<a href="login.jsp" class="btn btn-success"><i class="fas fa-solid fa-right-to-bracket"></i> Log In</a>
	
		
		<a href="register.jsp" class="btn btn-primary"><i class="fas fa-thin fa-address-card"></i> Register</a>
		</div>
		</c:if>
		
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
			<li class="nav-item active"><a class="nav-link" href="allbooks.jsp"><i class="fas fa-regular fa-book-open"></i> Books</a></li>
		
			
			<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li> -->
		</ul>
		<form class="form-block my-2 my-lg-0">
			<a href="setting.jsp"class="btn btn-success my-2 my-sm-0" type="submit"><i class="fas fa-regular fa-gear"></i> Setting</a>
			<button class="btn btn-success my-2 my-sm-0" type="submit"><i class="fas fa-duotone fa-address-book"></i> Contact Us</button>
		</form>
	</div>
</nav>


<!-- Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h4>Do you want to Logout?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="logout"type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>