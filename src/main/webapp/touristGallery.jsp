<%@page import="smartMukkam.com.tourist.TouristGalleryDTO"%>
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
String alert = (String) request.getParameter("message");
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
	body {
      background-image: url('images/kerala-tourist.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      height: 100vh;
    }
	
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
<nav class="navbar bg-body-tertiary" style="height: 80px; background-color: rgb(0 0 0 / 65%) !important;">
  <div class="container" style="background: white;">
    <a class="navbar-brand" href="touristHome.jsp" style="background: black;">
      <img src="images/kerala-tourisum-logo.png" style="width: 150px;" >
      <%
      List<TouristDTO> profileTourist = TouristDAO.getAllTouristDetailsBasedTouristId(email);
      for(TouristDTO profile : profileTourist){
    	  toId = profile.getTouristId();
      %>
      <img src="timg?id=<%=profile.getTouristId()%>" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
      <%} %>
     </a>
     
    
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
		    <a class="nav-link active" aria-current="page" href="touristHome.jsp" style="color: black;">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="touristLogout.jsp?email=<%=email%>">Logout</a>
		  </li>
		  
		  
		  
		</ul>
  </div>
</nav>
<div class="container" style="">
	<div style="height: 60px;background: rgb(0 0 0 / 65%) !important;">
		<ul class="nav justify-content-center">
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristTicket.jsp">Ticket management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristHome.jsp">Home</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristReview.jsp">Review</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristWallpapper.jsp">Wallpaper management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristFeedback.jsp">Feedback</a></li>
		</ul>
	</div>
</div>

<div class="container" style="">
<div style="background: #000802b8; margin: 10px; box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5); color: white; height: 500px;">
	<div style="width: 100%; height: 30px; background: white;">
		<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Gallery</span>
	</div>
	
	<div class="row">
	
		<div class="col">
		<div style="border: 1px solid; height: 480px;">
		<div style="width: 100%; height: 30px; background: lightgreen;">
			<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Upload Gallery</span>
		</div>
			<%
			if(alert != null && alert.equals("success")){
	        	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Ticket added success</div>");
	        }
			if(alert != null && alert.equals("failed")){
				out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Ticket added Failed</div>");
	        }
			%>
			<form action="tGallery" method="post" enctype="multipart/form-data" style="margin: 30px;">
				  
				  <input type="hidden" value="<%=toId%>" class="form-control" id="toid" name="toid">
				  <div class="mb-3">
				    <label for="description" class="form-label">Description</label>
				    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload Image</label>
				    <input type="file" class="form-control" id="image" name="image">
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>	
		</div>
		
		<div class="col">
		<div style="border: 1px solid; height: 480px; overflow: scroll;">
		<div style="width: 100%; height: 30px; background: lightgreen;">
			<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">View gallery</span>
		</div>
		 <div class="row">
		 <%
		 List<TouristGalleryDTO> gallery = TouristDAO.getGalleryBasedToidforTourist(toId);
		 for(TouristGalleryDTO g : gallery){
		 %>		
				<div class="col" style="margin: 10px;">
	    				<div class="card" style="width: 16rem;">
							  <img src="tGallIm?id=<%=g.getTid() %>" class="card-img-top" style="max-height: 150px;" alt="...">
							  <div class="card-body">
							  	<a href=""><i class="fa fa-trash" aria-hidden="true" style="position: relative; left: 90%;color: red;"></i></a>
							    <p class="card-text"><%=g.getDescription() %></p>
							    <p class="card-text"><%if(g.getStatus() != null){
							    	out.print("<span style='color:red'>it's Deleted </span>");
							    }
							    	%></p>
							  </div>  
						</div>
					</div>
		<%
		 }
		%>
				</div>
		
		
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