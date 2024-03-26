<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Integer hoid = (Integer) session.getAttribute("hoid");
String owner = (String) session.getAttribute("owner");
String hotel = (String) session.getAttribute("hotel");
String hotelEmail = (String) session.getAttribute("hotelEmail");

if(hotelEmail == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");

%>
<title><%=hotel %></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
  
    <!-- Customized Bootstrap Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<style type="text/css">
	.profile-image {
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 23%;
		}
	.tooltip {
		  visibility: hidden;
		  background-color: #333;
		  color: #fff;
		  text-align: center;
		  padding: 5px;
		  border-radius: 5px;
		  position: absolute;
		  z-index: 100;
		  opacity: 0;
		  transition: opacity 0.3s;
		}
		
		.nav-item:hover .tooltip {
		  visibility: visible;
		  opacity: 1;
		}
		.availability-status.online {
			<%
			String munAdminActive = MunicipalityAdminDAO.getActive();
			if(munAdminActive.equals("active")){
				out.print("background: #1bcfb4;");
			}else{
				out.print("background: black;");  
			}
			%>
		    position: absolute;
		    width: 12px;
		    height: 12px;
		    border-radius: 57%;
		    border: 2px solid #ffffff;
		    margin-left: -5px;
  			  margin-top: 29px;
		}
		.description {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        max-width: 250px; /* Adjust max-width as needed */
        cursor: pointer; /* Change cursor to pointer to indicate it's clickable */
    }
    
	</style>
	
</head>
<body>
<nav class="navbar  border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="images/logo-en-LSGD.png" alt="Logo" width="150" height="30" class="d-inline-block align-text-top">
    </a>
  
  <ul class="nav justify-content-end">
  			<li class="nav-item">
		       <img alt="" src="images/keralaLogo.png" class="profile-image">
				<span class="tooltip">
					<%
						      
					  if(munAdminActive.equals("active")){
						   out.print("Municipality Admin is online");
					  }else{
						    out.print("Municipality Admin is offline");  
						}
				      %>
				</span>
			      <span class="availability-status online"></span>
			</li> 
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="hotelHome.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="hotelLogout.jsp?hoid=<%=hoid%>">Logout</a>
		  </li>	 
		  
	</ul>
	
</div>
</nav>

<div style="width: 100%; height: 150px;">
<img src="images/restaurant.jpg" class="img-fluid" alt="Responsive image" style="width: 100%; height: 150px;">
</div>
<div class="container-fluid position-relative nav-bar p-0" style="margin-top: -75px;">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            <%
	        List<HotelDTO> hotels = HotelDAO.getAllHotelDetailsForLogin(hotelEmail);
	        
	        for(HotelDTO h : hotels){
        %>
            	<img src="himg?id=<%=h.getHotelId()%>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
                <div class="row" style="margin: auto; width: 100%; color: white; height: 150px; background: #000000c4; border-radius: 16px;">
                	<ul class="col list-group" style="margin-top: 15px;">
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelRoomBooking.jsp"><i class="fa fa-bed" aria-hidden="true"></i> Manage rooms booking services</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelFood.jsp"><i class="fas fa-utensils"></i> Manage food ordering</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelTaxi.jsp"><i class="fa fa-taxi" aria-hidden="true"></i> Manage taxi service</a></li>
					</ul>
					<ul class="col list-group" style="margin-top: 15px;">
						<li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelGallery.jsp"><i class="fas fa-images"></i> Manage gallery</a></li>
						<li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelReview.jsp"><i class="fab fa-telegram" aria-hidden="true"></i> Manage review</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
					</ul>
                	
                	
                </div>
                <%} %>
            </nav>
        </div>
    </div>
    
   	<div class="text-center mb-3 pb-3" style=" margin-top: 30px;">
        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px; color: rgb(43 46 52) !important;">Feedback to admin</h6>
       
    </div>
	
	<%
	if(alert != null && alert.equals("feedbackSuccess")){
		out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Feedback send success</div>");
	}
	if(alert != null && alert.equals("feedbackFailed")){
		out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Feedback send failed</div>");
	}
	%>


	<div class="container-fluid py-5">
        <div class="container py-5">
           
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form bg-white" style="padding: 30px; margin-top: -70px;">
                        <div id="success"></div>
                        
						    <form action="hotelFeedbackServlet.jsp" method="post" id="contactForm" novalidate="novalidate">
						        <div class="control-group">
						            <input type="hidden" class="form-control p-4" id="hoid" value="<%=hoid%>" name="hoid" placeholder="Subject"
						                required="required" data-validation-required-message="Please enter a subject" />
						            <p class="help-block text-danger"></p>
						        </div>
						        <div class="control-group">
						            <textarea class="form-control py-3 px-4" rows="5" id="message" name="feedback" placeholder="Feedback"
						                required="required" data-validation-required-message="Please enter your Feedback"></textarea>
						            <p class="help-block text-danger"></p>
						        </div>
						        <div class="text-center">
						            <button class="btn btn-primary py-3 px-4" type="submit" id="sendMessageButton">Send feedback</button>
						        </div>
						    </form>
				
                        
                    </div>
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
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
	    var alertElement = document.getElementById('alert');
	    if (alertElement) {
	        setTimeout(function() {
	            alertElement.style.display = 'none';
	        }, 2000); // 2000 milliseconds = 2 seconds
	    }
	});

    
    </script>
</body>
</html>