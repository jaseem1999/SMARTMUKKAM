<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@page import="smartMukkam.com.shop.ShopDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>municipality</title>
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
	
	<style>
		.nav-link{
			color: black;
			display: inline-block;
		}
		.nav-link:hover {
			color: blue;
		}
	   	.profile-image {
		  width: 40px;
		  border-radius: 50%;
		}
		
		.tooltip {
		  visibility: hidden;
		  background-color: #333;
		  color: #fff;
		  text-align: center;
		  padding: 5px;
		  border-radius: 5px;
		  position: absolute;
		  z-index: 1;
		  opacity: 0;
		  transition: opacity 0.3s;
		}
		
		.nav-item:hover .tooltip {
		  visibility: visible;
		  opacity: 1;
		}
		.availability-status.online {
		    background: #1bcfb4;
		    position: absolute;
		    width: 10px;
		    height: 10px;
		    border-radius: 57%;
		    border: 2px solid #ffffff;
		    margin-left: -10px;
    		margin-top: 29px;
		}
		.homeFull{
		 	max-width: 1370px;
		 	height: 600px;
		 	border: 1px solid;
		}
		.home{
			width: 100%;
			height: 30px;
			background: #bebcd4;;
		}
		.home1{
			width: 100%;
			height: 30px;
			background: #6a61c6;
		}
		.home span{
			margin: 5px;
		    color: #311B92;
		    font-size: medium;
		    font-weight: 600;
		}
		.home1 span{
			margin: 5px;
		    color: white;
		    font-size: medium;
		    font-weight: 600;
		}
		
	</style>
	
</head>
<body>
<%
Integer uid = (Integer) session.getAttribute("mid");

String email = (String) session.getAttribute("muncipalityEmail");

if(email == null){
	response.sendRedirect("municipalityLogin.jsp?message=unautherizedAccess");
}

%>

<nav class="navbar bg-body-tertiary" style="height: 80px; background: #84818317;">
  <div class="container">
    <a class="navbar-brand" href="municipality.jsp" >
      <img src="images/png-transparent-government-of-india-logo-gold.png" style="width: 50px;" >
      <img src="images/kerala-govt-logo.png" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
     </a>
      <ul class="nav justify-content-end">
      	   <li class="nav-item">
		      <img alt="" src="images/jaseem.jpg" class="profile-image">
		      <span class="tooltip">Admin online</span>
		      <span class="availability-status online"></span>
		    </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="municipality.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="municipalityLogout.jsp">Logout</a>
		  </li>
		  
		  
		  
		</ul>
   
  </div>
</nav>
<div class="container-fluid" id="contentToRefresh">
<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityAppointment.jsp">Appointments</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipality.jsp">Home</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityNotification.jsp">Notifications</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityProfile.jsp">Profile</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityProject.jsp">Projects</a>
			  	</li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityComplaint.jsp">Complaints</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityGallery.jsp">Gallery</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityRequest.jsp">Request</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityFeedback.jsp">Feedback</a>
			  </li>
			</ul>
			    	
    </div>
    <div class="col-sm-10">
    	<div class="homeFull" style="margin: 0px;">
    		<div class="home">
    			<span>Registration</span>
    		</div>
    		<div class="home1" style="">
    			<span>Shop Registration approval portal </span>
    		</div>
    		<div id="registrationRejectSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			    Shop registration accepted successfully
			</div>
			<!-- Add this to your HTML body -->
			<div id="registrationRejectSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			    Shop registration reject successfully
			</div>
    		<div style="overflow:auto; height: 250px;">
    			<table id="appointmentTable" class="table table-striped" style="margin: 20px; width: 97%;">
 					<thead>
					    <tr>
					      <th scope="col">Shop</th>
					      <th scope="col">Owner</th>
					      <th scope="col">Email</th>
					      <th scope="col">Phone</th>
					      <th scope="col">Shop name</th>
					      <th scope="col">Shop type</th>
					      <th scope="col">License</th>
					      <th scope="col">Address1</th>
					      <th scope="col">Address2</th>
					      <th scope="col">City</th>
					      <th scope="col">State</th>
					      <th scope="col">Status</th>
					      <th scope="col">Menu</th>
					    </tr>
					    </thead>
					    <tbody>
					    <% 
					    List<ShopDTO> shops = ServicesDTO.getAllShopDetails();
					    for(ShopDTO shop : shops){
					    %>
					    	<tr>
					    		<td><img src="shopImage?id=<%=shop.getSid()%>" style="width: 40px; border: 1px solid; border-radius: 5px;" alt="" ></td>
					    		<td><%=shop.getName() %></td>
					    		<td><%=shop.getEmail() %></td>
					    		<td><%=shop.getPhone() %></td>
					    		<td><%=shop.getShopName() %></td>
					    		<td><%=shop.getShopType() %></td>
					    		<td><a href="shopLicenseServlet.jsp?sid=<%=shop.getSid()%>" class=" badge-primary">view</a></td>
					    		<td><%=shop.getAddressOne() %></td>
					    		<td><%=shop.getAddressTwo() %></td>
					    		<td><%=shop.getCity() %></td>
					    		<td><%=shop.getState() %></td>
					    		<td><%
					    		 	if(shop.getStatus() == null){
						                out.print("<span  style='color : blue;'>Processing</span>");
						            } else if(shop.getStatus().equals("accept")){
						                out.print("<span  style='color : green;'>Accept</span>");
						            } else if(shop.getStatus().equals("reject")){
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
					                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=shop.getSid()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=shop.getSid() %>" type="button">Reject</a></li>
					                </ul>
		           					 </div>
					    		</td>
					    	</tr>
					    <%} %>
					    </tbody>
					  </table>
					 </div>
			<div class="home1" style="">
    			<span>Tourist place Registration approval portal </span>
    		</div>
    		<div style="overflow:auto; height: 250px;">
    		<table id="Table" class="table table-striped" style="margin: 20px; width: 97%;">
 					<thead >
					    <tr>
					      <th scope="col">Tourist</th>
					      <th scope="col">Owner</th>
					      <th scope="col">Email</th>
					      <th scope="col">Phone</th>
					      <th scope="col">Tourist place name</th>
					      <th scope="col">License</th>
					      <th scope="col">Address1</th>
					      <th scope="col">Address2</th>
					      <th scope="col">City</th>
					      <th scope="col">State</th>
					      <th scope="col">Status</th>
					      <th scope="col">Menu</th>
					    </tr>
					 </thead>
					 <tbody >
					 <%
					 List<TouristDTO> tourist = TouristDAO.getAllTouristDetails();
					 
					 for(TouristDTO t : tourist){
					 %>
					 <tr>
					 	<td><img src="timg?id=<%=t.getTouristId()%>" style="width: 40px; border: 1px solid; border-radius: 5px;" alt="" ></td>
					 	<td><%=t.getName() %></td>
					 	<td><%=t.getEmail() %></td>
					 	<td><%=t.getPhone() %></td>
					 	<td><%=t.getTouristPlace() %></td>
					 	<td><a href="touristLicenseServlet.jsp?id=<%=t.getTouristId()%>" class=" badge-primary">view</a></td>
					 	<td><%=t.getAddressOne() %></td>
					 	<td><%=t.getAddressTwo() %></td>
					 	<td><%=t.getCity() %></td>
					 	<td><%=t.getState() %></td>
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
					                    <li><a href="#" class="dropdown-item acceptLinkTourist" data-tid="<%=t.getTouristId()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLinkTourist" data-tid="<%=t.getTouristId() %>" type="button">Reject</a></li>
					                </ul>
		           					 </div>
					    		</td>
					    
					 	
					 </tr>
					 <%}%>
					 
				    </tbody>
				</table>
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
   
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
   





$(document).ready(function() {
    // Function to refresh the content of the specified element
    window.refreshContent = function() {
        $('#contentToRefresh').load(location.href + ' #contentToRefresh', function() {
            // Rebind event handlers after content refresh
            bindEventHandlers();
        });
    }

    // Click event to trigger the content refresh when the button is clicked
    $('#refreshButton').on('click', function() {
        window.refreshContent();
    });

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
                url: "municipalityShopRegistrationAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration accepted successfully");

                    // Show the success message
                    $("#registrationAcceptSuccessAlert").show().delay(3000).fadeOut();

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });

        // Handle the click event on the "Reject" link
        $(".rejectLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the rejection
            $.ajax({
                type: "GET",
                url: "municipalityShopRegistrationReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration rejected successfully");

                    // Show the rejection success message
                    $("#registrationRejectSuccessAlert").show().delay(3000).fadeOut();

                    // Reload the content within the div with id "contentToRefresh" after rejection
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error rejecting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });

        $(".acceptLinkTourist").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "municipalityTouristRegistrationAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration accepted successfully");

                 

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });
        $(".rejectLinkTourist").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "municipalityTouristRegistrationReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration accepted successfully");

                 

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });
        
    }
});
   

    
</script>
   
   
   
</body>
</html>