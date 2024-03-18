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
Integer tid = Integer.parseInt(request.getParameter("tid"));
int i = ServiceDAO.deleteGallaryTaxi(tid);
if(i>0){
	response.sendRedirect("hotelGallery.jsp?message=DeleteSuccess");
}else{
	response.sendRedirect("hotelGallery.jsp?message=DeleteFailed");
}

%>
</body>
</html>