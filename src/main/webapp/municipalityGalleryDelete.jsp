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
Integer tid = Integer.parseInt(request.getParameter("tid"));

int i = ServicesDTO.deleteGellary(tid);

if(i>0){
	response.sendRedirect("municipalityGallery.jsp?message=successDelete");
}else{
	response.sendRedirect("municipalityGallery.jsp?message=failedDelete");
}

%>
</body>
</html>