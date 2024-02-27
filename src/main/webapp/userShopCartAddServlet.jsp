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
// Assuming uid, sid, and tid are set as request parameters
String uid = request.getParameter("uid");
String sid = request.getParameter("sid");
String tid = request.getParameter("tid");

int userId = 0;
int shopId = 0;
int productId = 0;
int quantity = 0;

try {
    // Convert strings to integers
    userId = Integer.parseInt(uid);
    shopId = Integer.parseInt(sid);
    productId = Integer.parseInt(tid);
    String shop = (String) request.getParameter("shop");

    // Get the quantity from the request
    quantity = Integer.parseInt(request.getParameter("Quantity"));
    if(quantity < 1){
    	quantity = 1;
    }
    if(quantity < 5 && shop.equals("wholesale")){
    	response.sendRedirect("userShopCart.jsp?sid="+productId+"&typeShop="+shop+"&message=minimuFive");
    }else{
		    int i = ShopDAO.updateCart(userId, shopId, productId, quantity);
		    if(i>0){
		    	response.sendRedirect("userShops.jsp?id="+shopId+"&message=cartAddeddSuccess");
		    }else{
		    	response.sendRedirect("userShops.jsp?id="+shopId+"&message=cartAddeddFailed");
		    }
    }

    // Now, userId, shopId, productId, and quantity are integers that you can use in your code.
    // ...

} catch (NumberFormatException e) {
    // Handle the case where the conversion fails (e.g., non-numeric strings)
    System.err.println("Error converting strings to integers: " + e.getMessage());
}
%>

</body>
</html>