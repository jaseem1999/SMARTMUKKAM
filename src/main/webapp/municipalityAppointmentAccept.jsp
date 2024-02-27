<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accept</title>
<script>
    
</script>

</head>
<body>
<%
Integer tid = Integer.parseInt(request.getParameter("id"));
int i = ServicesDTO.acceptAppointment(tid);
if(i>0){
	response.sendRedirect("municipalityAppointment.jsp?messge=appointmentSuccess");
}else{
	response.sendRedirect("municipalityAppointment.jsp?messge=appointmentFailed");
}
%>


</body>
</html>