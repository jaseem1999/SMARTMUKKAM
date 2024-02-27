<%@page import="smartMukkam.com.municipality.ServicesDTO"%>
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
int i = ServicesDTO.getShopEmail(email);
if(i>0){
	response.sendRedirect("shopValidateEmail.jsp?message=wait");
}else{
	response.sendRedirect("ShopSignin.jsp");
}
%>
</body>
</html>