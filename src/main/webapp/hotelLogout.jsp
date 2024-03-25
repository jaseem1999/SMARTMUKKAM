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
Integer hoid = Integer.parseInt(request.getParameter("hoid"));
int i = HotelDAO.logout(hoid);
if(i > 0){
	session.invalidate();
	response.sendRedirect("index.jsp?message=userLogoutSuccess");
}else{
	response.sendRedirect("hotelHome.jsp?message=LogoutFailed");	
}

%>
</body>
</html>