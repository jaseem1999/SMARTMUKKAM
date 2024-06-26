<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.ProductDTO"%>
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
String alert = (String) request.getParameter("message");
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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
<div class="container-fluid" style="margin-top: 50px;">
	<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopOrder.jsp"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> Orders</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAdvertisement.jsp"><i class="fa fa-film" aria-hidden="true"></i> Advertisement</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopReport.jsp"><i class="fa fa-flag" aria-hidden="true"></i> Report</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopGallery.jsp"><i class="fa fa-camera" aria-hidden="true"></i> Gallery</a>
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
    <div class="col-sm-10">
    	<div class="homeFull" style="margin: 50px;">
    		<div class="home">
    			<span style="color: white;">Product</span>
    		</div>
    		<div class="home" style="background: #6a61c6;">
    			<span style="color: white;">Add product</span>
    		</div>
    		<% 
                        if(alert != null && alert.equals("productAddedSuccess")){
                        	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Product added success</div>");
                        }
    					if(alert != null && alert.equals("productAddedFailed")){
    						out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Product added Failed</div>");
                        }
						
						
                        	
                        %>
    		<form action="pAdd"  method="post" enctype="multipart/form-data" style="margin: 30px;" onsubmit="return validateForm()">
				  <div class="mb-3">
				    
				    <input type="hidden" value="<%=sid%>" class="form-control" id="sid" name="sid" aria-describedby="sid">
				    <span id="uidError" style="color: red;"></span>
				   </div>
				  <div class="mb-3">
				    <label for="product" class="form-label">Product</label>
				    <input type="text" class="form-control" id="product" name="product" placeholder="Enter product">
				    <span id="productError" style="color: red;"></span>
				  </div>
				  <div class="mb-3">
				    <label for="description" class="form-label">Description</label>
				    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
				    <span id="descriptionError" style="color: red;"></span>
				  </div>
				  <div class="mb-3">
				    <label for="price" class="form-label">Price</label>
				    <input type="text" class="form-control" id="price" name="price" placeholder="Enter price">
				    <span id="priceError" style="color: red;"></span>
				  </div>
				  <div class="mb-3">
				    <label for="discount" class="form-label">Discount</label>
				    <input type="text" class="form-control" id="discount" name="discount" placeholder="Enter discount">
				    <span id="discountError" style="color: red;"></span>
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload product image</label>
				    <input type="file" class="form-control" id="image" name="image">
				    <span id="imageError" style="color: red;"></span>
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
			
    		
    		<div class="home" style="background: #6a61c6;">
    			<span style="color: white;">View product</span>
    		</div>
    		<div id="productDeleteSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			     Product Delete successfully
			</div>
			<!-- Add this to your HTML body -->
			<div id="productActiveSuccessAlert" class="alert alert-success" style="color: green; display: none;" role="alert">
			    product Active successfully
			</div>
	    		<div style="overflow: auto; height: 300px;" id="contentToRefresh">
	    			<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">TID</th>
					      <th scope="col">SID</th>
					      <th scope="col">Product</th>
					      <th scope="col">Image</th>
					      <th scope="col">Description</th>
					      <th scope="col">Price</th>
					      <th scope="col">Discount</th>
					      <th scope="col">Status</th>
					      <th scope="col">Menu</th>
					    </tr>
					  </thead>
					  <tbody>
					  <%
					  List<ProductDTO> products = ShopDAO.getProductBasedOnShopId(sid);
					  for(ProductDTO product : products){
					  %>
					    <tr>
					      <th scope="row"><%=product.getTid() %></th>
					      <td><img src="shopImage?id=<%=product.getSid() %>" alt="Logo" width="30" height="24" ></td>
					      <td><%=product.getProduct() %></td>
					      <td><img alt="" src="pImage?id=<%=product.getTid()%>" style="width: 75px; height: 75px;"></td>
					      <td><%=product.getDescription() %></td>
					      <td><%=product.getPrice() %></td>
					      <td><%=product.getDiscount() %></td>
					      <td><%
					      if(product.getStatus() == null || product.getStatus().equals("active")){
				                out.print("<span  style='color : green;'>Active</span>");
				            } else if(product.getStatus().equals("delete")){
				                out.print("<span  style='color : red;'>Delete</span>");
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
				                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=product.getTid()%>" type="button">Delete</a></li>
				                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=product.getTid()%>" type="button">Active</a></li>
				                </ul>
           					 </div>
					      </td>
					    </tr>
					   <%
					  }
					   %>
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
                    url: "shopProductDelete.jsp",
                    data: { id: appointmentId },
                    success: function(response) {
                        // Handle the success response (if needed)
                        console.log("delete accepted successfully");

                        // Show the success message
                        $("#productDeleteSuccessAlert").show().delay(3000).fadeOut();

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
                    url: "shopProductActive.jsp",
                    data: { id: appointmentId },
                    success: function(response) {
                        // Handle the success response (if needed)
                        console.log("Active accept successfully");

                        // Show the rejection success message
                        $("#productActiveSuccessAlert").show().delay(3000).fadeOut();

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


function validateForm() {
    var product = document.getElementById("product").value.trim();
    var description = document.getElementById("description").value.trim();
    var price = document.getElementById("price").value.trim();
    var discount = document.getElementById("discount").value.trim();
    var image = document.getElementById("image").value.trim(); // Get the file name

    var isValid = true;

    // Validate product
    if (product === "") {
        document.getElementById("productError").innerText = "Please enter product.";
        isValid = false;
    } else {
        document.getElementById("productError").innerText = "";
    }

    // Validate description
    if (description === "") {
        document.getElementById("descriptionError").innerText = "Please enter description.";
        isValid = false;
    } else {
        document.getElementById("descriptionError").innerText = "";
    }

    // Validate price
    if (price === "") {
        document.getElementById("priceError").innerText = "Please enter price.";
        isValid = false;
    } else {
        document.getElementById("priceError").innerText = "";
    }

    // Validate discount
    if (discount === "") {
        document.getElementById("discountError").innerText = "Please enter discount.";
        isValid = false;
    } else {
        document.getElementById("discountError").innerText = "";
    }

    // Validate image
    if (image === "") {
        document.getElementById("imageError").innerText = "Please upload an image file.";
        isValid = false;
    } else {
        var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
        if (!allowedExtensions.exec(image)) {
            document.getElementById("imageError").innerText = "Uploaded file must be an image (jpg, jpeg, png, gif).";
            isValid = false;
        } else {
            document.getElementById("imageError").innerText = "";
        }
    }

    return isValid;
}
    
    </script>

</body>
</html>