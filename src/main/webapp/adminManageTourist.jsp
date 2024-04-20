<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristChangeDTO"%>
<%@page import="smartMukkam.com.tourist.TicketDTO"%>
<%@page import="smartMukkam.com.admin.ServicesDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.admin.AdminDAO"%>
<%@page import="smartMukkam.com.admin.AdminDetailsDTO"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
Integer adminId = (Integer) session.getAttribute("adminId");
String active = (String) session.getAttribute("adminActive");
String email = (String) session.getAttribute("adminEmail");
String status = (String) session.getAttribute("adminStatus");

if(email == null){
	response.sendRedirect("AdminLogin.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");

%>
<meta charset="ISO-8859-1">
<link href="fontawesome-free-6.5.1-web/css/fontawesome.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/brands.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/solid.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
<title>Administration of Smart Mukkam</title>
<style type="text/css">
		.home{
			width: 100%;
			height: 20px;
			background: #bebcd4;;
		}
		.home span{
			margin: 5px;
		    color: #311B92;
		    font-size: medium;
		    font-weight: 600;
		}
		.profile-image {
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 23%;
		}
		.userProfile{
		      margin-top: 8px;
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
		.nav-item{
			margin-left: 30px;
		}
		.fa-solid{
			color: #bba8bff5;
		}
		
		

</style>
</head>
<body>




<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Manage Function</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  		 <ul class="nav">
            <li class="nav-item nav-profile" style="width: 100%;">
              <div class="row" style="width: 100%;">
              <a href="adminSettings.jsp" class="nav-link">
                <div class="col nav-profile-image">
                  <img src="adminProView?id=<%=adminId%>" style="height: 50px; width: 50px; border-radius: 50%;" alt="profile">
                  <span class="login-status online"></span>
                  <!--change to offline or busy as needed-->
                </div>
               
                <div class="col nav-profile-text d-flex flex-column">
                 <%AdminDetailsDTO admin = AdminDAO.getAdminDetails(adminId); %>
                  <span class="font-weight-bold mb-2"><%=admin.getName() %></span>
                  <span class="text-secondary text-small"><%=admin.getStaff() %></span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                </a>
           	</div>
            </li>
            </ul>
  
	   	<ul class="list-group list-group-flush">
		    <li class="list-group-item" >
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageUser.jsp">
		            Manage User
		            <span><i class="fa-solid fa-user"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item" >
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageHotel.jsp">
		            Manage Hotels
		            <span><i class="fa-solid fa-hotel" ></i></span>
		        </a>
		    </li>
		    <li class="list-group-item" style="color: #b66dff; background: #140f0f17;">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageTourist.jsp">
		            Manage Tourist Place
		            <span><i class="fa-solid fa-mountain-sun" style="color: #b66dff;"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageShop.jsp">
		            Manage Shops
		            <span><i class="fa-solid fa-shop"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageMunicipality.jsp">
		            Manage Municipality
		            <span><i class="fa-solid fa-building-ngo"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminUserReview.jsp">
		            View Feedback User
		            <span><i class="fa-solid fa-user"></i> <i class="fa-solid fa-comments"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminHotelReview.jsp">
		            View Feedback Hotel
		            <span><i class="fa-solid fa-hotel"></i> <i class="fa-solid fa-comments"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminTouristReview.jsp">
		            View Feedback Tourist
		            <span><i class="fa-solid fa-mountain-sun"></i> <i class="fa-solid fa-comments"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminShopReview.jsp">
		            View Feedback Shop
		            <span><i class="fa-solid fa-shop"></i> <i class="fa-solid fa-comments"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminMunicipaltyReview.jsp">
		            View Feedback Municipality
		            <span><i class="fa-solid fa-building-ngo"></i> <i class="fa-solid fa-comments"></i></span>
		        </a>
		    </li>
		    
	</ul>
   	
  </div>
</div>


<nav class="navbar   border-body" style="">
  <div class="container-fluid">
  <ul class="nav justify-content-start">
  	<li class="nav-item">
  	<a data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
	  <i class="fa-solid fa-bars"></i>
	</a>
	</li>
	<li class="nav-item">
      <img src="images/logo-en-LSGD.png" alt="Logo" width="150" height="24" class="d-inline-block align-text-top">
      <span style="margin-left: 10px;"></span>
    </li>
  </ul>
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
		    <a class="nav-link active" aria-current="page" href="adminHome.jsp"><i style="color: #b66dff;" class="fa-regular fa-house"></i></a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="adminLogout.jsp"><i style="color: red;" class="fa-solid fa-power-off"></i></a>
		  </li>	
		  
	</ul>
	
</div>
</nav>

			
			
			
			<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>It's Admin for manage Tourist Place</p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
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
				     From Mukkam <cite title="Source Title">Municipality</cite>
				  </figcaption>
				</figure>
		</div>
		<div class="container-sm">
			Inactive <i class="fa-solid fa-mountain-sun" style="color: red;"></i> Active <i class="fa-solid fa-mountain-sun" style="color: green;"></i> Processing <i class="fa-solid fa-mountain-sun" style="color: blue;"></i>
			<div style="height: 400px; width: auto; overflow: auto;" id="contentToRefresh">
		

				<table class="table table-striped table-hover">
			    <thead>
			        <tr >
			            <th scope="col" ><i class="fa-solid fa-mountain-sun" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-user" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-envelope" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-lock" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-phone-volume" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-mountain-sun" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-file" style="color: black;"></i></th>
			            <th scope="col">First <i class="fa-solid fa-address-book" style="color: black;"></i></th>
			            <th scope="col">Second <i class="fa-solid fa-address-book" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-city" style="color: black;"></i></th>
			            <th scope="col">State </th>
			            <th scope="col">PIN. no</th>
			            <th scope="col"><i class="fa-solid fa-mountain-sun" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bars" style="color: black;"></i></th>
			        </tr>
			    </thead>
			    <%
					 List<TouristDTO> tourist = ServicesDAO.getAllTouristDetails();
					 
					 for(TouristDTO t : tourist){
					 %>
					 <tr>
					 	
					 	<td><img src="timg?id=<%=t.getTouristId()%>" style="width: 40px; border: 1px solid; border-radius: 5px;" alt="" ></td>
					 	<td><%=t.getName() %></td>
					 	<td><%=t.getEmail() %></td>
					 	<td><%=t.getPass() %></td>
					 	<td><%=t.getPhone() %></td>
					 	<td><%=t.getTouristPlace() %></td>
					 	<td><a href="touristLicenseAdminServlet.jsp?id=<%=t.getTouristId()%>" class=" badge-primary">view</a></td>
					 	<td><%=t.getAddressOne() %></td>
					 	<td><%=t.getAddressTwo() %></td>
					 	<td><%=t.getCity() %></td>
					 	
					 	<td><%=t.getState() %></td>
					 	<td><%=t.getPin() %></td>
					 	<td>
					 	<%
				    		 	if(t.getActive() == null){
				    		 		out.print("<i class='fa-solid fa-mountain-sun' style='color: blue;'></i>");
					            } else if(t.getActive().equals("active")){
					                out.print("<i class='fa-solid fa-mountain-sun' style='color: green;'></i>");
					            } else if(t.getActive().equals("inactive")){
					            	out.print("<i class='fa-solid fa-mountain-sun' style='color: red;'></i>");
					            }else{
					            	out.print("<span  style='color : red;'></span>");
					            }
				    %>
					 	</td>
					    	<td>
					    			<div class="dropdown">
					                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
					                 style="background:<%
				                	if(t.getStatus() == null){
				                		out.print("blue");
				                	}else if(t.getStatus().equals("accept")){
				                		out.print("green");
				                	}
				                	else if(t.getStatus().equals("reject")){
				                		out.print("red");
				                	}else{
				                		
				                	}
				                %>;" 
					                >
					                    <i class="fa-solid fa-bars" style="color: black;"></i>
					                </button>
					                <ul class="dropdown-menu">
					                    <li><a href="#" class="dropdown-item unblockLinkTourist" data-tid="<%=t.getTouristId()%>" type="button">Unblock</a></li>
					                    <li><a href="#" class="dropdown-item blockLinkTourist" data-tid="<%=t.getTouristId() %>" type="button">Block</a></li>
					                </ul>
		           					 </div>
					    		</td>
					    
					 	
					 </tr>
					 <%}%>
			    <tbody>
			    </tbody>
				</table>
			</div>
		</div>
		
		
		<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>Forget Password request</p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
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
				     From Mukkam <cite title="Source Title">Municipality</cite>
				  </figcaption>
				</figure>
		</div>
		
		
		<div class="container-sm">
			
			<div style="height: 400px; width: auto;  overflow: auto;" id="contentToRefreshTwo">
		
				Reject <i class="fa-solid fa-bars" style="color: red;"></i> Accept <i class="fa-solid fa-bars" style="color: green;"></i> Proccessing <i class="fa-solid fa-bars" style="color: blue;"></i>
				<table class="table table-striped table-hover">
			    <thead>
			        <tr>
			            <th scope="col" ><i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col" >Name <i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-envelope" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-lock" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bars" style="color: black;"></i></th>
			        </tr>
			    <tbody>
					<%
					List<TouristChangeDTO> ChangePass = ServicesDAO.getTouristRequestChangePass();
					for(TouristChangeDTO pass : ChangePass){
					%>
					<tr>
						<td><img src="timg?id=<%=pass.getToid()%>" style="width: 40px; border: 1px solid; border-radius: 5px;" alt="" ></td>
					    <td><%=TouristDAO.getNameByTourist(pass.getToid()) %></td>
					    <td><%=pass.getEmail() %></td>
					    <td><%=pass.getPass() %></td>
					    <td>
					    			<div class="dropdown">
					                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
					                style="background:<%
				                	if(pass.getStatus() == null){
				                		out.print("blue");
				                	}else if(pass.getStatus().equals("accept")){
				                		out.print("green");
				                	}
				                	else if(pass.getStatus().equals("reject")){
				                		out.print("red");
				                	}else{
				                		
				                	}
				                %>;"
					              >
					                    <i class="fa-solid fa-bars" style="color: black;"></i>
					                </button>
					                <ul class="dropdown-menu">
					                    <li><div href="#" class="dropdown-item" onclick="sendEmail('<%= pass.getEmail() %>','<%= pass.getPass()%>','<%=TouristDAO.getNameByTourist(pass.getToid())%>')">Send email</div></li>
										<li><a href="#" class="dropdown-item acceptLinkPassword" data-tid="<%=pass.getTid()%>" type="button">Accept</a></li>
					                    <li><a href="#" class="dropdown-item rejectLinkPassword" data-tid="<%=pass.getTid()%>" type="button">Reject</a></li>
					                </ul>
		           					 </div>
					    		</td>
					</tr>
			   		<%} %>
			    <tbody>
			    </tbody>
				</table>
			</div>
		</div>
		
		
		
		<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>It's Admin view tickets</p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
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
				     From Mukkam <cite title="Source Title">Municipality</cite>
				  </figcaption>
				</figure>
		</div>
		<div class="container-sm">
			Inactive <i class="fa-solid fa-ticket" style="color: red;"></i> Active <i class="fa-solid fa-ticket" style="color: green;"></i>
			<div style="height: 400px; width: auto; overflow: auto;">
		

				<table class="table table-striped table-hover">
			    <thead>
			        <tr>
			            <th scope="col" ><i class="fa-solid fa-mountain-sun" style="color: black;"></i></th>
			            <th scope="col">Park</th>
			            <th scope="col"><i class="fa-solid fa-ticket" style="color: black;"></i></th>
			            <th scope="col">Slot <i class="fa-solid fa-ticket" style="color: black;"></i></th>
			            <th scope="col">Price</th>
			            <th scope="col"><i class="fa-solid fa-ticket" style="color: black;"></i></th>
			        </tr>
			    </thead>
			     <%
			  List<TicketDTO> tickets = ServicesDAO.getAllTicket();
			  for(TicketDTO ticket : tickets){
			  %>
			    <tr>
			      <td><img src="timg?id=<%=ticket.getToid()%>" alt="Bootstrap" style="width: 60px;" ></td>
			      <td><img src="imTick?id=<%=ticket.getTid()%>" alt="Bootstrap" style="width: 60px;" ></td>
			      <td><%=ticket.getTicket() %></td>
			      <td><%=ticket.getSlot() %></td>
			      <td><%=ticket.getPrice() %></td>
			      <td>
			      <%
			      if(ticket.getStatus() == null){
	    		 		out.print("<i class='fa-solid fa-ticket' style='color: green;'></i>");
		            } else if(ticket.getStatus().equals("delete")){
		                out.print("<i class='fa-solid fa-ticket' style='color: red;'></i>");
		            }else{
		            	out.print("<span  style='color : red;'></span>");
		            }
			      
			      %>
			      </td>
			      
			    </tr>
			    <%
			  }
			    %>
			   
			    <tbody>
			    </tbody>
				</table>
			</div>
		</div>
		
		
		
		<figure class="text-center" style="margin-bottom: 40px; margin-top: 100px;">
				  <blockquote class="blockquote">
				    <p></p>
				  </blockquote>
				  <figcaption class="blockquote-footer">
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
				     From Mukkam <cite title="Source Title">Municipality</cite>
				  </figcaption>
		</figure>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
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
        
        $(".unblockLinkTourist").on("click", function(event) {
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
        $(".blockLinkTourist").on("click", function(event) {
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


$(document).ready(function() {
    // Function to refresh the content of the specified element
    window.refreshContentTwo = function() {
        $('#contentToRefreshTwo').load(location.href + ' #contentToRefreshTwo', function() {
            // Rebind event handlers after content refresh
            bindEventHandlersTwo();
        });
    }

    // Click event to trigger the content refresh when the button is clicked
    $('#refreshButton').on('click', function() {
        window.refreshContentTwo();
    });

    // Initial binding of event handlers
    bindEventHandlersTwo();

    // Function to bind event handlers
    function bindEventHandlersTwo() {
        // Handle the click event on the "Accept" link
        $(".acceptLinkPassword").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "touristResetPasswordAccept.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration accepted successfully");

                    // Show the success message
                    $("#registrationAcceptSuccessAlert").show().delay(3000).fadeOut();

                    // Reload the content within the div with id "contentToRefresh" after acceptance
                    window.refreshContentTwo();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error accepting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });

        // Handle the click event on the "Reject" link
        $(".rejectLinkPassword").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the rejection
            $.ajax({
                type: "GET",
                url: "touristResetPasswordReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Registration rejected successfully");

                    // Show the rejection success message
                    $("#registrationRejectSuccessAlert").show().delay(3000).fadeOut();

                    // Reload the content within the div with id "contentToRefresh" after rejection
                    window.refreshContentTwo();
                },
                error: function(xhr, status, error) {
                    // Handle the error response (if needed)
                    console.error("Error rejecting Registration: " + error);

                    // You can show an error message if needed
                }
            });
        });

       
        
    }
});



function sendEmail(email, password, Name) {

    var subject = "Request to reset password for " + Name;
    var body =
               "Tourist place Name: " + Name + "\n" +
               "Tourist Email: " + email + "\n" +
               "Tourist Password: " + password;

    // You can send this data to a server-side script using AJAX
    // Here's an example using jQuery
    const recipientEmail = email; // Use the entered email address as recipient
    window.location.href = 'mailto:' + recipientEmail + '?subject=Forget%20Password%20for%20hotel&body=' + encodeURIComponent(body);
     
}



</script>
</body>
</html>