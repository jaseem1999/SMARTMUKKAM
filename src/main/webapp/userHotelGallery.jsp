<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.GalleryDTO"%>
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
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Gallery</h6>
            </div>
            
            <div class="container">
            	<div class="row">
    				<%
    				List<GalleryDTO> gallery = ServiceDAO.getGalleryForUser(hoid);
    				for(GalleryDTO g : gallery){
    				%>
    				<div class="col">
    				<div class="card" style="width: 16rem;">
					  <img src="imHGallery?id=<%=g.getTid() %>" class="card-img-top" style="max-height: 150px;" alt="...">
					  <div class="card-body">
					    <p class="card-text"><%=g.getDescription() %></p>
					  </div>  
					</div>
    				</div>
    				<%} %>
    			</div>
            </div>
            
              <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

   

    <!-- Template Javascript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
   
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>