<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="fontawesome-free-6.5.1-web/css/fontawesome.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/brands.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/solid.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%
String alert = (String) request.getParameter("message");
%>
<title>User forgetten password</title>
</head>
<body>
<div class="container">
	<div class="card" style="margin-top: 200px; position: relative; left: 25%; width: 600px;">
		<%
		if(alert != null && alert.equals("notvalidotp")){
			out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Enter valid OTP</div>");
		}
		%>
		<form action="userVerifyOTOPassward.jsp" method="post" style="margin: 20px;">
		  <div class="input-group mb-3" style="margin-top: 10px;">
			<span class="input-group-text"> <i class="fa-solid fa-key"></i></span>
		    <input type="text" class="form-control" id="otp" name="otp" placeholder="Enter OTP" aria-describedby="emailHelp">
		</div>
		<div id="emailHelp" class="form-text" style="color: white;">Do not share the OTP</div>

		  <button type="submit" class="btn btn-outline-success">Verify OTP <i class="fa-solid fa-key"></i></button>
		 
		</form>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</body>
</html>