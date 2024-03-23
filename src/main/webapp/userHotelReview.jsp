<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

Integer hoid = Integer.parseInt(request.getParameter("hoid"));
String alert = (String) request.getParameter("message");
if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
%>
<meta charset="ISO-8859-1">
<title><%=HotelDAO.getHotelName(hoid) %></title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar " style="background: black;">
  
    <a class="navbar-brand" href="#">
      <img src="himg?id=<%=hoid %>" alt="Bootstrap" width="40" height="30">
    </a>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="userHotelPages.jsp?id=<%=hoid%>"><i class="fas fa-utensils"></i> Restuarent</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="taxi.jsp?hoid=<%=hoid%>"><i class="fa fa-taxi" aria-hidden="true"></i> Taxi</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	
    </ul>
    
</nav>
 			<div class="text-center mb-3 pb-3" style="margin-top: 50px;">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Review</h6>
            </div>
            
            <div class="container">
            	<form action="userHotelReviewServlet.jsp" method="get">
				<input type="hidden" value="<%=uid %>" class="form-control" id="uid" name="uid" aria-describedby="commentHelp">
				<input type="hidden" value="<%=hoid %>" class="form-control" id="hoid" name="hoid" aria-describedby="commentHelp">
			 	<div class="mb-3">
			   	<label for="comment" class="form-label">Review</label>
			    <input type="text" class="form-control" id="comment" name="comment" aria-describedby="commentHelp" placeholder="Add review">
			    </div>
			  <button type="submit" class="btn btn-primary">Review</button>
			</form>
			
			
			
			<ul class="list-group" style="margin-top: 20px">
	<%
	List<ReviewDTO> review = ServiceDAO.getReviewForUser(hoid);
	for(ReviewDTO r : review){
	%>
	  <li class="list-group-item" style="background: white;">
	  	<div class="row">
	  		<div class="col-2">
	  		<img alt="" src="userPhoto?id=<%=r.getUid()%>" style="width: 50px;height: 50px; border-radius: 50%; ">
	  		
	  		</div>
	  		<div class="col-10" style="margin-left: 40px;"><%=r.getReview() %></div>
	  	</div>
	  	<hr>
	  	<div class="row justify-content-end">
		    <div class="col-11 text-right" style="">
		        <span>
		            <% if(r.getComment() != null) {
		                out.print(r.getComment());
		            } else {
		                out.print("");
		            } %>
		        </span>
		    </div>
		    <div class="col-1">
		        <img alt="" src="himg?id=<%=r.getHoid() %>" style="width: 50px;height: 50px; border-radius: 50%;">
		    </div>
		</div>
	  	
	  </li>
	  <hr>
	  <%} %>
	  
	</ul>
			
			
            </div>

</body>
</html>