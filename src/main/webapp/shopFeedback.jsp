<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Integer sid = (Integer) session.getAttribute("sid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("shopemail");
Long phone = (Long) session.getAttribute("phone");
String shopType = (String) session.getAttribute("shopType");
String status = (String) session.getAttribute("status");
String shopName = (String) session.getAttribute("shopName");
String addressOne = (String) session.getAttribute("addressOne");
String addressTwo = (String) session.getAttribute("addressTwo");
String city = (String) session.getAttribute("city");
String state = (String) session.getAttribute("state");

if(shopType == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");
%>

<title><%=shopName %></title>
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
	<style type="text/css">
		.profile-image {
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 23%;
		}
		.homeFull{
		 	max-width: 1070px;
		 	height: auto;
		 	border: 1px solid white;
		 	box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);
		}
		.home{
			width: 100%;
			height: 30px;
			background: #353f5a;
			color: white;
		}
		.home span{
			margin: 5px;
		    color: black;
		    font-size: medium;
		    font-weight: 600;
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
	</style>
</head>
<body>
<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="shopImage?id=<%=sid %>" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      <span style="margin-left: 10px;"><%=shopName %></span>
    </a>
  
  <ul class="nav justify-content-end">
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
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="shopHome.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="shopLogout.jsp?sid=<%=sid%>">Logout</a>
		  </li>	 
		  
	</ul>
	
</div>
</nav>
	<div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            	<img src="shopImage?id=<%=sid %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #353f5a;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%= sid %></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= name %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= email %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= phone %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= shopType %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= status %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%= shopName %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= addressOne %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= addressTwo %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= city %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= state %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
            </nav>
        </div>
    </div>
<div class="container-fluid" style="margin-top: 50px;">
	<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
				<li class="list-group-item">
			  	<a class="nav-link" href="shopAddproduct.jsp"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add product</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopOrder.jsp"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> Orders</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAdvertisement.jsp"><i class="fa fa-film" aria-hidden="true"></i> Advertisement</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopReport.jsp"><i class="fa fa-flag" aria-hidden="true"></i> Report</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopGallery.jsp"><i class="fa fa-camera" aria-hidden="true"></i> Gallery</a>
			  	</li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopProductReview.jsp"><i class="fa fa-comments" aria-hidden="true"></i> Review</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
			  </li>
			  
			  <li class="list-group-item">
			  	<p class="nav-link" style="color: red;" >It's Administration panel for shops</p>
			  </li>
			</ul>
			    	
    </div>
    <div class="col-sm-10">
    	<div class="homeFull" style="margin: 50px;">
    		<div class="home">
    			<span style="color: white;">Feedback</span>
    		</div>
    		<%
			if(alert != null && alert.equals("feedbackSuccess")){
				out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Feedback send success</div>");
			}
			if(alert != null && alert.equals("feedbackFailed")){
				out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Feedback send failed</div>");
			}
			%>
			<form action="shopFeedbackServlet.jsp" method="post" style="margin: 30px;" onsubmit="return validateForm()">
				  <input type="hidden" value="<%=sid%>" class="form-control" id="sid" name="sid" aria-describedby="sid">
				  <div class="mb-3">
				    <label for="feedback" class="form-label">Feedback</label>
				    <input type="text" class="form-control" id="feedback" name="feedback" placeholder="Enter feedback">
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
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

    function validateForm() {
	    var feedback = document.getElementById("feedback").value.trim();

	    if (feedback === null || feedback === "") {
	        alert("Please enter feedback.");
	        return false;
	    }

	    return true;
	}
    </script>
</body>
</html>