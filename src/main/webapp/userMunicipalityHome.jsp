<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
%>
<meta charset="ISO-8859-1">
<title>Welcome to Mukkam Municipality</title>
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
     <link href="css/style.css" rel="stylesheet">
     <style type="text/css">
     .nav-link{
			color: black;
			display: inline-block;
		}
		.nav-link:hover {
			color: blue;
		}
		.homeFull{
		 	max-width: 1000px;
		 	height: 500px;
		 	border: 1px solid white;
		 	box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);
		}
		.home{
			width: 100%;
			height: 30px;
			background: #7AB730;
		}
		.home span{
			margin: 5px;
		    color: black;
		    font-size: medium;
		    font-weight: 600;
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
			String munAdminActive = MunicipalityAdminDAO.getActive();
			if(munAdminActive.equals("active")){
				out.print("background: #1bcfb4;");
			}else{
				out.print("background: black;");  
			}
			%>
		    position: absolute;
		    width: 10px;
		    height: 10px;
		    border-radius: 57%;
		    border: 2px solid #ffffff;
		    margin-left: -10px;
    		margin-top: 17px;
		}
     </style>


</head>
<body>
	
	<div class="container-fluid bg-light pt-3 d-none d-lg-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        <p class="text-body px-3">|</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 6789</p>
                        <ul>
                         <li class="nav-item">
		                    <img alt="" src="images/kerala-govt-logo.png" class="profile-image">
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
				    	</ul>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-primary px-3" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-primary px-3" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-primary px-3" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-primary px-3" href="">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a class="text-primary pl-3" href="">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
                <div class="d-inline-flex align-items-center">
			                <%
					  if (email != null){
					  		
					  			out.print("<img alt='' id='profileImage' src='userPhoto?id="+uid+"' style='margin-right: 10px; margin-bottom: 5px; width: 75px; border-radius: 50%; height: 75px;border: 1px solid white;'/>");
					  		
					  
					  }else{
					  		out.print("");
					  	}
					  %>
			                
			                     
                        <%
                        if(email != null){
                        	out.print("<p><i class='fa fa-envelope mr-2'></i>");
                        	out.print(email);
                        }else{
                        	out.print("");
                        }
                        %>

                       
                        <%
                        if(name != null){
                        	out.print("<p class='text-body px-3'>|</p><p><i class='fa fa-user mr-2'></i>");
                        	out.print(name);
                        }else{
                        	out.print("");
                        }
                        %>
                        
                        <%
                        if(name != null){
                        	out.print("<p class='text-body px-3'>|</p><p><i class='fa fa-phone-alt mr-2'></i>");
                        	out.print(number);
                        }else{
                        	out.print("");
                        }
                       
                        if(name != null){
                        	out.print("<p class='text-body px-3'>|</p><p><i class=' fa fa-globe mr-2'></i>");
                        	out.print("<img alt='' style='width: 30px' src='w2560/"+country+".png'>");
                        }else{
                        	out.print("");
                        }
                        %>
                       
                        
                       
                        
                       
                </div>
                
            </div>
        </div>
    </div>
    <!-- Topbar End -->


<!-- Button trigger modal -->




    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">MUKKAM</span>MUNICIPALITY</h1>
                  
                </a>
               
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                    	<img src="images/png-transparent-government-of-india-logo-gold.png" style="margin: auto; width: 40px; height: 40px;" >
      					<img src="images/logo-en-LSGD.png" alt="Bootstrap" style="margin: auto; width: 200px;  height:40px; margin-left: 20px;" >
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="#" class="nav-item nav-link">About</a>
                       
                        
                      
                        <%
             			if(email != null){
             				out.print("<a class='nav-item nav-link' href='useLogout.jsp'>Logout</a>");
             			}else{
             				out.print("<a data-bs-toggle='modal' data-bs-target='#exampleModal' class='nav-item nav-link'>Login</a>");
             			}
                        %>
             
                        
                        
                        
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    
    
    <div class="container-fluid" style="margin-top: 50px;">
<div class="row">
    <div class="col-sm-3">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="userMunicipalityAppointment.jsp">Book appointments</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="userMunicipalityProject.jsp">Project submission</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="userMunicipalityComplaint.jsp">Complaint portal</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="userMunicipalityProfile.jsp">Profile</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="userMunicipalityGalleryView.jsp">Gallery</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="https://ksmart.lsgkerala.gov.in/ui/web-portal">K-smart</a>
			  </li>
			
			</ul>
			    	
    </div>
    <div class="col-sm-9">
    	<div class="homeFull" style="margin: 10px;">
    		<div class="home">
    			<span>Home</span>
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
    <script src="js/main.js"></script>
    <script type="text/javascript">
</body>
</html>