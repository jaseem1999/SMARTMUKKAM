<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
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
	Integer hoid = Integer.parseInt(request.getParameter("hoid"));
	Integer txoid = Integer.parseInt(request.getParameter("txoid"));
	Integer km = Integer.parseInt(request.getParameter("km"));
	
	int i = ServiceDAO.insertCarBooking(uid, hoid, txoid, km);
	
	if(i>0){
		response.sendRedirect("taxi.jsp?hoid="+hoid+"&message=sucessTaxiBooked");
	}else{
		response.sendRedirect("taxi.jsp?hoid="+hoid+"&message=failedTaxiBooked");
	}
%>

</body>
</html>