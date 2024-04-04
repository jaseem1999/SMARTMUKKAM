<%@page import="smartMukkam.main.otp.UserPassForgetOTP"%>
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

String mail = UserDAO.getUserEmailForValidation(email);
if(email.equals(mail)){
	int i = UserPassForgetOTP.sendToEmailOTP(email, request, response, session);
}else{
	response.sendRedirect("userForgetPassword.jsp?message=failed");
}
%>
</body>
</html>