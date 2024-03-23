<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.TaxiBookedDTO"%>
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
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="room.jsp?hoid=<%=hoid%>"><i class="fa fa-bed" aria-hidden="true"></i> Room</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	
    </ul>
    
</nav>
<div style="width: 100%; height: 250px; margin-top: -57px;">
	<img src="images/taxi2.jpg" class="img-fluid" alt="Responsive image" style="width: 100%; height: 250px;">
</div>


<div class="container">
	<table class="table table-striped table-hover">
  		<thead>
	   		<tr>
		      <th scope="col">*</th>
		      <th scope="col">Taxi name</th>
		      <th scope="col">Driver</th>
		      <th scope="col">No. plate</th>
		      <th scope="col">KM</th>
		      <th scope="col">Fair</th>
		      <th scope="col">Status</th>
		      <th scope="col">Print</th>
		    </tr>
		</thead>
		<tbody>
		<%
		List<TaxiBookedDTO> tx = ServiceDAO.getTaxiBookingsForUser(uid, hoid);
		for(TaxiBookedDTO t : tx){
		%>
			    <tr>
			      <th scope="row"><img src="imTaxi?id=<%=t.getTxoid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt=""></th>
			      <td><%=ServiceDAO.getTaxiName(t.getTxoid()) %></td>
			      <td><%=ServiceDAO.getTaxiDriver(t.getTxoid()) %></td>
			      <td><%=ServiceDAO.getTaxiPlate(t.getTxoid()) %></td>
			      <td><%=t.getKm() %></td>
			      <td><%=ServiceDAO.getTaxiParice(t.getTxoid()) * t.getKm() %></td>
			      <td>
			      <%
		            if(t.getStatus() == null) {
		                out.print("<span style='color:blue'>Processing</span>");
		            } else if(t.getStatus().equals("accept")) {
		                out.print("<span style='color:green'>Conformed</span>");
		            } else if(t.getStatus().equals("reject")) {
		                out.print("<span style='color:red'>Reject</span>");
		            } else {
		                // Handle other cases if needed
		            }
		        %>
			      </td>
			      <td>
			      	<a href="javascript:void(0);" onclick="printRow('<%=t.getUid()%>', '<%=ServiceDAO.getTaxiName(t.getTxoid())%>', '<%=ServiceDAO.getTaxiDriver(t.getTxoid())%>', '<%=ServiceDAO.getTaxiPlate(t.getTxoid()) %>', '<%=t.getKm()%>','<%=ServiceDAO.getTaxiParice(t.getTxoid()) * t.getKm() %>' ,'<%=t.getDate()%>', '<%=t.getStatus()%>')">Print</a>
			      </td>
			      
			    </tr>
			<%} %>    
	 	</tbody>
	</table>
	
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
   function printRow(uid, taxiName, taxiDriver, taxiPlate, km, totalPrice, date, status) {
	    // Open a new window for printing
	    var printWindow = window.open('bill_taxi.jsp', '_blank');

	    // Modify status if it's null
	    if (status === 'null') {
	        status = 'Processing';
	    }

	    // Pass taxi details to the opened window
	    printWindow.onload = function() {
	        printWindow.document.getElementById('taxiName').innerText = taxiName;
	        printWindow.document.getElementById('taxiDriver').innerText = taxiDriver;
	        printWindow.document.getElementById('taxiPlate').innerText = taxiPlate;
	        printWindow.document.getElementById('km').innerText = km;
	        printWindow.document.getElementById('totalPrice').innerText = totalPrice;
	        printWindow.document.getElementById('date').innerText = date;
	        printWindow.document.getElementById('status').innerText = status;
	    };
	    
	    // Close the print window after printing
	    printWindow.setTimeout(function() {
	        printWindow.close();
	    }, 1000); // 1000 milliseconds delay before closing the window
	}
		
   </script>

</body>
</html>