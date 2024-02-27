<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>mail validation</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%
String email = (String) session.getAttribute("emailVerification");


%>

	<div class="container" style="margin-top: 100px;">
	
	
		
	
			  
			  <%
			  if(email != null){
				 out.print("<div class='mb-3'>"); 
				 out.print("<label for='otp' class='form-label'>Enter OTP</label>");
				 out.print("<input type='text'  class='form-control' id='otp' name='otp'></div>");
				 out.print("<a href='#' id='verifyOtpBtn' class='btn btn-success'>Verify OTP</a>");
			  }else{
				  out.print("<div class='mb-3'>");
				  out.print("<label for='exampleInputEmail1' class='form-label'>Email address</label>");
				  out.print("<input type='email' class='form-control' id='exampleInputEmail1' aria-describedby='emailHelp'>");
				  out.print("<div id='emailHelp' class='form-text'>We'll never share your email with anyone else.</div></div>");			
				  out.print("<a href='#' id='getOtpBtn' class='btn btn-success'>Get OTP</a>");
			  }
			  
			  
			  %>
			  
			 <a href="index.jsp" class="btn btn-primary">Back</a>
			  

	
	</div>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    // When the document is ready
    $(document).ready(function () {
        // Add a click event to the "Get OTP" button
        $("#getOtpBtn").click(function () {
            // Get the entered email value
            var enteredEmail = $("#exampleInputEmail1").val();
            
            // Check if the email is not empty
            if (enteredEmail.trim() !== "") {
                // Construct the URL with the entered email
                var url = "goGstOTP.jsp?email=" + encodeURIComponent(enteredEmail);
                
                // Redirect to the constructed URL
                window.location.href = url;
            } else {
                // Show an alert or handle empty email case
                alert("Please enter an email address.");
            }
        });
    });

    $(document).ready(function () {
        // Add a click event to the "Get OTP" button
        $("#verifyOtpBtn").click(function () {
            // Get the entered email value
            var enteredOtp = $("#otp").val();
            
            // Check if the email is not empty
            if (enteredOtp.trim() !== "") {
                // Construct the URL with the entered email
                var url = "userVerifyOTP.jsp?otp=" + encodeURIComponent(enteredOtp);
                
                // Redirect to the constructed URL
                window.location.href = url;
            } else {
                // Show an alert or handle empty email case
                alert("Please enter an OTP.");
            }
        });
    });
    
</script>

</body>
</html>