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
Integer tid = Integer.parseInt(request.getParameter("id"));

int i = TouristDAO.updateAcceptTourist(tid);



%>
</body>
</html>