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
Integer foid = Integer.parseInt(request.getParameter("foid"));
Integer quantity = Integer.parseInt(request.getParameter("quantity"));

if(quantity <= (ServiceDAO.getFoodQuandity(foid) - ServiceDAO.getCartFoodQuandity(foid)) ){
	int i = ServiceDAO.updatefoodCart(uid, hoid, foid, quantity);
	if(i>0){
		response.sendRedirect("userHotelPages.jsp?id="+hoid+"&message=foodCartSuccess");
	}else{
		response.sendRedirect("userHotelPages.jsp?id="+hoid+"&message=foodCartFailed");
	}
}else{
	response.sendRedirect("userHotelPages.jsp?id="+hoid+"&message=quantityFull");
}

%>

</body>
</html>