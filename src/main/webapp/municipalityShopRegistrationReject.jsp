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
<%Integer sid = Integer.parseInt(request.getParameter("id")); 
int i = ServicesDTO.shopRegistrationReject(sid);

%>

</body>
</html>