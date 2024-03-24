<%@page import="smartMukkam.main.user.userData.UserDAO"%>
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
Integer uid = (Integer) session.getAttribute("uid");
int i = UserDAO.logoutActive(uid);
if(i>0){
	session.invalidate();
	response.sendRedirect("index.jsp?message=userLogoutSuccess");
}else{
	response.sendRedirect("index.jsp");
}
%>
</body>
</html>