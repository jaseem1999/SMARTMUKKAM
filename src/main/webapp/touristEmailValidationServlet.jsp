<%@page import="smartMukkam.com.tourist.TouristDAO"%>
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
int i = TouristDAO.emailValidate(email);
if(i>0){
	
	response.sendRedirect("touristValidateEmail.jsp?message=wait");
}else{
	session.setAttribute("touristEmail", email);
	response.sendRedirect("touristSignup.jsp");
}
%>
</body>
</html>