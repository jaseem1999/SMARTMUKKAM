<%@page import="smartMukkam.com.admin.ServicesDAO"%>
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
String feedback = request.getParameter("feedback");
int i = ServicesDAO.insertHotelFeedback(hoid, feedback);
if(i>0){
	response.sendRedirect("hotelFeedback.jsp?message=feedbackSuccess");
}else{
	response.sendRedirect("hotelFeedback.jsp?message=feedbackFailed");	
}

%>

</body>
</html>