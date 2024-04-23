<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop Sectors</title>

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
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
.list-group-item{
 	background: transparent;
 	width: 300px;
    color: #494545;
    border: 0px;
}

</style>
</head>
<body>
<nav class="navbar bg-body-tertiary">
 
    <a class="navbar-brand" href="#">
      <img src="images/logo-en-LSGD.png" alt="Bootstrap"  height="24">
    </a>
    <div style="text-align: center; text-transform: uppercase;font-weight: 700; font-size: larger;">Shops</div>
    <ul  class="nav justify-content-end">
    	<li class="nav-item">
		    <a class="nav-link" style="color: red;" href="useLogout.jsp?sid=<%=uid%>">Logout</a>
		  </li>
    </ul>
 
</nav>
<div class="container">

	<nav class="navbar justify-content-center align-items-center" style="background: #c9d8db;margin-top: -14px;box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);">
	 	<div class="row " style="color: white;">
	 		<div class="col mx-auto">
				<ul class="list-group" style="border: 0px;">
				  <li class="list-group-item"><img alt='' id='profileImage' src='userPhoto?id=<%=uid %>' style='margin-right: 10px; margin-bottom: 5px; width: 75px; border-radius: 50%; height: 75px;border: 1px solid white;'/></li>
				  <li class="list-group-item"></li>
				 
				</ul>	 		
	 		</div>
	 		<div class="col mx-auto">
	 			<ul class="list-group">
				  <li class="list-group-item"><i class="fa fa-user" aria-hidden="true"></i> <%=name %></li>
				  <li class="list-group-item"><i class='fa fa-envelope mr-2'></i> <%=email %></li>
				</ul>
	 		</div>
	 		<div class="col mx-auto">
	 			<ul class="list-group">
				  <li class="list-group-item"><i class='fa fa-phone-alt mr-2'></i> <%=number %></li>
				  <li class="list-group-item"><i class=' fa fa-globe mr-2'></i> <img alt="" style="width: 30px" src="w2560/<%=country %>.png"></li>
				</ul>
	 		</div>
	 	</div>
	</nav>
	
</div>
<div class="container-fluid py-5">
        <div class="container pt-5 pb-3" id="services">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">SMART MUKKAM</h6>
                <h1>Shop sectors</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/superMarket.jpg" alt="">
                       
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Super market">
                            <h5 class="text-white">Super market</h5>
                            
                        </a>
                       
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/Itshop.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=IT sector">
                            <h5 class="text-white">IT sector</h5>
                           
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/cloth.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Clothing stores">
                            <h5 class="text-white">Clothing stores</h5>
                           
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/vegitable.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=vegetables and fruits">
                            <h5 class="text-white">vegetables and fruits</h5>
                          
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/Bookstores.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Bookstores">
                            <h5 class="text-white">Bookstores</h5>
                          
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/Hardware.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Hardware stores">
                            <h5 class="text-white">Hardware stores</h5>
                          
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/Pharmacies.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Pharmacies">
                            <h5 class="text-white">Pharmacies</h5>
                          
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/Jewellery.jpeg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Jewellery">
                            <h5 class="text-white">Jewellery</h5>
                          
                        </a>
                    </div>
                </div>
                 <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/shop.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp?sector=Other">
                            <h5 class="text-white">Other</h5>
                          
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>




<!-- Template Javascript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>