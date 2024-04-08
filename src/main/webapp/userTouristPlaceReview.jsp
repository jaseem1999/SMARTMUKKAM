<%@page import="smartMukkam.com.tourist.ReviewDTO"%>
<%@page import="smartMukkam.com.tourist.TicketDTO"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
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



Integer toid = Integer.parseInt(request.getParameter("toid"));
Integer ticketId = Integer.parseInt(request.getParameter("ticketId"));
String alert = (String) request.getParameter("message");
if (email == null && ticketId==0){
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
	width: 100%;
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
		
		
		<div class="container-xxl" style="margin-top: 50px;">
			<%
			 List<TicketDTO> tickets = TouristDAO.getAllTicketBasedOnToidForUserForReview(ticketId);
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
					 	<li class="list" style="color: blue;"><a href="userTouristPlaceReview.jsp?toid=<%=t.getToid()%>&ticketId=<%=t.getTid()%>"><i class="fa fa-star" aria-hidden="true"></i> review</a></li>
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
			<div class="container" style="margin-top: 30px;">
			<form action="userTouristReviewServlet.jsp" method="get" id="reviewForm" novalidate>
			    <input type="hidden" value="<%=uid %>" class="form-control" id="uid" name="uid" aria-describedby="commentHelp">
			    <input type="hidden" value="<%=toid %>" class="form-control" id="toid" name="toid" aria-describedby="commentHelp">
			    <input type="hidden" value="<%=ticketId %>" class="form-control" id="ticketId" name="ticketId" aria-describedby="commentHelp">
			    <div class="mb-3">
			        <label for="comment" class="form-label">Review</label>
			        <input type="text" class="form-control" id="comment" name="comment" aria-describedby="commentHelp" placeholder="Add review">
			        <p class="text-danger" id="commentError"></p>
			    </div>
			    <button type="submit" class="btn btn-primary">Review</button>
			</form>
			
	<ul class="list-group" style="margin-top: 20px">
	<%
	List<ReviewDTO> review = TouristDAO.getReviewBasedToid(ticketId);
	for(ReviewDTO r : review){
	%>
	  <li class="list-group-item" style="background: white;">
	  	<div class="row">
	  		<div class="col-2">
	  		<img alt="" src="userPhoto?id=<%=r.getUid()%>" style="width: 50px;height: 50px; border-radius: 50%; ">
	  		
	  		</div>
	  		<div class="col-10" style="margin-left: 40px;"><%=r.getReview() %></div>
	  	</div>
	  	<hr>
	  	<div class="row justify-content-end">
		    <div class="col-11 text-right" style="">
		        <span>
		            <% if(r.getComment() != null) {
		                out.print(r.getComment());
		            } else {
		                out.print("");
		            } %>
		        </span>
		    </div>
		    <div class="col-1">
		        <img alt="" src="timg?id=<%=r.getToid()%>" style="width: 50px;height: 50px; border-radius: 50%;">
		    </div>
		</div>
	  	
	  </li>
	  <hr>
	  <%} %>
	  
	</ul>
			
			</div>
		<!-- Template Javascript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
document.getElementById("reviewForm").addEventListener("submit", function(event) {
    var comment = document.getElementById("comment").value.trim();

    if (comment === "") {
        document.getElementById("commentError").innerText = "Please enter your review.";
        event.preventDefault(); // Prevent form submission
    } else {
        document.getElementById("commentError").innerText = "";
    }
});
</script>

</body>
</html>