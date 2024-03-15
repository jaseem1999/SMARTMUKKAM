<%@page import="smartMukkam.com.hotel.HotelDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String email = (String) request.getParameter("email");
int i = HotelDAO.checkEmail(email);
if(i > 0){
	response.sendRedirect("hotelValidateEmail.jsp?message=wait");
}else{
	response.sendRedirect("hotelSignup.jsp?hotelEmail="+email);
}
%>

</body>
</html>