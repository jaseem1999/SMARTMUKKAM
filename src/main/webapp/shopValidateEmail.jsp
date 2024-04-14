<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>mail validation</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%
String alert = (String) request.getParameter("message");
%>
</head>
<body>
<div class="container" style="margin-top: 100px;">
<%
if(alert != null && alert.equals("wait")){
	out.print("<div id='alert' class='alert alert-danger' role='alert'>Please Conatct your municipality you are already registered or municipality not accepted your registration</div>");
}
%>
<form id="emailForm" action="shopEmailValidationServlet.jsp" method="post">
    <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        <span id="emailError" style="color: red;"></span>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    document.getElementById("emailForm").addEventListener("submit", function(event) {
        var email = document.getElementById("email").value.trim();

        // Reset error message
        document.getElementById("emailError").innerText = "";

        // Regular expression for email validation
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Check if email is empty or not valid
        if (email === "" || !emailPattern.test(email)) {
            document.getElementById("emailError").innerText = "Please enter a valid email address.";
            event.preventDefault(); // Prevent form submission
        }
    });
</script>

</body>
</html>