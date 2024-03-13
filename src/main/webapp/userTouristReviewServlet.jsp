<%@page import="smartMukkam.com.tourist.TouristDAO"%>
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
Integer toid = Integer.parseInt(request.getParameter("toid"));
Integer ticketId = Integer.parseInt(request.getParameter("ticketId"));
String comment = (String) request.getParameter("comment");
int i = TouristDAO.postReviewFromUser(toid, uid, ticketId, comment);

if(i>0){
	response.sendRedirect("userTouristPlaceReview.jsp?toid="+toid+"&ticketId="+ticketId+"&message=success");
}else{
	response.sendRedirect("userTouristPlaceReview.jsp?toid="+toid+"&ticketId="+ticketId+"&message=failed");
}


%>
</body>
</html>