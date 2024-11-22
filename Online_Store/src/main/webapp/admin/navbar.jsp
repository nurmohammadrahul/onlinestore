 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style type="text/CSS">
.bgg-custom{
	background-color: #006064 ;
}
.navbar .nav-item:hover .nav-linkk{
	background-color: white;
	color: #006064;
	border-radius: 25px;
}
</style>
<div class="container-fluid" style="height:10px; background-color: #006064;"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-10 text-success">
			<h3><i class="fas fa-light fa-book-open-reader"></i> Online BookStore</h3>
		</div>
	
		<div class="col-md-2">
		<c:if test="${not empty userobj }">
		<a href="home.jsp" class="btn btn-success"> ${userobj.name}</a>
		<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary"><i class="fas fa-solid fa-right-from-bracket"></i> Logout</a>
		
		</c:if>
		<c:if test="${ empty userobj }">
		<a href="../login.jsp" class="btn btn-success"><i class="fas fa-solid fa-right-to-bracket"></i> Log In</a>
		<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary"><i class="fas fa-solid fa-right-from-bracket"></i> Logout</a>
		</c:if>
		
		</div>
	</div>
</div>

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
        <a href="../logout"type="button" class="btn btn-primary">Logout</a>
      </div>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bgg-custom">
	
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-linkk" href="../index.jsp"><i class="fa-solid fa-house "></i> Home</a></li>
			<li class="nav-item active"><a class="nav-linkk" href="home.jsp"><i class="fa-solid fa-house "></i>   Admin Home</a></li>
			
			<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li> -->
		</ul>
	</div>
</nav>