<%@page import="smartMukkam.com.admin.ServicesDAO"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityLoginDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.admin.AdminDAO"%>
<%@page import="smartMukkam.com.admin.AdminDetailsDTO"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
		    <li class="list-group-item" >
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageTourist.jsp">
		            Manage Tourist Place
		            <span><i class="fa-solid fa-mountain-sun"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item" >
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageShop.jsp">
		            Manage Shops
		            <span><i class="fa-solid fa-shop" ></i></span>
		        </a>
		    </li>
		    <li class="list-group-item" style="color: #b66dff; background: #140f0f17;">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageMunicipality.jsp">
		            Manage Municipality
		            <span><i class="fa-solid fa-building-ngo" style="color: #b66dff;"></i></span>
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
				    <p>It's Admin for manage Municipality</p>
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
			<p style="padding: 20px;font-size: 15px; font-weight: 500; margin-top: 20px;color: red">
				As the administrator responsible for overseeing the operations of the municipality, the role of the admin is multifaceted and crucial for the smooth functioning of local governance. Tasked with a myriad of responsibilities, the admin acts as the linchpin between various departments, ensuring effective coordination and execution of municipal policies and initiatives. One of the primary duties involves managing the municipality's affairs based on the advice provided by key stakeholders such as the secretary and chairman. Collaborating closely with these officials, the admin facilitates decision-making processes, implements directives, and oversees the allocation of resources to address the municipality's needs effectively. Additionally, the admin serves as a conduit for communication between the municipality's leadership and its constituents, disseminating important information, addressing concerns, and fostering community engagement. With a keen focus on efficiency and transparency, the admin plays a pivotal role in upholding the municipality's objectives while striving to enhance the quality of life for its residents.
			</p>
		</div>
		
		<div class="container-sm">
			Inactive <i class="fa-solid fa-building-ngo" style="color: red;"></i> Active <i class="fa-solid fa-building-ngo" style="color: green;"></i>
			<div style="" id="contentToRefresh">
		

				<table class="table table-striped table-hover">
			    <thead>
			        <tr >
			            <th scope="col" ><i class="fa-solid fa-building-ngo" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-envelope" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-lock" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-building-ngo" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bars" style="color: black;"></i></th>
			        </tr>
			    </thead>
			    <%
			   	List<MunicipalityLoginDTO> municipality = ServicesDAO.getMunicipality();
			    for(MunicipalityLoginDTO m : municipality){
				 %>
				 	<tr>
				 		<td>Mukkam Municipality</td>
				 		<td><%=m.getEmail() %></td>
				 		<td><%=m.getPassword() %></td>
				 		<td>
				 		<%
					      
						  if(munAdminActive.equals("active")){
							   out.print("<i class='fa-solid fa-building-ngo' style='color: green;'>");
						  }else{
							  out.print("<i class='fa-solid fa-building-ngo' style='color: red;'>");  
						}
				 		
				 		%>
				 		</td>
				 		<td>
				 		<div class="dropdown">
				                <button class="btn btn-secondary dropdown-toggle"
				                style="background:<%
				                	if(m.getStatus() == null){
				                		out.print("green");
				                	}
				                	else if(m.getStatus().equals("blocked")){
				                		out.print("red");
				                	}else{
				                		
				                	}
				                %>;" 
				                 type="button" data-bs-toggle="dropdown" aria-expanded="false">
				                    <i class="fa-solid fa-bars" style="color: black;"></i>
				                </button>
				                <ul class="dropdown-menu">
				                    <li><a href="#" class="dropdown-item acceptLinkMunicipality" data-tid="<%=m.getId()%>" type="button">Unblock</a></li>
				                    <li><a href="#" class="dropdown-item rejectLinkMunicipality" data-tid="<%=m.getId() %>" type="button">Block</a></li>
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
        $(".acceptLinkMunicipality").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "municipalityRegistrationAccept.jsp",
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
        $(".rejectLinkMunicipality").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the rejection
            $.ajax({
                type: "GET",
                url: "rejectLinkMunicipality.jsp",
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

       
        
    }
});


</script>
</body>
</html>