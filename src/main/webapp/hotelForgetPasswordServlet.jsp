<%@page import="smartMukkam.com.hotel.HotelDAO"%>
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
String email = request.getParameter("email");
int i = HotelDAO.passWordChange(email);
if(i>0){
	response.sendRedirect("index.jsp?message=waitForAdmin");
}else{
	response.sendRedirect("index.jsp?message=failedChangePassword");
}
%>
</body>
</html>