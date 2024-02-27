<%@page import="smartMukkam.com.shop.ShopDAO"%>
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
Integer uid = Integer.parseInt(request.getParameter("uid"));
Integer sid = Integer.parseInt(request.getParameter("sid"));
Integer pid = Integer.parseInt(request.getParameter("pid"));
String comment = (String) request.getParameter("comment");

 int i = ShopDAO.postReviewFromUser(sid, uid, pid, comment);
 if(i>0){
	 response.sendRedirect("userProductReview.jsp?sid="+sid+"&pid="+pid+"&message=success");
 }else{
	 response.sendRedirect("userProductReview.jsp?sid="+sid+"&pid="+pid+"&message=failed");
 }

%>

</body>
</html>