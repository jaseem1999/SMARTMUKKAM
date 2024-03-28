<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

String alert = (String) request.getParameter("message");
if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
%>
<meta charset="ISO-8859-1">
<title>Hotels</title>
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

	<style type="text/css">
	body {
      background-image: url('images/hw3.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      height: 100vh;
    }
	
	</style>
</head>
<body>
<nav class="navbar " style="background: #0a000000;">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="images/keralaLogo.png" alt="Bootstrap" width="50" height="40">
    </a>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	<li class="nav-item"><a class="nav-link" style="color: white; font-weight: bolder;" href="useLogout.jsp">Logout</a></li>
    </ul>
    
  </div>
</nav>
<div style="height: 600px; width: 100%">
	<div class="container">
		<div class="row">
			<div class="col">
				<div style="margin-top: 30px; width: 600px; heigt: 80px; background: #0000009c; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; overflow: hidden;">
				    <h1 style="font-family: 'Arial', sans-serif; color: white; margin-top: 20px; margin-bottom: 20px; font-size: 24px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Discover the Hotel's in Mukkam</h1>
				</div>
				<div style="margin-top: 30px; width: 600px; heigt: 80px; background: #0000009c; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; overflow: hidden;">
				    <div style="background: white;">
				    	<img src="images/logo-en-LSGD.png" alt="Bootstrap" width="150" height="24">
				    </div>
				    <p style="font-family: 'Arial', sans-serif; color: white; margin-top: 20px; margin-bottom: 20px; font-size: 16px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
				    
				   	
Mukkam, a town in Kerala, India, has different hotels for people to stay in. Some are small and cozy, while others are more modern and have lots of facilities. Whether you want a quiet place or somewhere close to the action, Mukkam has options for everyone. The hotels here are friendly and offer tasty food, comfy beds, and helpful staff. With its pretty views, lively markets, and interesting places to visit, Mukkam is a nice place to stay and relax.
				    </p>
				</div>
				
			</div>
			<div class="col">
				<div class="container pt-5 pb-3">
    		
    			</div>
			</div>
		</div>
	</div>
</div>



<div class="container" style="background: #000000ad; height: auto;">
<div class="container-fluid py-5">
        <div class="container pt-5 pb-3" id="services">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Get Hotel Services</h6>
                <h1 style="color: white;">Hotels</h1>
            </div>
            <div class="row">
	
			<%
            	List<HotelDTO> hotels = HotelDAO.getAllHotelDetailsForMunicipality();
            	for(HotelDTO h: hotels ){
            	%>
                <div class="col-lg-4 col-md-6 mb-4" style="">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="himg?id=<%=h.getHotelId()%>" style="max-height: 150px; width: 100%" alt="">
                        
                        <% if ("accept".equals(h.getStatus())) { %>
                            <a class="destination-overlay text-white text-decoration-none" href="userHotelPages.jsp?id=<%=h.getHotelId() %>">
	                            <h5 class="text-white"><%=h.getHotelName() %></h5>
	                            <span><%=h.getAddressOne() %> </span> 
	                        </a>
                        <% } else if ("reject".equals(h.getStatus())) { %>
                            <a class="destination-overlay text-white text-decoration-none" href="#">
	                            <h5 class="text-white"><%=h.getHotelName() %></h5>
	                            <span>It's blocked</span> 
	                        </a>
                        <% } else { %>
                            <a class="destination-overlay text-white text-decoration-none" href="#">
                                <h5 class="text-white"><%= h.getHotelName() %></h5>
                                <span>It's under processing</span>
                            </a>
                        <% } %>
                    </div>
                </div>
                <%} %>
                </div>
                </div>
                </div>
    </div>


 <!-- JavaScript Libraries -->
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