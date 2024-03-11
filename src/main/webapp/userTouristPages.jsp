<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.tourist.TicketDTO"%>
<%@page import="smartMukkam.com.tourist.WallpaperDTO"%>
<%@page import="smartMukkam.com.tourist.TouristWallpaperUpload"%>
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
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}

Integer toid = Integer.parseInt(request.getParameter("id"));
String alert = (String) request.getParameter("message");
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
     <%
     List<TouristDTO> tourists = TouristDAO.getAllTouristDetailsBasedToId(toid);
     for(TouristDTO t : tourists){
     %>
	<title><%=t.getTouristPlace() %></title>
	<%
	     }
	%>
	
	<style type="text/css">
	.nav-bar::before {
	    position: absolute;
	    content: "";
	    width: 100%;
	    height: 0%;
	    top: 0;
	    left: 0;
	    background: #FFFFFF;
    }
    
    .list-group-item{
 	background: transparent;
    color: #494545;
    border: 0px;
}
.product { text-align: center; }

.unlist { list-style-type: none; padding: 0; }

.list { margin-bottom: 10px; }

.mrp{ 
	color: #648bd9; 
	font-weight: bold;
 }
 

.discount 
{ 
	
	color: #999;
}
.finalprice{
	color: #fd2727;
    font-size: xx-large;
    font-weight: bolder;
}
.save { color: #008000; font-weight: bold; }

.laptop-image { display: block; margin: 0 auto; width: 100%; height: auto; }

.list-group-item{
	width: 300px;
}
	
	</style>
</head>
<body>
<nav class="navbar " style="background: black;">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
    <%
    String touristPlace = null;
    for(TouristDTO t : tourists){
   touristPlace = t.getTouristPlace();
    %>
      <img src="images/kerala-tourisum-logo.png" alt="Bootstrap" width="200" height="30">
    
    </a>
	<a style="color: white;" class="nav-link" href="">
		<%=t.getTouristPlace() %>
	</a>
	<%} %>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="userTouristTicketBooking.jsp?uid=<%=uid%>&toid=<%=toid%>">Your Tickets</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    </ul>
    
  </div>
</nav>






<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ticket Booking</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<img alt="cd" src="" id="ticketImage" style="width: 100%; height:200px; margin: 0px;">
        	
        	<form action="ticket" method="post" style="margin-top: 20px;">
        			
        		  <div class="mb-3">
				    <label for="uid" class="form-label" >User :  <img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"> <span id=""><%=UserDAO.getUserName(uid) %>  </span></label>
				    <input type="hidden" class="form-control" id="uid" name="uid" value="<%=uid %>"   aria-describedby="ticketId">
				  </div>
				  
				  <div class="mb-3">
				    <label for="toid" class="form-label" >Tourist place : <span id=""><%=touristPlace %></span></label>
				    <input type="hidden" class="form-control" id="toid" name="toid" value="<%=toid %>"   aria-describedby="ticketId">
				  </div>
				  
				  <div class="mb-3">
				    <label for="ticketId" class="form-label" >Ticket id : <span id="tidInputLabel"></span></label>
				    <input type="hidden" class="form-control" id="tidInput" name="ticketId" value=""  aria-describedby="ticketId">
				  </div>
        		
				  <div class="mb-3">
				    <label for="ticketId" class="form-label" >Ticket id : <span id="tidInputLabel"></span></label>
				    <input type="hidden" class="form-control" id="tidInput" name="ticketId" value=""  aria-describedby="ticketId">
				  </div>
				  
				  
				  <div class="mb-3">
				    <label for="ticket" class="form-label">Ticket : <span id="ticketLabel"></span></label>
				    <input type="hidden" class="form-control" id="ticket" name="ticket" value="" aria-describedby="ticket">
				  </div>
				  
				  <div class="mb-3">
				    <label for="slot" class="form-label">slot available :  <span id="slotLabel"></span></label>
				    <input type="number" class="form-control" id="" name="slot" value="1" aria-describedby="ticket" required="required">
				  </div>
				  
				  <div class="mb-3">
				    <label for="price" class="form-label">Price : <span id="priceLabel"></span> for one slot</label>
				    <input type="hidden" class="form-control" id="price" name="price" value=""  aria-describedby="ticket">
				  </div>
				 
				  <button type="submit" class="btn btn-primary">Book ticket</button>
				</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>





<div class="container-xxl position-relative nav-bar p-0" style="z-index: 100;">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5" style="width: 100%;">
            <%
    for(TouristDTO t : tourists){
    %>
	<img src="timg?id=<%=t.getTouristId() %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
	
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #01040d9c;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%=t.getTouristId()%></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= t.getName() %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= t.getEmail() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= t.getPhone() %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= t.getTouristPlace() %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= t.getStatus() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%=t.getTouristPlace() %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= t.getAddressOne()%></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= t.getAddressTwo() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= t.getCity() %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= t.getState()%></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
                <%} %>
			</nav>
		</div>



<div id="carouselExampleDark" class="carousel carousel-dark slide" style="max-height: 400px; margin-top: -150px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">

<%
  List<WallpaperDTO> wallpaper = TouristDAO.getWallpaperBasedToidforUser(toid);
  for (int i = 0; i < wallpaper.size(); i++) {
    WallpaperDTO w = wallpaper.get(i);
    // Use "active" class for the first item
    String activeClass = (i == 0) ? "active" : "";
%>
    <div class="carousel-item <%= activeClass %>" data-bs-interval="10000" style="max-height: 400px;">
      <img src="getTWallpeper?id=<%= w.getTid() %>" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block" style="">
        <p style="font-family: 'Arial', sans-serif; color: white; margin-top: 300px; margin-bottom: 20px; font-size: 24px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);"><%= w.getDescription() %></p>
      </div>
    </div>
<%
  }
%>

</div>

  
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev" style="max-height: 400px;">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next" style="max-height: 400px;">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  
 <%
if(alert != null && alert.equals("ticketFull")){
	out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Sorry slot is full</div>");
}

if(alert != null && alert.equals("ticketSuccess")){
	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Ticket booked success</div>");
}

%>
<div class="container-xxl" style="margin-top: 50px;">
<%
 List<TicketDTO> tickets = TouristDAO.getAllTicketBasedOnToidForUser(toid);
for(TicketDTO t : tickets){
%>
	<div class="row" style="background-color: #ffffff; border: 1px solid white;box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);">
		<div class="col-2">
			<img alt="cd" src="imTick?id=<%=t.getTid()%>" style="width: 200px; height:150px;margin: 30px; ">
		</div>
		 <div class="col-8">
		 	<div class="container"> 
		 	<ul class="unlist"> 
		 	<li class="list"><%=t.getTicket() %></li> 
		 	<li class="list"><%=t.getSlot() - TouristDAO.getSlotOnBooked(t.getTid()) %></li> 
		 	<li class="list"></li>  
		 	<li class="list" style="color: blue;"><a href=""><i class="fa fa-star" aria-hidden="true"></i> review</a></li>
		 	</ul> 
		 	<p class="mrp">Ticket Price : <span class="discount"><%= t.getPrice() %></span></p> 
		 	<p class="price">Available Tickets <span class="save"> <%=t.getSlot() %></span></p>
		 	 
		 </div>
			
		</div>
		<div class="col-2">
			<div class="" style="">
			<a class="btn btn-outline-primary" style="position: relative; left: 42px; top: 145px;" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setTicketDetails('<%= t.getTid() %>', '<%= t.getTicket() %>', '<%= t.getSlot() - TouristDAO.getSlotOnBooked(t.getTid()) %>', '<%= t.getPrice() %>');">Go to <i class="fa fa-cart-plus" aria-hidden="true"></i></a>



				
			</div>
		</div>
	</div>
	<hr>
		<% } %>
</div>




 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
function setTicketDetails(ticketId, ticket, slot, price) {

	document.getElementById('tidInputLabel').innerText = ticketId;
	document.getElementById('ticketLabel').innerText = ticket;
	document.getElementById('slotLabel').innerText = slot;
	document.getElementById('priceLabel').innerText = price;

	document.getElementById('ticketImage').src = 'imTick?id=' + ticketId;
	
    // Set values to the modal form fields
    document.getElementById('tidInput').value = ticketId;
    document.getElementById('ticket').value = ticket;
    document.getElementById('price').value = price;
  }

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