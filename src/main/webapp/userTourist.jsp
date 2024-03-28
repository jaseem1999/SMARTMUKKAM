<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.shop.AdvertisementDTO"%>
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
if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
%>
<meta charset="ISO-8859-1">
<title>Tourist</title>
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
      background-image: url('images/parambikulam.jpg');
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
      <img src="images/kerala-tourisum-logo.png" alt="Bootstrap" width="150" height="24">
    </a>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    </ul>
    
  </div>
</nav>
<div style="height: 600px; width: 100%">
	<div class="container">
		<div class="row">
			<div class="col">
				<div style="margin-top: 30px; width: 600px; heigt: 80px; background: #0000009c; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; overflow: hidden;">
				    <h1 style="font-family: 'Arial', sans-serif; color: white; margin-top: 20px; margin-bottom: 20px; font-size: 24px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Discover the Magic of Mukkam</h1>
				</div>
				<div style="margin-top: 30px; width: 600px; heigt: 80px; background: #0000009c; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; overflow: hidden;">
				    <div style="background: white;">
				    	<img src="images/logo-en-LSGD.png" alt="Bootstrap" width="150" height="24">
				    </div>
				    <p style="font-family: 'Arial', sans-serif; color: white; margin-top: 20px; margin-bottom: 20px; font-size: 16px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
				    
				    
				    Welcome to the enchanting world of Mukkam, where every corner tells a tale of rich cultural heritage and natural splendor. Nestled within the heart of the Mukkam Municipality, our tourism website serves as your gateway to a myriad of experiences awaiting discovery. From vibrant local markets to historical landmarks, Mukkam offers a unique blend of tradition and modernity. Immerse yourself in the warm hospitality of the locals, savor the diverse culinary delights, and explore the scenic beauty that graces this region. Whether you seek tranquility in the lap of nature or the excitement of cultural festivities, Mukkam welcomes you to a journey filled with magic and charm. Let us be your guide as you uncover the treasures that make Mukkam an unforgettable destination for all who yearn for adventure and cultural exploration.
				    
				    </p>
				</div>
				
			</div>
			<div class="col">
				<div class="container pt-5 pb-3">
    		
    		<div id="carouselExampleCaptions" style="width: 450px;margin: auto;" class="carousel slide" data-bs-ride="carousel">
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
                   <div style="width: 400px; height: 50px; border: 1px solid white; margin: auto; background: #ffffffd4;">
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
			</div>
		</div>
	</div>
</div>
<div class="container" style="background: #000000ad; height: auto;">
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3" id="services">
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Book the tickets</h6>
                <h1 style="color: white;">Tourist spots</h1>
            </div>
            <div class="row">
                <%
                    List<TouristDTO> tourists = TouristDAO.getAllTouristDetails();
                    for(TouristDTO t : tourists) {
                %>
                <div class="col-lg-4 col-md-6 mb-4" style="">
                    <div class="destination-item position-relative overflow-hidden mb-2">
                        <img class="img-fluid" src="timg?id=<%= t.getTouristId() %>" style="max-height: 150px; width: 100%" alt="">
                        <% if ("accept".equals(t.getStatus())) { %>
                            <a class="destination-overlay text-white text-decoration-none" href="userTouristPages.jsp?id=<%= t.getTouristId() %>">
                                <h5 class="text-white"><%= t.getTouristPlace() %></h5>
                                <span><%= t.getAddressOne() %> </span>
                            </a>
                        <% } else if ("reject".equals(t.getStatus())) { %>
                            <a class="destination-overlay text-white text-decoration-none" href="#">
                                <h5 class="text-white"><%= t.getTouristPlace() %></h5>
                                <span>It's blocked </span>
                            </a>
                        <% } else { %>
                            <a class="destination-overlay text-white text-decoration-none" href="#">
                                <h5 class="text-white"><%= t.getTouristPlace() %></h5>
                                <span>It's under processing</span>
                            </a>
                        <% } %>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
<div class="container" style="background: #000000ad; height: auto;">
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7824.35305136936!2d75.98956738996188!3d11.321804705448093!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba641801beef9e9%3A0xb2830e78854a4e17!2sMukkam%2C%20Kerala!5e0!3m2!1sen!2sin!4v1710076627596!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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