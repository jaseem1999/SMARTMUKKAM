<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.municipality.AppointmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
		 	max-width: 1000px;
		 	height: 500px;
		 	border: 1px solid;
		}
		.home{
			width: 100%;
			height: 30px;
			background: #bebcd4;;
		}
		.home span{
			margin: 5px;
		    color: #311B92;
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
			  	<a class="nav-link" href="municipality.jsp">Home</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityRegistration.jsp">Registrations</a>
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
    	<div class="homeFull" style="margin: 50px;">
    		<div class="home" style="height: 50px;">
    			<span>Appointments</span>
    			<button type="button" class="btn btn-primary" style="margin: 7px;" id="refreshButton">Refresh</button>

    		</div>
    		<div class="body_main">
    		<div id="appointmentAcceptSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			    Appointment accepted successfully
			</div>
			<!-- Add this to your HTML body -->
			<div id="appointmentRejectSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			    Appointment reject successfully
			</div>
			
			<div id="tid">
    			<table id="appointmentTable" class="table table-striped" style="margin: 10px; width: 97%;">
 					<thead>
					    <tr>
					      <th scope="col">User</th>
					      <th scope="col">Name</th>
					      <th scope="col">Email</th>
					      <th scope="col">Phone</th>
					      <th scope="col">Officer</th>
					      <th scope="col">Reason</th>
					      <th scope="col">Status</th>
					      <th scope="col"></th>
					    </tr>
					    </thead>
					    <%
					    List<AppointmentDTO> app= ServicesDTO.getAllAppointments();
					    %>
					    
					  
					  <tbody>
					  
				<%
					for(AppointmentDTO appo : app){
					     // Create a unique identifier for each row
				%>
    <tr>
        <td><img alt="" style="width: 40px; border: 1px solid; border-radius: 50%" src="userPhoto?id=<%=appo.getUid()%>"></td>
        <td><%=UserDAO.getUserName(appo.getUid())%></td>
        <td><%=UserDAO.getUserEmail(appo.getUid())%></td>
        <td><%=UserDAO.getUserPhone(appo.getUid()) %></td>
        <td><%=appo.getOfficer() %></td>
        <td><%=appo.getReason() %></td>
        <td  >
    	<div id="">
        <%
            if(appo.getStatus() == null){
                out.print("<span  style='color : blue;'>Processing</span>");
            } else if(appo.getStatus().equals("accept")){
                out.print("<span  style='color : green;'>Accept</span>");
            } else if(appo.getStatus().equals("reject")){
                out.print("<span  style='color : red;'>Reject</span>");
            }else{
            	out.print("<span  style='color : red;'></span>");
            }
        %>
   		</div>
		</td>

        <td>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Menu
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=appo.getTid()%>" type="button">Accept</a></li>
                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=appo.getTid()%>" type="button">Reject</a></li>
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
                url: "municipalityAppointmentAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment accepted successfully");

                    // Show the success message
                    $("#appointmentAcceptSuccessAlert").show().delay(3000).fadeOut();

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

        // Handle the click event on the "Reject" link
        $(".rejectLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the rejection
            $.ajax({
                type: "GET",
                url: "municipalityAppointmentReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment rejected successfully");

                    // Show the rejection success message
                    $("#appointmentRejectSuccessAlert").show().delay(3000).fadeOut();

                    // Reload the content within the div with id "contentToRefresh" after rejection
                    window.refreshContent();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error rejecting appointment: " + error);

                    // You can show an error message if needed
                }
            });
        });
    }
});
   

    
</script>




</body>
</html>