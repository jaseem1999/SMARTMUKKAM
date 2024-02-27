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
Integer tid = Integer.parseInt(request.getParameter("tid"));
String comment = (String) request.getParameter("comment");
int i = ShopDAO.updateProductReviewComment(tid,comment);
%>
</body>
</html>