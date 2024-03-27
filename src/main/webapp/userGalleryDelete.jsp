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
Integer tid = Integer.parseInt(request.getParameter("tid"));
int i = UserDAO.deleteGallery(tid);
if(i>0){
	response.sendRedirect("userAddGallery.jsp");
}else{
	response.sendRedirect("userAddGallery.jsp");
}
%>
</body>
</html>