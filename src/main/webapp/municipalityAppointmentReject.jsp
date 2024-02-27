<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reject</title>

<script>
    // Function to show alert based on the message parameter in the URL
    

    // Execute the showAlert function after the page has loaded
  
</script>

</head>
<body>
<%
Integer tid = Integer.parseInt(request.getParameter("id"));
int i = ServicesDTO.rejectAppointment(tid);
if(i>0){
	response.sendRedirect("municipalityAppointment.jsp?messge=appointmentRejectSuccess");
}else{
	response.sendRedirect("municipalityAppointment.jsp?messge=appointmentRejectFailed");
}
%>
</body>
</html>