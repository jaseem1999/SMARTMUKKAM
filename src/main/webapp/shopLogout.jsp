<%@page import="smartMukkam.com.shop.ShopDAO"%>
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
int i = ShopDAO.shopLogout(sid);
session.invalidate();
response.sendRedirect("index.jsp?message=userLogoutSuccess");
%>
</body>
</html>