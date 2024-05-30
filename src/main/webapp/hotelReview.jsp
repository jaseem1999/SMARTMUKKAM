<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
<%@page import="smartMukkam.com.hotel.ReviewDTO"%>
<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
                <div class="row" style="margin: auto; width: 100%; color: white; height: 150px; background: #000000c4; border-radius: 16px;">
                	<ul class="col list-group" style="margin-top: 15px;">
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelRoomBooking.jsp"><i class="fa fa-bed" aria-hidden="true"></i> Manage rooms booking services</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelFood.jsp"><i class="fas fa-utensils"></i> Manage food ordering</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelTaxi.jsp"><i class="fa fa-taxi" aria-hidden="true"></i> Manage taxi service</a></li>
					</ul>
					<ul class="col list-group" style="margin-top: 15px;">
						<li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelGallery.jsp"><i class="fas fa-images"></i> Manage gallery</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
					    <li class="list-group-item" style="background: #00000000;"><a style="text-decoration: none; color: white;" href="hotelFeedback.jsp"><i class="fa fa-comments" aria-hidden="true"></i> feedback</a></li>
					</ul>
                	
                	
                </div>
                <%} %>
            </nav>
        </div>
    </div>
    
   	<div class="text-center mb-3 pb-3" style=" margin-top: 30px;">
        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px; color: rgb(43 46 52) !important;">Review</h6>
       
    </div>
    <div class="container">
	<table class="table" style="margin-top: 10px;" id="contentToRefresh">
  <thead>
    <tr>
      <th scope="col">UID</th>
      <th scope="col">Review</th>
      <th scope="col">Comment</th>
    </tr>
  </thead>
  <tbody>
  <%
  List<ReviewDTO> review = ServiceDAO.getReviewForHotel(hoid);
  for(ReviewDTO r : review){
  %>
    <tr>
      <th scope="row"><img alt="" src="userPhoto?id=<%=r.getUid()%>" style="width: 50px;height: 50px; border-radius: 50%; "></th>
      <td><div class="col-10" style="margin-left: 40px;"><%=r.getReview() %></div></td>
      <td>
      	<form id="reviewForm_<%= r.getTid() %>"  class="reviewForm">
            <input type="hidden" value="<%= r.getTid() %>" name="tid" />
            <input type="text" placeholder="Enter review comment" value="<%
            if(r.getComment() != null){
            	out.print(r.getComment());
            }else{
            	
            }
            %>" name="comment" />
            <button type="button" class="btn btn-primary submitReview">Submit</button>
        </form>
      </td>
    </tr>
   <%} %>
  </tbody>
</table>
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


$(document).ready(function () {
    // Attach the event listener to a parent element and delegate it to '.submitReview' elements
    $('#contentToRefresh').on('click', '.submitReview', function () {
        var form = $(this).closest('form');
        var formData = form.serialize();

        $.ajax({
            type: 'GET', // or 'GET' depending on your server-side implementation
            url: 'hotelReviewComment.jsp', // replace with the actual server endpoint
            data: formData,
            success: function (response) {
                // Handle success response here

                // Refresh the content of the table without reloading the entire page
                $('#contentToRefresh').load(location.href + ' #contentToRefresh');

                // Clear the form fields if needed
                form[0].reset();
            },
            error: function (error) {
                // Handle error response here
                console.error('Error:', error);
            }
        });
    });
});

</script>

</body>
</html>