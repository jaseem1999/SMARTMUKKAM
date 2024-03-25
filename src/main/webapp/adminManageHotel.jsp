<%@page import="smartMukkam.com.admin.ServicesDAO"%>
<%@page import="smartMukkam.com.hotel.RoomDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
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
		    <li class="list-group-item" style="color: #b66dff; background: #140f0f17;">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageHotel.jsp">
		            Manage Hotels
		            <span><i class="fa-solid fa-hotel" style="color: #b66dff;"></i></span>
		        </a>
		    </li>
		    <li class="list-group-item">
		        <a class="nav-link d-flex justify-content-between align-items-center" href="adminManageTourist.jsp">
		            Manage Tourist Place
		            <span><i class="fa-solid fa-mountain-sun"></i></span>
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
				    <p>It's Admin for manage Hotels</p>
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
			Inactive <i class="fa-solid fa-hotel" style="color: red;"></i> Active <i class="fa-solid fa-hotel" style="color: green;"></i> Proccessing <i class="fa-solid fa-hotel" style="color: blue;"></i>
			<div style="height: 400px; width: auto; border: 1px solid black; overflow: auto;" id="contentToRefresh">
		

				<table class="table table-striped table-hover">
			    <thead>
			        <tr >
			            <th scope="col" ><i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-user" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-envelope" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-lock" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-phone-volume" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-file" style="color: black;"></i></th>
			            <th scope="col">First <i class="fa-solid fa-address-book" style="color: black;"></i></th>
			            <th scope="col">Second <i class="fa-solid fa-address-book" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-city" style="color: black;"></i></th>
			            <th scope="col">State </th>
			            <th scope="col">PIN. no</th>
			            <th scope="col"><i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bars" style="color: black;"></i></th>
			        </tr>
			    </thead>
			    <%
			    List<HotelDTO> hotels = HotelDAO.getAllHotelDetailsForAdmin();
				 
				 for(HotelDTO h : hotels){
				 %>
				 	<tr>
				 		<td><img src="himg?id=<%=h.getHotelId()%>" style="width: 40px; border: 1px solid; border-radius: 5px;" alt="" ></td>
				 		<td><%=h.getOwnerName() %></td>
				 		<td><%=h.getEmail() %></td>
				 		<td><%=h.getPass() %></td>
				 		<td><%=h.getPhone() %></td>
				 		<td><%=h.getHotelName() %></td>
				 		<td><a href="hotelLicenseAdmin.jsp?id=<%=h.getHotelId()%>" class=" badge-primary">view</a></td>
				 		<td><%=h.getAddressOne() %></td>
				 		<td><%=h.getAddressTwo() %></td>
				 		<td><%=h.getCity() %></td>
				 		<td><%=h.getState() %></td>
				 		<td><%=h.getPin() %></td>
				 		<td><%
				    		 	if(h.getStatus() == null){
				    		 		out.print("<i class='fa-solid fa-hotel' style='color: blue;'></i>");
					            } else if(h.getStatus().equals("accept")){
					                out.print("<i class='fa-solid fa-hotel' style='color: green;'></i>");
					            } else if(h.getStatus().equals("reject")){
					            	out.print("<i class='fa-solid fa-hotel' style='color: red;'></i>");
					            }else{
					            	out.print("<span  style='color : red;'></span>");
					            }
				    %></td>
				    <td>
				    			<div class="dropdown">
				                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				                    <i class="fa-solid fa-bars" style="color: black;"></i>
				                </button>
				                <ul class="dropdown-menu">
				                    <li><a href="#" class="dropdown-item acceptLinkHotel" data-tid="<%=h.getHotelId()%>" type="button">Unblock</a></li>
				                    <li><a href="#" class="dropdown-item rejectLinkHotel" data-tid="<%=h.getHotelId() %>" type="button">Block</a></li>
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
		<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>It's Admin for view rooms</p>
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
			Inactive <i class="fa-solid fa-bed" style="color: red;"></i> Active <i class="fa-solid fa-bed" style="color: green;"></i> Proccessing <i class="fa-solid fa-bed" style="color: blue;"></i>
			<div style="height: 400px; width: auto; border: 1px solid black; overflow: auto;" id="contentToRefresh">
		

				<table class="table table-striped table-hover">
			    <thead>
			        <tr >
			            <th scope="col" ><i class="fa-solid fa-hotel" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bed" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bed" style="color: black;"></i></th>
			            <th scope="col">No . <i class="fa-solid fa-bed" style="color: black;"></i></th>
			            <th scope="col">Description</th>
			            <th scope="col">Rent <i class="fa-solid fa-rupee-sign" style="color: black;"></i></th>
			        	<th scope="col">Discount <i class="fa-solid fa-rupee-sign" style="color: black;"></i></th>
			            <th scope="col"><i class="fa-solid fa-bed" style="color: black;"></i></th>
			        </tr>
			    </thead>
			    <tbody>
			    <%
				  List<RoomDTO> room = ServicesDAO.getAllRoomsforAdmin();
				  
				  for(RoomDTO r : room){
				  %>
				    <tr>
				      <th scope="row"><img src="himg?id=<%=r.getHoid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></th>
				      <th scope="row"><img src="imRoom?id=<%=r.getTid()%>" style="width: 100px; border: 1px solid; border-radius: 5px;" alt="" ></th>
				      <td><%=r.getRoom() %></td>
				      <td><%=r.getNoRoom() %></td>
				      <td style="color: green;" class="description" data-description="<%= r.getDescription() %>">Click to view description</td>
				      <td><%=r.getPrice() %></td>
				      <td ><%=r.getDiscount() %></td>
				      <td><%
				      if(r.getStatus() == null){
		    		 		out.print("<i class='fa-solid fa-bed' style='color: blue;'></i>");
			            } else if(r.getStatus().equals("accept")){
			                out.print("<i class='fa-solid fa-bed' style='color: green;'></i>");
			            } else if(r.getStatus().equals("reject")){
			            	out.print("<i class='fa-solid fa-bed' style='color: red;'></i>");
			            }else{
			            	out.print("<span  style='color : red;'></span>");
			            }
				      
				      %></td>
				      
				    </tr>
				   <%} %>
			    </tbody>
				</table>
			</div>
		</div>
		
		
		<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>It's Admin for view Foods</p>
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
		
		
		
		<div class="container-sm" style="margin-top: 40px;">
			
			<figure class="text-center" style="margin-bottom: 40px;">
				  <blockquote class="blockquote">
				    <p>It's Admin for view Taxi</p>
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




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
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

</script>

</body>
</html>