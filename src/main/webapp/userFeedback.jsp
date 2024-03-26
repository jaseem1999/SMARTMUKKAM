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
Integer uid = Integer.parseInt(request.getParameter("uid"));
String message = request.getParameter("feedback");
int i = ServicesDAO.insertUserFeedback(uid, message);
if(i>0){
	response.sendRedirect("index.jsp?message=feedbackSuccess");
}else{
	response.sendRedirect("index.jsp?message=feedbackFailed");
}
%>
</body>
</html>