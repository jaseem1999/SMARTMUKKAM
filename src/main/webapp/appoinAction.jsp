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
Integer tid = Integer.parseInt(request.getParameter("tid"));
String action = request.getParameter("action");
int i = ServicesDTO.actionAppointment(tid, action);
if(i>0){
	response.sendRedirect("municipalityAppointment.jsp");
}else{
	response.sendRedirect("municipalityAppointment.jsp?message=actionFailed");
}
%>

</body>
</html>