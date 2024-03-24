
<%@page import="smartMukkam.com.admin.AdminDAO"%>
<%@page import="smartMukkam.com.municipality.HistoryDTO"%>
<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@page import="smartMukkam.com.municipality.Councilor"%>
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
			<%
			String adminActive=AdminDAO.getActiveAdmin() ;
			if(adminActive.equals("active")){
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
		.homeFull{
		 	max-width: 1000px;
		 	height: auto;
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

String alert = (String) request.getParameter("message");
%>


<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Profile upload</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<form action="mprofile"  method="post" enctype="multipart/form-data">
			  <div class="mb-3">
			    <label for="history" class="form-label">Enter History</label>
			    <textarea class="form-control"  id="history" name="history" rows="4" cols="60"></textarea>
	
			  </div>
			  <div class="mb-3">
			    <label for="secretary" class="form-label">Enter Secretary name</label>
			    <input type="text" class="form-control"  id="secretary" name="secretary" >
	
			  </div>
			  <div class="mb-3">
			    <label for="president" class="form-label">Enter Chairman name</label>
			    <input type="text" class="form-control" " id="president" name="president">
	
			  </div>
			  <div class="mb-3">
			    <label for="image" class="form-label">Upload image</label>
			    <input type="file" class="form-control" id="image" name="image" aria-describedby="emailHelp">
			  </div>
			  
			  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="governor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Profile upload</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<form action="gprofile"  method="post" enctype="multipart/form-data">
        	
        	  <div class="mb-3">
				    <label for="ward" class="form-label">Ward</label>
				    <select class="form-select" id="ward" name="ward">
				        <option value="NADUKIL" selected>Ward 1</option>
				        <option value="THECHYAD">Ward 2</option>
				        <option value="KALLURUTTY SOUTH">Ward 3</option>
				        <option value="KALLURUTTY NORTH">Ward 4</option>
				        <option value="THOTTATHIN KADAVU">Ward 5</option>
				        <option value="NELLIKAPOYIL">Ward 6</option>
				        <option value="KANHIRAMUZHI">Ward 7</option>
				        <option value="NEELESWARAM">Ward 8</option>
				        <option value="MANGAPOYIL">Ward 9</option>
				        <option value="MUTHERI">Ward 10</option>
				        <option value="NEDUMANGADU">Ward 11</option>
				        <option value="AGUSTIANMUZHI">Ward 12</option>
				        <option value="KUTTYPALA">Ward 13</option>
				        <option value="MUKKAM">Ward 14</option>
				        <option value="KAYYITTAPOYIL">Ward 15</option>
				        <option value="WEST MAMPETTA">Ward 16</option>
				        <option value="KACHERI">Ward 17</option>
				        <option value="KANAKUPARAMB">Ward 18</option>
				        <option value="MANGALASSERI">Ward 19</option>
				        <option value="PULPARAMBU">Ward 20</option>
				        <option value="WEST CHENNAMANGALOOR">Ward 21</option>
				        <option value="POTTASSERI">Ward 22</option>
				        <option value="KUTTYERIMMAL">Ward 23</option>
				        <option value="MANASSERI TWON">Ward 24</option>
				        <option value="WEST MANASSERI">Ward 25</option>
				        <option value="KARIYAKULANGARA">Ward 26</option>
				        <option value="THOONGUMPURAM">Ward 27</option>
				        <option value="MUTHALAM">Ward 28</option>
				        <option value="VENNAKODE">Ward 29</option>
				        <option value="IRATTAKULANGARA">Ward 30</option>
				        <option value="MUNDUPARA">Ward 31</option>
				        <option value="POOLAPOYIL">Ward 32</option>
				        <option value="KATHIYODE">Ward 33</option>
				    </select>
				</div>
        	  
			  
			  <div class="mb-3">
			    <label for="name" class="form-label">Enter name</label>
			    <input type="text" class="form-control"  id="name" name="name" >
	
			  </div>
			  <div class="mb-3">
			    <label for="position" class="form-label">Enter position</label>
			    <input type="text" class="form-control" " id="position" name="position">
	
			  </div>
			  <div class="mb-3">
			    <label for="party" class="form-label">Enter party</label>
			    <input type="text" class="form-control" " id="party" name="party">
	
			  </div>
			  <div class="mb-3">
			    <label for="message" class="form-label">Enter Message</label>
			    <textarea class="form-control"  id="message" name="message" rows="4" cols="60"></textarea>
	
			  </div>
			  <div class="mb-3">
			    <label for="image" class="form-label">Upload profile</label>
			    <input type="file" class="form-control" id="image" name="image" aria-describedby="emailHelp">
			  </div>
			  
			  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

<nav class="navbar bg-body-tertiary" style="height: 80px; background: #84818317;">
  <div class="container">
    <a class="navbar-brand" href="municipality.jsp" >
      <img src="images/png-transparent-government-of-india-logo-gold.png"Bootstrap" style="width: 50px;" >
      <img src="images/kerala-govt-logo.png" alt="Bootstrap" style="width: 60px; margin-left: 20px;" >
     </a>
      <ul class="nav justify-content-end">
      	   <li class="nav-item">
		      <img alt="" src="adminProView?id=<%=1%>" class="profile-image">
		      <span class="tooltip">Admin online</span>
		      <span class="availability-status online"></span>
		      <span class="tooltip">
					<%
						      
					  if(adminActive.equals("active")){
						   out.print("Admin is online");
					  }else{
						    out.print("Admin is offline");  
						}
				      %>
					</span>
		    </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="municipality.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="municipalityLogout.jsp">Logout</a>
		  </li>
		  
		  
		  
		</ul>
    </a>
  </div>
</nav>
<div class="container-fluid">
<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityAppointment.jsp">Appointments</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityRegistration.jsp">Registrations</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipalityNotification.jsp">Notifications</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="municipality.jsp">Home</a>
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
    					
    		<div class="home">
    			<span>Profile</span>
    		</div>
    		<div class="">
    			<div class="row" style="margin: 20px;">
    				<% 
                        if(alert != null && alert.equals("Msuccess")){
                        	out.print("<div id='alert' class='alert alert-success' style='color:black;' role='alert'>Municipality profile update successfully</div>");
                        }else if(alert != null && alert.equals("Mfailed")){
                        	out.print("<div id='alert' class='alert alert-dainger' style='color:red;' role='alert'>Municipality profile update failed</div>");
                        }else if(alert != null && alert.equals("success")){
                        	out.print("<div id='alert' class='alert alert-success' style='color:black;' role='alert'>Councilor profile update Success</div>");
                        }else if(alert != null && alert.equals("failed")){
                        	out.print("<div id='alert' class='alert alert-dainger' style='color:red;' role='alert'>Councilor profile update failed</div>");
                        }
                        else{
                        	
                        }
                        	
                        %>
    				<div class="col" >
	    				<div style="width: 100%; height: 300px; border: 1px solid;">
	    					<div style="width: 100%; height: 30px; background: #819d675c;">
	    					   <span style="margin-left: 20px; font-weight: 600;">Municipality profile upload</span>
	    					</div>
	    					<div style="margin: 20px;">
	    						<p>Users must upload only profile images, municipality photos, or logos, and are required to provide a comprehensive history about the municipality during the upload process.</p>	
	    						<button style="margin-top: 20px;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
	    					</div>
	    				</div>
    				</div>
    				<div class="col">
    					<div style="width: 100%; height: 300px; border: 1px solid;">
	    					<div style="width: 100%; height: 30px; background: #819d675c;">
	    					   <span style="margin-left: 20px; font-weight: 600;">Municipality governor body profile upload</span>
	    					</div>
	    					<div style="margin: 20px;">
	    						<p>Users are mandated to upload only profile images designated for municipality and governor body representation on the platform, ensuring a focused portrayal. Additionally, they are required to submit detailed personal information for each governing body member, encompassing essential details such as names, positions, and contact information</p>	
	    						<button style="margin-top: 20px;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#governor">Update</button>
	    					</div>
	    				</div>
    				</div>
    			</div>
    			<div style="width: 100%; height: 30px; background: #819d675c;">
	   			   <span style="margin-left: 20px; font-weight: 600;">View History of municipality</span>
	    		</div>
    			<div style="margin: 20px;">
    				<h1>History</h1>
    				<%List<HistoryDTO> history = ServicesDTO.getAllHistory();
    				for(HistoryDTO h : history){
    				%>
    				<P><%=h.getHistory() %></P>
    				<hr>
    				Chairman : <%=h.getChairman() %>
    				Secretary : <%=h.getSecretary() %>
    				
    				<%} %>
    				
    			</div>
    			
    			
    			<div style="width: 100%; height: 30px; background: #819d675c;">
	   			   <span style="margin-left: 20px; font-weight: 600;">View councillor profiles</span>
	    		</div>
	    		<div class="row" style="margin: 10px;">
	    		<%
	    		List<Councilor> councilor = ServicesDTO.getAllCouncilor();
	    		
	    		for(Councilor c : councilor){
	    		%>
	    			<div class="col" style="margin: 10px;">
	    				<div class="card" style="width: 16rem;">
							  <img src="cimg?id=<%=c.getTid()%>" class="card-img-top" style="max-height: 150px;" alt="...">
							  <div class="card-body">
							    <h5 class="card-title"><%=c.getName() %></h5>
							    <p class="card-text"><%=c.getMessge() %></p>
							  </div>
							  <ul class="list-group list-group-flush">
							  	<li class="list-group-item">Position :: <%=c.getPosition() %> </li>
							    <li class="list-group-item">Ward name :: <%=c.getWard() %> (<%=c.getTid() %>)</li>
							    <li class="list-group-item">Party :: <%=c.getParty() %></li>
							  </ul>
							  
						</div>
	    			</div>
	    			<%} %>
	    			
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