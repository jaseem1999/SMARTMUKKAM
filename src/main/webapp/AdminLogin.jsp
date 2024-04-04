<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
String alert = (String) request.getParameter("message");
%>
<title>Smart Mukkam Admin</title>
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
<link href="fontawesome-free-6.5.1-web/css/fontawesome.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/brands.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/solid.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
  
    <!-- Customized Bootstrap Stylesheet -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style type="text/css">
body {
      background-image: url('images/laptop.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      height: 90vh;
    }
    .col-4{
      background-image: url('images/door.jpg');
      background-size: cover;
      background-repeat: no-repeat;
   
      height: 600px;
    }

</style>
</head>
<body>

<div class="container">
	<div class="row" style="width: 100%; border: 1px solid; margin-top: 50px; border-radius: 10px;">
	    <div class="col-8 justify-content-center" style="background: #08080866; border-radius: 10px; color: white;">
	    <%
		if(alert != null && alert.equals("loginFailed")){
			out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Login Failed</div>");
        }
	    if(alert != null && alert.equals("unautherizedAccess")){
			out.print("<div id='alert' class='alert alert-danger' style='color:red;' role='alert'>Unautherized Access</div>");
        }
	    %>
	    	<form action="adminLoginServlet.jsp" method="post" style="margin: 70px; margin-top: 200px;">
			  <div class="input-group mb-3">
				    <span class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></span>
				    <input type="email" class="form-control" id="email" name="email" placeholder="Email address" aria-describedby="emailHelp">
				</div>
				<div id="emailHelp" class="form-text" style="color: white;">We'll never share your email with anyone else.</div>

			  <div class="input-group mb-3">
				    <span class="input-group-text"><i class="fa fa-unlock-alt" aria-hidden="true"></i></span>
				    <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter Password" aria-describedby="emailHelp">
				</div>
			  <button type="submit" class="btn btn-outline-success">Login <i class="fa-solid fa-arrow-right-to-bracket"></i></button>
			  <a href="index.jsp" class="btn btn-outline-primary">Back</a>
			</form>
	    </div>
	    <div class="col-4" style="border-radius: 10px;" ></div>
  	</div>
</div>







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


</body>
</html>