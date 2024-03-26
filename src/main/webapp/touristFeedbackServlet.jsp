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
Integer toid = Integer.parseInt(request.getParameter("toid"));
String feedback = request.getParameter("feedback");
int i = ServicesDAO.insertTouristFeedback(toid, feedback);
if(i>0){
	response.sendRedirect("touristFeedback.jsp?message=feedbackSuccess");
}else{
	response.sendRedirect("touristFeedback.jsp?message=feedbackFailed");
}
%>

</body>
</html>