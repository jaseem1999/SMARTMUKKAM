<%@page import="smartMukkam.com.tourist.TicketDTO"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
String name = (String) session.getAttribute("touristName");
String email = (String) session.getAttribute("touristEmail");
String tourist = (String) session.getAttribute("touristPlaceName");
Long number =(Long) session.getAttribute("touristPhone");
int toId = 0;
if(email == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}
String alert = (String) request.getParameter("message");
%>
	<title><%=tourist %></title>
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
	body {
      background-image: url('images/kerala-tourist.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      height: 100vh;
    }
	
	.carousel-caption {
    	color: white;
	}
		.profile-image {
		      margin-top: 8px;
    		  height: 40px;
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
			margin-left: -14px;
		    margin-top: 13px;
  			  
		}
	
	</style>


</head>




<body>
<nav class="navbar bg-body-tertiary" style="height: 80px; background-color: rgb(0 0 0 / 65%) !important;">
  <div class="container" style="background: white;">
    <a class="navbar-brand" href="touristHome.jsp" style="background: black;">
      <img src="images/kerala-tourisum-logo.png" style="width: 150px;" >
      <%
      List<TouristDTO> profileTourist = TouristDAO.getAllTouristDetailsBasedTouristId(email);
      for(TouristDTO profile : profileTourist){
    	  toId = profile.getTouristId();
      %>
      <img src="timg?id=<%=profile.getTouristId()%>" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
      <%} %>
     </a>
     
    
      	<ul class="nav justify-content-end">
      	   <li class="nav-item">
		      <img alt="" src="images/logo-en-LSGD.png" class="profile-image">
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
		    <a class="nav-link active" aria-current="page" href="touristHome.jsp" style="color: black;">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="touristLogout.jsp?email=<%=email%>">Logout</a>
		  </li>
		  
		  
		  
		</ul>
  </div>
</nav>
<div class="container" style="">
	<div style="height: 60px;background: rgb(0 0 0 / 65%) !important;">
		<ul class="nav justify-content-center">
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristHome.jsp">Home</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristGallery.jsp">Gallery management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristReview.jsp">Review</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristWallpapper.jsp">Wallpaper management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristFeedback.jsp">Feedback</a></li>
		</ul>
	</div>
</div>

<div class="container-sm" >
	<div style="background: #000802b8; margin: 10px; box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5); color: white;">
	<div style="width: 100%; height: 30px; background: white;">
		<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Upload Tickets</span>
	</div>
	<div class="row" style="margin-top: 2px; height: 400px;">
		<div class="col">
		<%
		if(alert != null && alert.equals("success")){
        	out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Ticket added success</div>");
        }
		if(alert != null && alert.equals("failed")){
			out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Ticket added Failed</div>");
        }
		%>
		<form action="toTick"  method="post" enctype="multipart/form-data" style="margin: 10px;">
				  <div class="mb-3">
				    <input type="hidden" value="<%=toId%>" class="form-control" id="toid" name="toid" aria-describedby="uid">
				   </div>
				  <div class="mb-3">
				    <label for="ticket" class="form-label">Ticket name</label>
				    <input type="text" class="form-control" id="ticket" name="ticket" placeholder="Enter ticket name" required="required">
				  </div>
				  <div class="mb-3">
				    <label for="no" class="form-label">Number of ticket available</label>
				    <input type="text" class="form-control" id="no" name="no" placeholder="Enter number of tickets slots" required="required">
				  </div>
				  <div class="mb-3">
				    <label for="price" class="form-label">Price</label>
				    <input type="number" style="color: black;" class="form-control" id="price" name="price" placeholder="Enter price" required="required">
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload Image</label>
				    <input type="file" class="form-control" id="image" name="image" required="required">
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>	
		</form>
		</div>
		
		<div class="col">
		 <div style="overflow: auto; height: 400px;">
			<table class="table table-dark table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Tourist</th>
			      <th scope="col">Image</th>
			      <th scope="col">Activity </th>
			      <th scope="col">Price </th>
			      <th scope="col">No of slot</th>
			      <th scope="col">Status</th>
			      <th scope="col">Menu</th>
			    </tr>
			  </thead>
			 
			  <tbody >
			  <%
			  List<TicketDTO> tickets = TouristDAO.getAllTicketBasedOnToid(toId);
			  for(TicketDTO ticket : tickets){
			  %>
			    <tr>
			      <td><img src="timg?id=<%=ticket.getToid()%>" alt="Bootstrap" style="width: 60px;" ></td>
			      <td><img src="imTick?id=<%=ticket.getTid()%>" alt="Bootstrap" style="width: 60px;" ></td>
			      <td><%=ticket.getTicket() %></td>
			      <td><%=ticket.getPrice() %></td>
			      <td><%=ticket.getSlot() %></td>
			      <td>
			      <%
			      	if(ticket.getStatus() == null){
		                out.print("<span  style='color : blue;'>Processing</span>");
		            } else if(ticket.getStatus().equals("accept")){
		                out.print("<span  style='color : green;'>Accept</span>");
		            } else if(ticket.getStatus().equals("reject")){
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
		                    <li><a href="#" class="dropdown-item acceptLink" data-tid="<%=ticket.getTid()%>" type="button">Active</a></li>
		                    <li><a href="#" class="dropdown-item rejectLink" data-tid="<%=ticket.getTid() %>" type="button">Delete</a></li>
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
	
	
	<div style="background: #000802b8; margin-top: 50px; margin-bottom: 50px; box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5); color: white;">
	<div style="width: 100%; height: 30px; background: white;">
		<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Upload Tickets</span>
	</div>
	
		
		
		 <div style="overflow: auto; height: 400px;">
			<table class="table table-dark table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Tourist</th>
			      <th scope="col">Image</th>
			      <th scope="col">Activity </th>
			      <th scope="col">Price </th>
			      <th scope="col">No of slot</th>
			      <th scope="col">Status</th>
			      <th scope="col">Menu</th>
			    </tr>
			  </thead>
			 
			  <tbody >
			 			    
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

</script>

</body>
</html>