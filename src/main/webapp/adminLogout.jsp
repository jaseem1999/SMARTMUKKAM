<%@page import="smartMukkam.com.admin.AdminDAO"%>
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
int i = AdminDAO.logoutActive(1);
if(i>0){
	session.invalidate();
	response.sendRedirect("index.jsp");
}else{
	response.sendRedirect("adminHome.jsp?message=logoutFailed");
}
%>
</body>
</html>