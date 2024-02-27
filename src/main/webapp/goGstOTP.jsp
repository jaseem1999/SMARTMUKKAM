<%@page import="smartMukkam.main.otp.OtpGenerate"%>
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

    int i = OtpGenerate.sendToEmailOTP(email, request, response, session);

   
    %>
<p><%=email %></p>

</body>
</html>