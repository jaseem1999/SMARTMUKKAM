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
Integer sid = Integer.parseInt(request.getParameter("sid"));
String feedback = request.getParameter("feedback");
int i = ServicesDAO.insertShopFeedback(sid, feedback);
if(i>0){
	response.sendRedirect("shopFeedback.jsp?message=feedbackSuccess");
}else{
	response.sendRedirect("shopFeedback.jsp?message=feedbackFailed");	
}
%>

</body>
</html>