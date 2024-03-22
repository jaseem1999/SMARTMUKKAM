<%@page import="smartMukkam.com.hotel.ServiceDAO"%>
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
Integer hoid = Integer.parseInt(request.getParameter("hoid"));
Integer roid = Integer.parseInt(request.getParameter("roid"));
Integer roomSlot = Integer.parseInt(request.getParameter("roomSlot"));

if(roomSlot <= (ServiceDAO.getRoomAvailable(roid)- ServiceDAO.getCartRoomNoOfRoom(roid) )){
	int i = ServiceDAO.insertRoomCart(uid, hoid, roid, roomSlot);
	if(i>0){
		response.sendRedirect("room.jsp?hoid="+hoid+"&message=cartAddSuccess");
	}else{
		response.sendRedirect("room.jsp?hoid="+hoid+"&message=cartAddFailed");
	}
}else{
	response.sendRedirect("room.jsp?hoid="+hoid+"&message=notAvailable");
}

%>

</body>
</html>