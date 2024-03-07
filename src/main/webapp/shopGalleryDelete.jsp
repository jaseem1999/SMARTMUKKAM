<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
Integer tid = Integer.parseInt(request.getParameter("tid"));
int i = ShopDAO.updateGalleryDelete(tid);
if(i>0){
	response.sendRedirect("shopGallery.jsp?message=DeleteSuccess");
}else{
	response.sendRedirect("shopGallery.jsp?message=DeleteFailed");
}
%>
<%=tid %>
</body>
</html>