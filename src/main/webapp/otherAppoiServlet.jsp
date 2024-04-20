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
// Initialize variables
Integer tid = 0;
String officer = "";
int i = 0;

// Parse the tid parameter
try {
    tid = Integer.parseInt(request.getParameter("tid"));
} catch (NumberFormatException e) {
    // Handle the NumberFormatException gracefully
    out.println("Error: Invalid tid parameter");
}

// Retrieve the officer parameter
officer = request.getParameter("officer");

// Update the officer appointment
i = ServicesDTO.updateOfficerAppointment(tid, officer);

if(i>0){
	response.sendRedirect("municipalityAppointment.jsp");
}else{
response.sendRedirect("municipalityAppointment.jsp");
}

%>
</body>
</html>
