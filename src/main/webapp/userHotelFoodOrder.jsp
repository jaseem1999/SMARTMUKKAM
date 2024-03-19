<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.FoodCartDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
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

Integer hoid = Integer.parseInt(request.getParameter("hoid"));
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
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="userHotelPages.jsp?id=<%=hoid%>"><i class="fas fa-utensils"></i> Restuarent</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="room.jsp"><i class="fa fa-bed" aria-hidden="true"></i> Room</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="taxi.jsp"><i class="fa fa-taxi" aria-hidden="true"></i> Taxi</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	
    </ul>
    
</nav>

<div style="width: 100%; height: 250px; margin-top: -57px;">
	<img src="images/restaurant.jpg" class="img-fluid" alt="Responsive image" style="width: 100%; height: 250px;">
</div>

<div class="container" style="">
	<table class="table table-striped">
  <thead>
    <tr>
    	<th scope="col">*</th>
      <th scope="col">Food Name</th>
      <th scope="col">Quandity</th>
      <th scope="col">Price</th>
      <th scope="col">Date and time</th>
      <th scope="col">Status</th>
      <th scope="col">Bill</th>
    </tr>
  </thead>
  <tbody>
  <%
  List<FoodCartDTO> foods = ServiceDAO.getAllOrederByUIDandHOIDforUser(uid, hoid);
  for(FoodCartDTO f : foods){
  %>
    <tr>
      <th scope="row"><img src="imfood?id=<%=f.getFoid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></th>
      <td><%=ServiceDAO.getFoodName(f.getFoid()) %></td>
      <td><%=ServiceDAO.getCartFoodQuandity(f.getFoid())%></td>
      <td><%=(ServiceDAO.getFoodPrice(f.getFoid())- ServiceDAO.getFoodDiscount(f.getFoid()) ) * ServiceDAO.getCartFoodQuandity(f.getFoid())%></td>
      <td><%=f.getDate() %></td>
      <td>
      <%
      	if(f.getStatus() == null){
      		out.print("<span style='color:blue'>Preparing</span>");
      	}else if(f.getStatus().equals("delivery")){
      		out.print("<span style='color:blue'>Delevery</span>");
      	}else if(f.getStatus().equals("delivered")){
      		out.print("<span style='color:green'>Delivered</span>");
      	}else if(f.getStatus().equals("reject")){
      		out.print("<span style='color:red'>Cenceled</span>");
      	}else{
      		
      	}
      %>
      </td>
      <td><a href="javascript:void(0);" onclick="printRow('<%=f.getUid()%>', '<%=f.getFoid()%>', '<%=ServiceDAO.getFoodName(f.getFoid())%>','<%=(ServiceDAO.getFoodPrice(f.getFoid())- ServiceDAO.getFoodDiscount(f.getFoid()) ) * ServiceDAO.getCartFoodQuandity(f.getFoid()) %>' ,'<%=ServiceDAO.getCartFoodQuandity(f.getFoid())%>', '<%=f.getDate()%>', '<%=f.getStatus()%>')">Print</a></td>
    </tr>
  <%} %>
  </tbody>
</table>
</div>









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
    function printRow(uid, foid, foodName, price , quantity, date, status) {
        // Open a new window for printing
        var printWindow = window.open('bill_template.jsp', '_blank');

        if(status == 'null'){
			status = 'Preparing'
        }
        // Pass bill details to the opened window
        printWindow.onload = function() {
            printWindow.document.getElementById('foodName').innerText = foodName;
            printWindow.document.getElementById('foodPrice').innerText = price;
            printWindow.document.getElementById('quantity').innerText = quantity;
            printWindow.document.getElementById('date').innerText = date;
            printWindow.document.getElementById('status').innerText = status;
        };
        
        // Close the print window after printing
        printWindow.setTimeout(function() {
            printWindow.close();
        }, 1000);
    }
</script>
</body>
</html>