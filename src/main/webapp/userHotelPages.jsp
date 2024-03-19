<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.FoodDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta charset="ISO-8859-1">
<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

Integer hoid = Integer.parseInt(request.getParameter("id"));
String alert = (String) request.getParameter("message");
if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
%>
<meta charset="ISO-8859-1">
<title><%=HotelDAO.getHotelName(hoid) %></title>
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
</head>
<body>
<nav class="navbar " style="background: #0c0b0b99;">
  
    <a class="navbar-brand" href="#">
      <img src="himg?id=<%=hoid %>" alt="Bootstrap" width="40" height="30">
    </a>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="room.jsp"><i class="fa fa-bed" aria-hidden="true"></i> Room</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="taxi.jsp"><i class="fa fa-taxi" aria-hidden="true"></i> Taxi</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	
    </ul>
    
</nav>

<div style="width: 100%; height: 150px; margin-top: -57px;">
	<img src="images/restaurant.jpg" class="img-fluid" alt="Responsive image" style="width: 100%; height: 250px;">
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Food Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div style="width: 100%; height: 150px;">
                    <img id="foodImage" class="img-fluid" alt="Responsive image" style="width: 100%; height: 250px;">
                </div>
                <ul class="list-group">
                    <li class="list-group-item" id="foodName"></li>
                    <li class="list-group-item" id="foodDescription"></li>
                    <li class="list-group-item" id="foodQuantity">Quantity : </li>
                    <li class="list-group-item" id="foodPrice">Price : </li>
                    <li class="list-group-item" id="foodDiscount">Discount : </li>
                    <li class="list-group-item" id="foodFinalPrice">Final Price : </li>
                </ul>
				<form action="addFoodCart.jsp" method="post" id="form-1">
					<input type="hidden" id="uid" name="uid" value="<%=uid%>">
					<input type="hidden" id="hoid" name="hoid" value="<%=hoid%>">
					<input type="hidden" id="foid" name="foid" value="">
					<div class="mb-3">
					    <label for="exampleInput" class="form-label">Enter quantity</label>
					    <input type="number" class="form-control" id="quantity" name="quantity" value="1">
					</div>
					<button type="submit" class="btn btn-primary">Order</button>
				</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<div class="container" style="height: auto; margin-top: 50px;">

<div class="container-fluid py-5">
        <div class="container pt-5 pb-3" id="services">
        	<a href="userHotelFoodOrder.jsp?hoid=<%=hoid%>" type="button" class="btn btn-outline-primary"><i class="fas fa-utensils"></i> Orders</a>
            <div class="text-center mb-3 pb-3">
                <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Restuarent Services</h6>
            </div>
            <div class="row">
	<%
if(alert != null && alert.equals("quantityFull")){
	out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Sorry not available</div>");
}

if(alert != null && alert.equals("foodCartSuccess")){
	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Food order successfully</div>");
}
%>
								<%
					    List<FoodDTO> foods = ServiceDAO.getAllFoodUSEDHoidForUser(hoid);
					    for(FoodDTO f : foods){
					%>
					    <div class="col-lg-4 col-md-6 mb-4" style="">
					        <div class="destination-item position-relative overflow-hidden mb-2">
					            <img class="img-fluid" src="imfood?id=<%=f.getTid()%>" style="max-height: 150px; width: 100%" alt="">
					            <a class="destination-overlay text-white text-decoration-none open-modal" 
					               data-tid="<%=f.getTid()%>" 
					               data-description="<%=f.getDescription()%>" 
					               data-quandity="<%=f.getQuandity() - ServiceDAO.getCartFoodQuandity(f.getTid())%>" 
					               data-price="<%=f.getPrice()%>" 
					               data-discount="<%=f.getDiscount()%>" 
					               data-active="<%=f.getActive()%>" 
					               href="#" data-toggle="modal" data-target="#exampleModal">
					                <h5 class="text-white"><%=f.getFood() %></h5>
					                <span>Click to see details</span>
					            </a>
					        </div>
					    </div>
					<% } %>

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
   
<script>

$(document).ready(function() {
    // Function to populate modal fields with food details
    $('.open-modal').click(function() {
        var tid = $(this).data('tid'); // Get tid from data-tid attribute
        var description = $(this).data('description'); // Get description from data-description attribute
        var quantity = $(this).data('quandity'); // Get quantity from data-quandity attribute
        var price = $(this).data('price'); // Get price from data-price attribute
        var discount = $(this).data('discount'); // Get discount from data-discount attribute
        var active = $(this).data('active'); // Get active from data-active attribute
        
        // Populate modal fields with food details
        $('#exampleModalLabel').text('Food Details');
        $('#foodImage').attr('src', 'imfood?id=' + tid);
        $('#foodName').text('Name: ' + $(this).find('h5').text());
        $('#foodDescription').text('Description: ' + description);
        $('#foodQuantity').text('Quantity: ' + quantity);
        $('#foodPrice').text('Price: ' + price);
        $('#foodDiscount').text('Discount: ' + discount);
        $('#foodFinalPrice').text('Final Price: ' + (price - discount));
        $('#foid').val(tid);
    });
});


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