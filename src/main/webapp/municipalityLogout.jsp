<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
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
session.invalidate();
int i =  MunicipalityAdminDAO.updateInactiveMunicipalityAdmin();
if(i>0){
	response.sendRedirect("municipalityLogin.jsp?message=userLogoutSuccess");
}else{
	response.sendRedirect("municipalityLogin.jsp?message=userLogoutFailed");
}

%>
</body>
</html>