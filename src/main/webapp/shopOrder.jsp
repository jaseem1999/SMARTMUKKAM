<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Integer sid = (Integer) session.getAttribute("sid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("shopemail");
Long phone = (Long) session.getAttribute("phone");
String shopType = (String) session.getAttribute("shopType");
String status = (String) session.getAttribute("status");
String shopName = (String) session.getAttribute("shopName");
String addressOne = (String) session.getAttribute("addressOne");
String addressTwo = (String) session.getAttribute("addressTwo");
String city = (String) session.getAttribute("city");
String state = (String) session.getAttribute("state");

if(shopType == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}

%>

<title><%=shopName %></title>
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
	
	<style type="text/css">
		.profile-image {
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 23%;
		}
		.homeFull{
		 	max-width: 1070px;
		 	height: auto;
		 	border: 1px solid white;
		 	box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);
		}
		.home{
			width: 100%;
			height: 30px;
			background: #353f5a;
			color: white;
		}
		.home span{
			margin: 5px;
		    color: black;
		    font-size: medium;
		    font-weight: 600;
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
	</style>
</head>
<body>
<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="shopImage?id=<%=sid %>" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      <span style="margin-left: 10px;"><%=shopName %></span>
    </a>
  
  <ul class="nav justify-content-end">
  			<li class="nav-item">
		       <img alt="" src="images/kerala-govt-logo.png" class="profile-image">
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
		    <a class="nav-link active" aria-current="page" href="shopHome.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="shopLogout.jsp?sid=<%=sid%>">Logout</a>
		  </li>	 
		  
	</ul>
	
</div>
</nav>
	<div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            	<img src="shopImage?id=<%=sid %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #353f5a;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%= sid %></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= name %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= email %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= phone %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= shopType %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= status %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%= shopName %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= addressOne %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= addressTwo %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= city %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= state %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
            </nav>
        </div>
    </div>
<div class="container-fluid" style="margin-top: 50px;" >
	<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAddproduct.jsp"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add product</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAdvertisement.jsp"><i class="fa fa-film" aria-hidden="true"></i> Advertisement</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopReport.jsp"><i class="fa fa-flag" aria-hidden="true"></i> Report</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopGallery"><i class="fa fa-camera" aria-hidden="true"></i> Gallery</a>
			  	</li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopProductReview.jsp"><i class="fa fa-comments" aria-hidden="true"></i> Review</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopFeedback.jsp"><i class="fa fa-paper-plane" aria-hidden="true"></i> Feedback</a>
			  </li>
			  
			  <li class="list-group-item">
			  	<p class="nav-link" style="color: red;" >It's Administration panel for shops</p>
			  </li>
			</ul>
			    	
    </div>
    <div class="col-sm-10" >
    	<div class="homeFull" style="margin: 50px; max-height: 300px; overflow: auto;"  >
    		<div class="home">
    			<span style="color: white;">Cart(Orders)</span>
    		</div>
    		
    			<table class="table table-striped table-hover" id="contentToRefresh">
  					<thead>
					    <tr>
					      <th scope="col">User</th>
					      <th scope="col">Product</th>
					      <th scope="col">Image</th>
					      <th scope="col">Quantity</th>
					      <th scope="col">Price</th>
					      <th scope="col">Address one</th>
					      <th scope="col">Address two</th>
					      <th scope="col">City</th>
					      <th scope="col">State</th>
					      <th scope="col">PIN</th>
					      <th scope="col">status</th>
					      <th scope="col">Menu</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					    <%
					    Integer sids = (Integer) session.getAttribute("sid");
					    List<CartDTO> cart = ShopDAO.getAllCart(sids);
					    for(CartDTO c : cart){
					    %>
					      <th><img alt="" style="width: 40px; border: 1px solid; border-radius: 50%" src="userPhoto?id=<%=c.getUid()%>"></th>
					      <td><%=ShopDAO.getProduct(c.getPid())%></td>
					      <td><img alt="" src="pImage?id=<%=c.getPid()%>" style="width: 50px; height: 50px;"></td>
					      <td><%=c.getQ() %></td>
					      <td><%= (c.getQ() * (Double.parseDouble(ShopDAO.getProductPrice(c.getPid())) - Double.parseDouble(ShopDAO.getProductDiscount(c.getPid())))) %></td>
					      <td><%=UserDAO.getUserAddressOne(c.getUid()) %></td>
					      <td><%=UserDAO.getUserAddressTWO(c.getUid()) %></td>
					      <td><%=UserDAO.getUserCity(c.getUid()) %></td>
					      <td><%=UserDAO.getUserState(c.getUid()) %></td>
					      <td><%=UserDAO.getUserPIN(c.getUid()) %></td>
					      <td>
					      <%
					     	 if(c.getStatus() == null){
				                out.print("<span  style='color : blue;'>Proccessing</span>");
				            } else if(c.getStatus().equals("accept")){
				                out.print("<span  style='color : green;'>Accept</span>");
				            }else if(c.getStatus().equals("delivery")){
				                out.print("<span  style='color : green;'>Delivery</span>");
				            }
				            else if(c.getStatus().equals("delivered")){
				                out.print("<span  style='color : green;'>delivered</span>");
				            }else if(c.getStatus().equals("reject")){
				                out.print("<span  style='color : red;'>Reject</span>");
				            }
				            else{
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
									<li><a href="#" class="dropdown-item acceptLink" data-tid="<%=c.getTid()%>"  type="button">accept</a></li>
									<li><a href="#" class="dropdown-item deliveryLink" data-tid="<%=c.getTid()%>"  type="button">delivery</a></li>
									<li><a href="#" class="dropdown-item deliveredLink" data-tid="<%=c.getTid()%>"  type="button">delivered</a></li>
									<li><a href="#" class="dropdown-item rejectLink" data-tid="<%=c.getTid()%>"  type="button">reject</a></li>
																    
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
                url: "ShopCartAccept.jsp",
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


        $(".deliveryLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "ShopCartDelivery.jsp",
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
        
        $(".deliveredLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the acceptance
            $.ajax({
                type: "GET",
                url: "ShopCartDelivered.jsp",
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
        

        

        // Handle the click event on the "Reject" link
        $(".rejectLink").on("click", function(event) {
            event.preventDefault(); // Prevent the default behavior of the link

            // Get the appointment id from the data-tid attribute
            var appointmentId = $(this).data("tid");

            // Make an AJAX request to the server to handle the rejection
            $.ajax({
                type: "GET",
                url: "ShopCartReject.jsp",
                data: { id: appointmentId },
                success: function(response) {
                    // Handle the success response (if needed)
                    console.log("Appointment rejected successfully");

                    // Show the rejection success message
                   

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