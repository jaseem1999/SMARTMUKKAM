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
String email = request.getParameter("email");
String pass = request.getParameter("pass");
String copass = request.getParameter("copass");
if(pass.equals(copass)){
	int i = UserDAO.userResetPassword(email, pass);
	if(i > 0){
		response.sendRedirect("index.jsp?message=resetDone");
	}else{
		response.sendRedirect("index.jsp?message=resetFailed");
	}
}else{
	response.sendRedirect("userResetPass.jsp?message=notSame");
}
%>

</body>
</html>