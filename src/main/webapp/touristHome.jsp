<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
String name = (String) session.getAttribute("touristName");
String email = (String) session.getAttribute("touristEmail");
String tourist = (String) session.getAttribute("touristPlaceName");
Long number =(Long) session.getAttribute("touristPhone");
int toId = 0;
if(email == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}
%>
	<title><%=tourist %></title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<style type="text/css">
	.carousel-caption {
    	color: white;
	}
		.profile-image {
		      margin-top: 8px;
    		  height: 40px;
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
			margin-left: -14px;
		    margin-top: 13px;
  			  
		}
	
	</style>


</head>




<body>
<nav class="navbar bg-body-tertiary" style="height: 80px;">
  <div class="container" style="background: lightskyblue;">
    <a class="navbar-brand" href="#" >
      <img src="images/kerala-tourisum-logo.png" style="width: 150px;" >
      <%
      List<TouristDTO> profileTourist = TouristDAO.getAllTouristDetailsBasedTouristId(email);
      for(TouristDTO profile : profileTourist){
    	  toId = profile.getTouristId();
      %>
      <img src="timg?id=<%=profile.getTouristId()%>" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
      <%} %>
     </a>
     
     <div class="toast-container position-fixed bottom-0 end-0 p-3">
  		<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
		    <div class="toast-header">
		      <img src="timg?id=<%=toId%>" class="rounded me-2" alt="..." style="height: 50px;">
		      <strong class="me-auto"><%=tourist %></strong>
		      <small></small>
		      <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		    </div>
		    <div class="toast-body">
		      Hello, welcome! <%=name %> from admin panel of <%=tourist %>.
		    </div>
		  </div>
</div>
    
      	<ul class="nav justify-content-end">
      	   <li class="nav-item">
		      <img alt="" src="images/logo-en-LSGD.png" class="profile-image">
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
		    <a class="nav-link active" aria-current="page" href="" style="color: white;">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="touristLogout.jsp?email=<%=email%>">Logout</a>
		  </li>
		  
		  
		  
		</ul>
  </div>
</nav>
<div class="container" style="">
	<div style="height: 60px;background: #ebebeb; border: 1px solid #cacaca;">
		<ul class="nav justify-content-center">
			<li style=" margin: 10px; color: black;"><a class="nav-link" style="color: black;" href="touristTicket.jsp">Ticket management</a></li>
			<li style=" margin: 10px; color: black;"><a class="nav-link" style="color: black;" href="touristGallery.jsp">Gallery management</a></li>
			<li style=" margin: 10px; color: black;"><a class="nav-link" style="color: black;" href="touristReview.jsp">Review</a></li>
			<li style=" margin: 10px; color: black;"><a class="nav-link" style="color: black;" href="touristWallpapper.jsp">wallpaper management</a></li>
		</ul>
	</div>
</div>

<div id="carouselExampleDark" class="carousel carousel-dark slide" style="height: 500px; margin-top: 10px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="images/droneMukkam.jpg" class="d-block w-100" alt="..." style="height: 500px;">
      <div class="carousel-caption d-none d-md-block" style="color: white;" >
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="timg?id=<%=toId%>" class="d-block w-100" alt="..." style="height: 500px;">
      <div class="carousel-caption d-none d-md-block" style="color: white;">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/mukkamBridge.jpg" class="d-block w-100" alt="..." style="height: 500px;">
      <div class="carousel-caption d-none d-md-block" style="color: white;">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev" style="color: white;">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next" style="color: white;">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden" >Next</span>
  </button>
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

<script>
  // Use jQuery to show the toast on page load
  $(document).ready(function(){
    $('#liveToast').toast('show');
  });
</script>

</body>
</html>