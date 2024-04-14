<%@page import="smartMukkam.com.admin.AdminDAO"%>
<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@page import="smartMukkam.com.municipality.GalleryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>municipality</title>
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
	
	<style>
		.nav-link{
			color: black;
			display: inline-block;
		}
		.nav-link:hover {
			color: blue;
		}
	   	.profile-image {
		  width: 40px;
		  border-radius: 50%;
		}
		
		.tooltip {
		  visibility: hidden;
		  background-color: #333;
		  color: #fff;
		  text-align: center;
		  padding: 5px;
		  border-radius: 5px;
		  position: absolute;
		  z-index: 1;
		  opacity: 0;
		  transition: opacity 0.3s;
		}
		
		.nav-item:hover .tooltip {
		  visibility: visible;
		  opacity: 1;
		}
		.availability-status.online {
			<%
			String adminActive=AdminDAO.getActiveAdmin() ;
			if(adminActive.equals("active")){
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
		.homeFull{
		 	max-width: 1000px;
		 	height: auto;
		 	border: 1px solid;
		}
		.home{
			width: 100%;
			height: 30px;
			background: #bebcd4;;
		}
		.home span{
			margin: 5px;
		    color: #311B92;
		    font-size: medium;
		    font-weight: 600;
		}
		
	</style>
	
</head>
<body>
<%
Integer uid = (Integer) session.getAttribute("mid");

String email = (String) session.getAttribute("muncipalityEmail");

if(email == null){
	response.sendRedirect("municipalityLogin.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");
%>

<nav class="navbar bg-body-tertiary" style="height: 80px; background: #84818317;">
  <div class="container">
    <a class="navbar-brand" href="municipality.jsp" >
      <img src="images/png-transparent-government-of-india-logo-gold.png"Bootstrap" style="width: 50px;" >
      <img src="images/kerala-govt-logo.png" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
     </a>
      
      
    
      <ul class="nav justify-content-end">
      	    <li class="nav-item">
		      <img alt="" src="adminProView?id=<%=1%>" class="profile-image">
		      <span class="tooltip">Admin online</span>
		      <span class="availability-status online"></span>
		      <span class="tooltip">
					<%
						      
					  if(adminActive.equals("active")){
						   out.print("Admin is online");
					  }else{
						    out.print("Admin is offline");  
						}
				      %>
					</span>
		    </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="municipality.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="municipalityLogout.jsp">Logout</a>
		  </li>
		  
		  
		  
		</ul>
    </a>
  </div>
</nav>
<div class="container-fluid">
<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityAppointment.jsp">Appointments</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityRegistration.jsp">Registrations</a>
			  </li>
			 
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityProfile.jsp">Profile</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityProject.jsp">Projects</a>
			  	</li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityComplaint.jsp">Complaints</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipality.jsp">Home</a>
			  </li>
			 
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityFeedback.jsp">Feedback</a>
			  </li>
			</ul>
			    	
    </div>
    <div class="col-sm-10">
    	<div class="homeFull" style="margin: 50px;">
    		<div class="home">
    			<span>Upload Gallery</span>
    		</div>
    		<%			if(alert != null && alert.equals("success")){
                        	out.print("<div id='alert' class='alert alert-success' style='color:black;' role='alert'>Gallery update Success</div>");
                        }else if(alert != null && alert.equals("failed")){
                        	out.print("<div id='alert' class='alert alert-dainger' style='color:red;' role='alert'>Gallery update failed</div>");
                        	
                        }
                        else{
                        	
                        }
    		%>
    		<form action="mg" method="post" enctype="multipart/form-data" style="margin: 30px;">
				  
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
			<div class="home">
    			<span>View Gallery</span>
    		</div>
    		<%			if(alert != null && alert.equals("successDelete")){
                        	out.print("<div id='alert' class='alert alert-success' style='color:black;' role='alert'>Gallery delete Success</div>");
                        }else if(alert != null && alert.equals("failedDelete")){
                        	out.print("<div id='alert' class='alert alert-dainger' style='color:red;' role='alert'>Gallery delete failed</div>");
                        	
                        }
                        else{
                        	
                        }
    		%>
    		<div class="row" style="margin: 10px;">
    			<%
    			List<GalleryDTO> images = ServicesDTO.getAllImages();
    			for(GalleryDTO im : images){
    			%>
    				<div class="col" style="margin: 10px;">
	    				<div class="card" style="width: 16rem;">
							  <img src="ivg?id=<%=im.getTid() %>" class="card-img-top" style="max-height: 150px;" alt="...">
							  <div class="card-body">
							  	<a href="municipalityGalleryDelete.jsp?tid=<%=im.getTid()%>"><i class="fa fa-trash" aria-hidden="true" style="position: relative; left: 90%;color: red;"></i></a>
							    <p class="card-text"><%=im.getDescription() %></p>
							  </div>  
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