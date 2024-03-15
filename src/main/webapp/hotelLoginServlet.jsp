<%@page import="smartMukkam.com.hotel.HotelDTO"%>
<%@page import="java.util.List"%>
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
String email = (String) request.getParameter("email");
String pass = (String) request.getParameter("pass");

int i = HotelDAO.login(email, pass);

if( i == 2){
	List<HotelDTO> hotel = HotelDAO.getAllHotelDetailsForLogin(email);
	
	for(HotelDTO h : hotel){
		session.setAttribute("hoid", h.getHotelId());
		session.setAttribute("owner", h.getOwnerName());
		session.setAttribute("hotel", h.getHotelName());
		session.setAttribute("hotelEmail", h.getEmail());
	}
	
	response.sendRedirect("hotelHome.jsp");
}else if( i == 1){
	response.sendRedirect("index.jsp?message=wait");
}else{
	response.sendRedirect("index.jsp?message=LoginFailed");
}

%>

</body>
</html>