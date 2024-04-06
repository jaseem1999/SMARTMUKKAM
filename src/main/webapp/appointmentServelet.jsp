
<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Integer uid = Integer.parseInt(request.getParameter("uid"));
String officer = (String) request.getParameter("officer");
String reason = (String) request.getParameter("reason");
String date = request.getParameter("date");


int i = ServicesDTO.appointmentSubmit(uid, officer, reason, date);
if(i>0){
	response.sendRedirect("userMunicipalityAppointment.jsp?message=AppointmentSuccess");
}else{
	response.sendRedirect("userMunicipalityAppointment.jsp?message=AppointmentFailed");
}
%>

</body>
</html>