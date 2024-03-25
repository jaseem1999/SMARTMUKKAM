<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.AdvertisementDTO"%>
<%@page import="java.util.List"%>
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

String alert = (String) request.getParameter("message");

%>

<meta charset="ISO-8859-1">
    <title>Smart City Mukkam</title>
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
</head>
<body>


	<div class="container-fluid bg-light pt-3 d-none d-lg-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <p><i class="fa fa-envelope mr-2"></i>ajkkalappatt@gmail.com</p>
                        <p class="text-body px-3">|</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+91 9847877534</p>
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
                        <% 
                        if(alert != null && alert.equals("userLogoutSuccess")){
                        	out.print("<div id='alert' class='alert alert-success' role='alert'> Logout Success</div>");
                        }
                        	
                        %>
                        
                       
                        
                       
                </div>
                
            </div>
        </div>
    </div>
    <!-- Topbar End -->


<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">User Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="userLogin" method="post">
        <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Email address</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="name@example.com">
		</div>
				<label for="inputPassword5" class="form-label">Password</label>
			<input type="password" id="inputPassword5" name="pass" class="form-control" aria-describedby="passwordHelpBlock">
			
			<input style=" margin-top: 10px;"  type="submit" class="btn btn-success" value="Login"/>
			<a style="margin-top: 10px;"  href="UserEmailValidation.jsp" class="btn btn-primary" >Sign up</a>
			<P style="margin-top: 10px;"><a href="#" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forget password</a></p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Shop Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="shopL" method="post">
        <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Email address</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="name@example.com">
		</div>
				<label for="inputPassword5" class="form-label">Password</label>
			<input type="password" id="inputPassword5" name="pass" class="form-control" aria-describedby="passwordHelpBlock">
			
			<input style=" margin-top: 10px;"  type="submit" class="btn btn-success" value="Login"/>
			<a style="margin-top: 10px;"  href="shopValidateEmail.jsp" class="btn btn-primary" >Sign up</a>
			<P style="margin-top: 10px;"><a href="#" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forget password</a></p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Tourist place Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="TouristLoginServlet.jsp" method="post">
        <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Email address</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="name@example.com">
		</div>
				<label for="inputPassword5" class="form-label">Password</label>
			<input type="password" id="inputPassword5" name="pass" class="form-control" aria-describedby="passwordHelpBlock">
			
			<input style=" margin-top: 10px;"  type="submit" class="btn btn-success" value="Login"/>
			<a style="margin-top: 10px;"  href="touristValidateEmail.jsp" class="btn btn-primary" >Sign up</a>
			<P style="margin-top: 10px;"><a href="#" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forget password</a></p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Hotel Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form action="hotelLoginServlet.jsp" method="post">
        <div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Email address</label>
			  <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="name@example.com">
		</div>
				<label for="inputPassword5" class="form-label">Password</label>
			<input type="password" id="inputPassword5" name="pass" class="form-control" aria-describedby="passwordHelpBlock">
			
			<input style=" margin-top: 10px;"  type="submit" class="btn btn-success" value="Login"/>
			<a style="margin-top: 10px;"  href="hotelValidateEmail.jsp" class="btn btn-primary" >Sign up</a>
			<P style="margin-top: 10px;"><a href="#" class="link-danger link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Forget password</a></p>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


<% 
                        if(alert != null && alert.equals("login")){
                        	out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Please Login then access services</div>");
                        }
						if(alert != null && alert.equals("shopLoginFailedPleaseContactMunicipality")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Please contact admin or municipality</div>");
						}
						if(alert != null && alert.equals("shopLoginFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Shop login Failed</div>");
						}
						if(alert != null && alert.equals("unautherizedAccess")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>unautherizedAccess</div>");
						}
						if(alert != null && alert.equals("useLoginFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>User login Failed</div>");
						}
						if(alert != null && alert.equals("touristRegistrationSuccess")){
							out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Sign up success</div>");
						}
						if(alert != null && alert.equals("touristRegistrationFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Sign up Failed</div>");
						}
						if(alert != null && alert.equals("touristLoginFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Tourist login Failed</div>");
						}
						if(alert != null && alert.equals("hotelRegistrationSuccess")){
							out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Hotel Sign up success</div>");
						}
						if(alert != null && alert.equals("hotelRegistrationFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Hotel Sign up failed</div>");
						}
						
						if(alert != null && alert.equals("wait")){
							out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Hotel Login stoped contact municipality</div>");
						}
						if(alert != null && alert.equals("LoginFailed")){
							out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Hotel Login Failed</div>");
						}
						if(alert != null && alert.equals("useLoginBlocked")){
							out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Login Blocked from admin</div>");
						}
						
                        	
                        %>
    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">SMART</span>MUKKAM</h1>
                </a>
               
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="#" class="nav-item nav-link">About</a>
                        <a href="#services" class="nav-item nav-link">Services</a>
                        
                        <a href="userMunicipalityHome.jsp" class="nav-item nav-link">Municipality</a>
                        <%
             			if(email != null){
             				out.print("<a class='nav-item nav-link' href='useLogout.jsp'>Logout</a>");
             			}else{
             				out.print("<a data-bs-toggle='modal' data-bs-target='#exampleModal' class='nav-item nav-link'>Login</a>");
             			}
                        %>
             
                        
                        <div class="nav-item dropdown">
                        <%
             			if(email != null){
             				
             			}else{
             				out.print("<a href='#' class='nav-link dropdown-toggle' data-toggle='dropdown'>Administrative Login</a>");
             			}
                        %>
                            
                            <div class="dropdown-menu border-0 rounded-0 m-0">
                                <a href="AdminLogin.jsp" class="dropdown-item">Administration</a>
                                <a href="municipalityLogin.jsp" class="dropdown-item">Municipality</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" class="dropdown-item">Shops</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal4"  class="dropdown-item">Hotels</a>
                                <a data-bs-toggle="modal" data-bs-target="#exampleModal3" class="dropdown-item">Tourist place</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->
    					
    <div class="container-fluid p-0">
    
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="images/mukkamBridge.jpg" alt="Image" style="max-height: 800px;">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Tours & Travel to Mukkam</h4>
                            <h1 class="display-3 text-white mb-md-4">Let's Discover The Mukkam Together</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Go to Gallery</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="images/mukkamMurinjad.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Tours & Travel to Murinjamad Island</h4>
                            <h1 class="display-3 text-white mb-md-4">Discover Amazing Places With Us</h1>
                            <a href="" class="btn btn-primary py-md-3 px-md-5 mt-2">Go to Gallery</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->


   


   
    <!-- Destination Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3" id="services">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Service</h6>
                <h1>Our web site provide</h1>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/mukkam-municipality.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userMunicipalityHome.jsp">
                            <h5 class="text-white">Municipality</h5>
                            <span>33 Wards</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/shop.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userShop.jsp">
                            <h5 class="text-white">Shops</h5>
                            <span>0 Registered Shops</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/tourist.png" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userTourist.jsp">
                            <h5 class="text-white">Tourist</h5>
                            <span>0 Registered Tourist place</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="images/hotel.jpg" alt="">
                        <a class="destination-overlay text-white text-decoration-none" href="userHotelMainPage.jsp">
                            <h5 class="text-white">Hotels</h5>
                            <span>0 Registered Hotels</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container pt-5 pb-3">
    		<div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Ads</h6>
                
            </div>
    		<div id="carouselExampleCaptions" style="width: 700px;margin: auto;" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <% 
        List<AdvertisementDTO> pro = ShopDAO.getAllAds();
        for (int i = 0; i < pro.size(); i++) {
        %>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<%=i%>" <%= i == 0 ? "class='active'" : "" %> aria-label="Slide <%=i+1%>"></button>
        <% } %>
    </div>
    
    <div class="carousel-inner">
        <% 
        for (int i = 0; i < pro.size(); i++) {
            AdvertisementDTO ads = pro.get(i);
        %>
            <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                <img src="imAds?id=<%=ads.getTid()%>" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5 style="color: #08ff46;font-size: 40px; font-weight: 700;"><%=ads.getProduct() %></h5>
                    <p style="color: white;    font-size: 30px;margin: 10px;"><%=ads.getDescription() %></p>
                    <p style="color: red; margin-top: 200px;"><%=ads.getPrice() %></p>
                   <div style="width: 500px; height: 60px; border: 1px solid white; margin: auto; background: #ffffffd4;">
                     <p style="color: Green; font-size: 30px; font-weight: bolder; margin: 5px;"> Now : <%=ads.getPrice() - ads.getDicscount() %></p>
                     </div>
                    <a href="<%=ads.getLink() %>" style="margin-top: 10px;" class="btn btn-danger">Go To check</a>
                </div>
            </div>
        <% } %>
    </div>
    
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
		</div>
    </div>
     <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Contact</h6>
                <h1>Contact For Any Query</h1>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="contact-form bg-white" style="padding: 30px;">
                        <div id="success"></div>
                        <form name="sentMessage" id="contactForm" novalidate="novalidate">
                            <div class="form-row">
                                <div class="control-group col-sm-6">
                                    <input type="text" class="form-control p-4" id="name" placeholder="Your Name"
                                        required="required" data-validation-required-message="Please enter your name" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group col-sm-6">
                                    <input type="email" class="form-control p-4" id="email" placeholder="Your Email"
                                        required="required" data-validation-required-message="Please enter your email" />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control p-4" id="subject" placeholder="Subject"
                                    required="required" data-validation-required-message="Please enter a subject" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <textarea class="form-control py-3 px-4" rows="5" id="message" placeholder="Message"
                                    required="required"
                                    data-validation-required-message="Please enter your message"></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary py-3 px-4" type="submit" id="sendMessageButton">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
    
    
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