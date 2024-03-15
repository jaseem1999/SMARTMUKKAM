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
Integer hoid = Integer.parseInt(request.getParameter("id"));
int i = ServiceDAO.updateRejectRegistration(hoid);

%>
</body>
</html>