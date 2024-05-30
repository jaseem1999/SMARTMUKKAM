<%@page import="smartMukkam.com.tourist.ReviewDTO"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="java.util.List"%>
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
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristTicket.jsp">Ticket management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristGallery.jsp">Gallery management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristHome.jsp">Home</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristWallpapper.jsp">Wallpaper management</a></li>
			<li style=" margin: 10px;"><a class="nav-link" style="color: white;" href="touristFeedback.jsp">Feedback</a></li>
		</ul>
	</div>
</div>

<div class="container" style="margin-top: 50px;">
	

	<div style="background: #000802b8; margin: 10px; box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5); color: white; height: 500px;">
		<div style="width: 100%; height: 30px; background: white;">
			<span style="color: black;font-size: 15px; font-weight: bolder; text-transform: uppercase; margin: 10px; ">Review</span>
		</div>
		
		<table class="table" style="margin-top: 10px;" id="contentToRefresh">
  <thead>
    <tr>
      <th scope="col">UID</th>
      <th scope="col">Place name</th>
      <th scope="col">Place img</th>
      <th scope="col">Review</th>
      <th scope="col">Comment</th>
    </tr>
  </thead>
  <tbody>
  <%
  List<ReviewDTO> review = TouristDAO.getReviewBasedToidForTourist(toId);
  for(ReviewDTO r : review){
  %>
    <tr>
      <th scope="row"><img alt="" src="userPhoto?id=<%=r.getUid()%>" style="width: 50px;height: 50px; border-radius: 50%; "></th>
      <td><%=TouristDAO.ticketName(r.getTicketId()) %></td>
      <td><img alt="cd" src="imTick?id=<%=r.getTicketId()%>" style="width: 100px; height:50px;"></td>
      <td><div class="col-10" style="margin-left: 40px;"><%=r.getReview() %></div></td>
      <td>
      	<form id="reviewForm_<%= r.getTid() %>" class="reviewForm">
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
            url: 'touristReviewComment.jsp', // replace with the actual server endpoint
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