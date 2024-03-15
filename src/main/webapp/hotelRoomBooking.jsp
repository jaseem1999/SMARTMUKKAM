<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.RoomDTO"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
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
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
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
                <div class="row" style="margin: auto; width: 100%; color: white; height: 150px; background: #000000c4;">
                	<div class="col" style=" margin-top: 20px;">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%= h.getHotelId() %></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= h.getOwnerName() %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= h.getEmail() %></p>
                	</div>
                	<div class="col" style=" margin-top: 20px;">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= h.getPhone() %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: Restaurant </p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= h.getStatus() %></p>
                	</div>
                	<div class="col" style=" margin-top: 20px;">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%= h.getHotelName() %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= h.getAddressOne() %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= h.getAddressTwo() %></p>
                	</div>
                	<div class="col" style=" margin-top: 20px;">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= h.getCity() %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= h.getState() %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
                <%} %>
            </nav>
        </div>
    </div>
    
   	<div class="text-center mb-3 pb-3" style=" margin-top: 30px;">
        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px; color: rgb(43 46 52) !important;">Manage Room Booking Services</h6>
       
    </div>
    
    <div class="container">
    	<div class="row">
    	
    	
		
	    	<div class="col">
	    	<div style="width: 100%; height: 30px; background: #a1cceb;">
				<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Upload Room Details</span>
			</div>
    		<%
			if(alert != null && alert.equals("addSuccess")){
	        	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Room added success</div>");
	        }
			if(alert != null && alert.equals("addFailed")){
				out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Room added Failed</div>");
	        }
			%>
	    		
	    		<form action="adRoom"  method="post" enctype="multipart/form-data" style="margin: 30px;">
				  <div class="mb-3">
				    
				    <input type="hidden" value="<%=hoid%>" class="form-control" id="hoid" name="hoid" aria-describedby="sid">
				   </div>
				  <div class="mb-3">
				    <label for="room" class="form-label">Room</label>
				    <input type="text" class="form-control" id="room" name="room" placeholder="Enter room name">
				  </div>
				    <div class="mb-3">
				    <label for="no" class="form-label">No. rooms</label>
				    <input type="number" class="form-control" id="no" name="no" placeholder="Enter number of rooms">
				  </div>
				  <div class="mb-3">
				    <label for="description" class="form-label">Description</label>
				    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
				  </div>
				  <div class="mb-3">
				    <label for="price" class="form-label">Price</label>
				    <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
				  </div>
				  <div class="mb-3">
				    <label for="discount" class="form-label">Discount</label>
				    <input type="text" class="form-control" id="discount" name="discount" placeholder="Enter discount">
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload room image</label>
				    <input type="file" class="form-control" id="image" name="image">
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
		
	    	</div>
	    	
	    	<div class="modal fade" id="descriptionModal" tabindex="-1" aria-labelledby="descriptionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="descriptionModalLabel">Room Description</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p id="modalDescription"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	    	
	    	
	    	<div class="col">
	    		<div style="width: 100%; height: 30px; background: #a1cceb;">
					<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Manage Rooms</span>
				</div>
				<div style="height: 600px; width: 100%; overflow: auto;" id="contentToRefresh">
				<table class="table table-striped">
				  <thead>
				    <tr>
				    <th scope="col">Image</th>
				      <th scope="col">Room</th>
				      <th scope="col">No. room</th>
				      <th scope="col">Description</th>
				      <th scope="col">Price</th>
				      <th scope="col">Discount</th>
				      <th scope="col">Active</th>
				      <th scope="col">Status</th>
				      <th scope="col">Menu</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				  
				  
				  <%
				  List<RoomDTO> room = ServiceDAO.getAllRoomsUSEDHoidForHotel(hoid);
				  
				  for(RoomDTO r : room){
				  %>
				    <tr>
				      <th scope="row"><img src="imRoom?id=<%=r.getTid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></th>
				      <td><%=r.getRoom() %></td>
				      <td><%=r.getNoRoom() %></td>
				      <td style="color: green;" class="description" data-description="<%= r.getDescription() %>">Click to view description</td>
				      <td><%=r.getPrice() %></td>
				      <td ><%=r.getDiscount() %></td>
				      <td><%=r.getActive() %></td>
				      <td><%
				      if(r.getStatus() == null){
			                out.print("<span  style='color : blue;'>Processing</span>");
			            } else if(r.getStatus().equals("accept")){
			                out.print("<span  style='color : green;'>Accept</span>");
			            } else if(r.getStatus().equals("reject")){
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
					                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=r.getTid()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=r.getTid() %>" type="button">Reject</a></li>
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
	    
	    <div class="row">
    	
    	<div class="col-4">
    		<ul class="list-group">
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelHome.jsp">Home</a></li>
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelFood.jsp">Manage food ordering </a></li>
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelTaxi.jsp">Manage taxi service</a></li>
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelGallery.jsp">Manage gallery </a></li>
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelReview.jsp">Manage review</a></li>
				  <li class="list-group-item"><a style="text-decoration: none; color: black;" href="hotelFeedback.jsp">feedback</a></li>
				</ul>
    	</div>
		
	    	<div class="col-8">
	    
			    <div style="height: 400px; width: 100%; overflow: auto;">
			    <div style="width: 100%; height: 30px; background: #a1cceb;">
							<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Manage Room booking</span>
					</div>
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

document.addEventListener('DOMContentLoaded', function() {
    // Add click event listener to description cells
    var descriptionCells = document.querySelectorAll('.description');
    descriptionCells.forEach(function(cell) {
      cell.addEventListener('click', function() {
        var description = this.getAttribute('data-description');
        document.getElementById('modalDescription').textContent = description; // Set description in modal
        var descriptionModal = new bootstrap.Modal(document.getElementById('descriptionModal'));
        descriptionModal.show(); // Show modal
      });
    });
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
                url: "hotelRoomAccept.jsp",
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
                url: "hotelRoomReject.jsp",
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



</script>

</body>
</html>