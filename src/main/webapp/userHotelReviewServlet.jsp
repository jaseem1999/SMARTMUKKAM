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
String review = request.getParameter("comment");

int i = ServiceDAO.insertReview(uid, hoid, review);
if(i>0){
	response.sendRedirect("userHotelReview.jsp?hoid="+hoid+"&meesage=success");
}else{
	response.sendRedirect("userHotelReview.jsp?hoid="+hoid+"&meesage=failed");
}

%>
</body>
</html>