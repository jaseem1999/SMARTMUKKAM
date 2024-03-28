<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.hotel.TaxiBookedDTO"%>
<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.TaxiDTO"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Integer hoid = (Integer) session.getAttribute("hoid");
String owner = (String) session.getAttribute("owner");
String hotel = (String) session.getAttribute("hotel");
String hotelEmail = (String) session.getAttribute("hotelEmail");

if(hotelEmail == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");

%>
<title><%=hotel %></title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

  <!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
		.description {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        max-width: 250px; /* Adjust max-width as needed */
        cursor: pointer; /* Change cursor to pointer to indicate it's clickable */
    }
    
	</style>
	
</head>
<body>
<nav class="navbar  border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="images/logo-en-LSGD.png" alt="Logo" width="150" height="30" class="d-inline-block align-text-top">
    </a>
  
  <ul class="nav justify-content-end">
  			<li class="nav-item">
		       <img alt="" src="images/keralaLogo.png" class="profile-image">
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
		    <a class="nav-link active" aria-current="page" href="hotelHome.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="hotelLogout.jsp?hoid=<%=hoid%>">Logout</a>
		  </li>	 
		  
	</ul>
	
</div>
</nav>

<div style="width: 100%; height: 150px;">
<img src="images/restaurant.jpg" class="img-fluid" alt="Responsive image" style="width: 100%; height: 150px;">
</div>
<div class="container-fluid position-relative nav-bar p-0" style="margin-top: -75px;">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            <%
	        List<HotelDTO> hotels = HotelDAO.getAllHotelDetailsForLogin(hotelEmail);
	        
	        for(HotelDTO h : hotels){
        %>
            	<img src="himg?id=<%=h.getHotelId()%>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
                <div class="row" style="margin: auto; width: 100%; color: white; height: 150px; background: #000000c4; border-radius: 16px;">
                	<ul class="col list-group" style="margin-top: 15px;">
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelRoomBooking.jsp"><i class="fa fa-bed" aria-hidden="true"></i> Manage rooms booking services</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelFood.jsp"><i class="fas fa-utensils"></i> Manage food ordering</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
					</ul>
					<ul class="col list-group" style="margin-top: 15px;">
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelGallery.jsp"><i class="fas fa-images"></i> Manage gallery</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelReview.jsp"><i class="fab fa-telegram" aria-hidden="true"></i> Manage review</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelFeedback.jsp"><i class="fa fa-comments" aria-hidden="true"></i> feedback</a></li>
					</ul>
                	
                	
                </div>
                <%} %>
            </nav>
        </div>
    </div>
    
   	<div class="text-center mb-3 pb-3" style=" margin-top: 30px;">
        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px; color: rgb(43 46 52) !important;">Manage Taxi Services</h6>
       
    </div>
	<div class="container">
    	<div class="row">
    		<div class="col">
	    	<div style="width: 100%; height: 30px; background: #a1cceb;">
				<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Upload Taxi Details</span>
			</div>
    		<%
			if(alert != null && alert.equals("addSuccess")){
	        	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Food added success</div>");
	        }
			if(alert != null && alert.equals("addFailed")){
				out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Food added Failed</div>");
	        }
			%>
	    		
	    		<form action="adTaxi"  method="post" enctype="multipart/form-data" style="margin: 30px;">
				  <div class="mb-3">
				    
				    <input type="hidden" value="<%=hoid%>" class="form-control" id="hoid" name="hoid" aria-describedby="sid">
				   </div>
				  <div class="mb-3">
				    <label for="taxi" class="form-label">Driver name</label>
				    <input type="text" class="form-control" id="taxi" name="taxi" placeholder="Enter taxi driver name">
				  </div>
				  
				  <div class="mb-3">
				    <label for="vehicle" class="form-label">Vehicle name</label>
				    <input type="text" class="form-control" id="vehicle" name="vehicle" placeholder="Enter vehicle">
				  </div>
				  <div class="mb-3">
				    <label for="plate" class="form-label">No. Plate</label>
				    <input type="text" class="form-control" id="plate" name="plate" placeholder="Enter plate">
				  </div>
				  <div class="mb-3">
				    <label for="price" class="form-label">Price per KM</label>
				    <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload Vehicle image</label>
				    <input type="file" class="form-control" id="image" name="image">
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
		
	    	</div>
	    	
	    	
	    	<div class="col">
	    		<div style="width: 100%; height: 30px; background: #a1cceb;">
					<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Manage Taxi Services</span>
				</div>
				<div style="height: 600px; width: 100%; overflow: auto;" id="contentToRefresh">
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">Image</th>
				      <th scope="col">Vehicle</th>
				      <th scope="col">Driver</th>
				      <th scope="col">No.Plate</th>
				      <th scope="col">Price per km</th>
				      <th scope="col">Active</th>
				      <th scope="col">Status</th>
				      <th scope="col">Menu</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  List<TaxiDTO> taxi = ServiceDAO.getAllTaxiForHotel(hoid);
				  for(TaxiDTO t : taxi){
				  %>
				    <tr>
				    	<th scope="row"><img src="imTaxi?id=<%=t.getTid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></th>
				    	<td><%=t.getVehicle() %></td>
				    	<td><%=t.getDriver() %></td>
				    	<td><%=t.getPlate() %></td>
				    	<td><%=t.getPrice() %></td>
				    	<td><%=t.getActive() %></td>
				    	<td><%
				      	if(t.getStatus() == null){
			                out.print("<span  style='color : blue;'>Processing</span>");
			            } else if(t.getStatus().equals("accept")){
			                out.print("<span  style='color : green;'>Accept</span>");
			            } else if(t.getStatus().equals("reject")){
			                out.print("<span  style='color : red;'>Reject</span>");
			            }else{
			            	out.print("<span  style='color : red;'></span>");
			            }
				      
				      %></td>
				      
				      <td>
				      <div class="dropdown">
					                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					                    Menu
					                </button>
					                <ul class="dropdown-menu">
					                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=t.getTid()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=t.getTid() %>" type="button">Reject</a></li>
					                </ul>
		           		</div>
				      </td>
				 	</tr>
				  <% }%>
				  </tbody>
				</table>
				</div>
    	
    	
    	</div>
    </div>
    
    <div style="height: 400px; width: 100%; overflow: auto;">
			    <div style="width: 100%; height: 30px; background: #a1cceb;">
							<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Manage Taxi services</span>
					</div>
				<div style="height: 600px; width: 100%; overflow: auto;" id="contentToRefreshTwo">
				<table class="table table-striped">
				  <thead>
				    <tr>
				      <th scope="col">*</th>
				      <th scope="col">Vehicle</th>
				      <th scope="col">Driver</th>
				      <th scope="col">No.Plate</th>
				      <th scope="col">K.M</th>
				      <th scope="col">Date</th>
				      <th scope="col">Total Fair</th>
				      <th scope="col">*</th>
				      <th scope="col">Name</th>
				      <th scope="col">Address One</th>
				      <th scope="col">Address Two</th>
				      <th scope="col">City</th>
				      <th scope="col">State</th>
				      <th scope="col">PIN</th>
				       <th scope="col">Date</th>
				      <th scope="col">Status</th>
				      <th scope="col">Menu</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  List<TaxiBookedDTO> taxiBooking = ServiceDAO.getTaxiBookingsForHotel(hoid);
				  for(TaxiBookedDTO t : taxiBooking){
				  %>
				  	<tr>
				  		<td><img src="imTaxi?id=<%=t.getTxoid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></td>
				  		<td><%=ServiceDAO.getTaxiName(t.getTxoid()) %></td>
				  		<td><%=ServiceDAO.getTaxiDriver(t.getTxoid()) %></td>
				  		<td><%=ServiceDAO.getTaxiPlate(t.getTxoid()) %></td>
				  		<td><%=t.getKm() %></td>
				  		<td><%=t.getDate() %></td>
				  		<td><%=ServiceDAO.getTaxiParice(t.getTxoid()) * t.getKm() %></td>
				  		<td><img src="userPhoto?id=<%=t.getUid()%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></td>
				  		<td><%=UserDAO.getUserName(t.getUid()) %></td>
				  		<td><%=UserDAO.getUserAddressOne(t.getUid()) %></td>
				  		<td><%=UserDAO.getUserAddressTWO(t.getUid()) %></td>
				  		<td><%=UserDAO.getUserCity(t.getUid()) %></td>
				  		<td><%=UserDAO.getUserState(t.getUid()) %></td>
				  		<td><%=UserDAO.getUserPIN(t.getUid()) %></td>
				  		<td><%=t.getDate() %></td>
				  		<td>
				  		<%
				  		if(t.getStatus() == null){
			                out.print("<span  style='color : blue;'>Processing</span>");
			            } else if(t.getStatus().equals("accept")){
			                out.print("<span  style='color : green;'>Accept</span>");
			            } else if(t.getStatus().equals("reject")){
			                out.print("<span  style='color : red;'>Reject</span>");
			            }else{
			            	out.print("<span  style='color : red;'></span>");
			            }
				  		%>
				  		</td>
				  		<td>
				  		<div class="dropdown">
					                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					                    Menu
					                </button>
					                <ul class="dropdown-menu">
					                    <li><a href="#" class="dropdown-item acceptLinkBooking" data-tid="<%=t.getTid()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLinkBooking" data-tid="<%=t.getTid() %>" type="button">Reject</a></li>
					                </ul>
		           		</div>
				  		</td>
				  	</tr>
				  	<%} %>
				  </tbody>
				  </table>
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
   
<!-- Include jQuery library -->
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




$(document).ready(function() {
    // Function to refresh the content of the specified element
    window.refreshContent = function() {
        $('#contentToRefresh').load(location.href + ' #contentToRefresh', function() {
            // Rebind event handlers after content refresh
            bindEventHandlers();
        });
    }

    // Click event to trigger the content refresh when the button is clicked
 

    // Initial binding of event handlers
    bindEventHandlers();

    // Function to bind event handlers
    function bindEventHandlers() {
        // Handle the click event on the "Accept" link
        $(".acceptLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "hotelTaxiAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment accepted successfully");

                    // Show the success message
                    

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting appointment: " + error);

                    // You can show an error message if needed
                }
            });
        });

        $(".rejectLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "hotelTaxiReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment accepted successfully");

                    // Show the success message
                    

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting appointment: " + error);

                    // You can show an error message if needed
                }
            });
        });
        

    }
});



$(document).ready(function() {
    // Function to refresh the content of the specified element
    window.refreshContentTwo = function() {
        $('#contentToRefreshTwo').load(location.href + ' #contentToRefreshTwo', function() {
            // Rebind event handlers after content refresh
            bindEventHandlersTwo();
        });
    }

    // Click event to trigger the content refresh when the button is clicked
 

    // Initial binding of event handlers
    bindEventHandlersTwo();

    // Function to bind event handlers
    function bindEventHandlersTwo() {
        // Handle the click event on the "Accept" link
        $(".acceptLinkBooking").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "hotelTaxiBookingAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment accepted successfully");

                    // Show the success message
                    

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContentTwo();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting appointment: " + error);

                    // You can show an error message if needed
                }
            });
        });

        $(".rejectLinkBooking").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "hotelTaxiBookingReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment accepted successfully");

                    // Show the success message
                    

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContentTwo();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting appointment: " + error);

                    // You can show an error message if needed
                }
            });
        });
        

    }
});






</script>


</body>
</html>