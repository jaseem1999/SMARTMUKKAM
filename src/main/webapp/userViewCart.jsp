<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.com.shop.CartDTO"%>
<%@page import="smartMukkam.com.shop.ShopDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
Integer sid = Integer.parseInt(request.getParameter("id"));
%>

<title>Cart</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 
	 <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
     <link href="css/style.css" rel="stylesheet">
<style type="text/css">
.list-group-item{
 	background: transparent;
    color: #494545;
    border: 0px;
}
.product { text-align: center; }

.unlist { list-style-type: none; padding: 0; }

.list { margin-bottom: 10px; }

.mrp{ 
	color: #648bd9; 
	font-weight: bold;
 }
 

.discount 
{ 
	text-decoration: line-through;
	color: #999;
}
.finalprice{
	color: #fd2727;
    font-size: xx-large;
    font-weight: bolder;
}
.save { color: #008000; font-weight: bold; }

.laptop-image { display: block; margin: 0 auto; width: 100%; height: auto; }

.list-group-item{
	width: 300px;
}

.tooltip {
		  visibility: hidden;
		  background-color: #333;
		  color: #fff;
		  text-align: center;
		  padding: 5px;
		  border-radius: 5px;
		  position: absolute;
		  z-index: 1;
		  opacity: 0;
		  transition: opacity 0.3s;
		}
		
		.nav-item:hover .tooltip {
		  visibility: visible;
		  opacity: 1;
		}
		.availability-status.online {
			<%
			String shopActive = ShopDAO.getShopOnline(sid);
			if(shopActive.equals("active")){
				out.print("background: #1bcfb4;");
			}else{
				out.print("background: black;");  
			}
			%>
		    position: absolute;
		    width: 10px;
		    height: 10px;
		    border-radius: 57%;
		    border: 2px solid #ffffff;
		   	margin-left: -5px;
  			  margin-top: 12px;
		}

</style>

</head>
<body>
 <%
List<ShopDTO> shop = ShopDAO.getAllShopsBasedSid(sid);
 String shopType =null;
for(ShopDTO s : shop){
shopType = s.getShopType();
%>
<nav class="navbar bg-body-tertiary">

    <a class="navbar-brand" href="userShops.jsp?id=<%=sid%>">
      <img src="shopImage?id=<%=s.getSid() %>" alt="Bootstrap" width="30" height="24">
      <span class="availability-status online"></span>
    </a>
    <div style="text-align: center; text-transform: uppercase;font-weight: 700; font-size: larger;"><%=s.getShopName() %></div>
    <ul  class="nav justify-content-end">
    	
    	<li class="nav-item">
		    <a class="nav-link" style="color: red;" href="useLogout.jsp?sid=<%=uid%>">Logout</a>
		 </li>
    </ul>
    
    

</nav>
<div class="container-xxl position-relative nav-bar p-0">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5" style="width: 100%;">
	<img src="shopImage?id=<%=sid %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
	
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #353f5a;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%=s.getSid()%></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= s.getName() %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= s.getEmail() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= s.getPhone() %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= s.getShopType() %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= s.getStatus() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%=s.getShopName() %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= s.getAddressOne()%></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= s.getAddressTwo() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= s.getCity() %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= s.getState()%></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
			</nav>
		</div>

<%} %>
<div class="container">

	<nav class="navbar justify-content-center align-items-center" style="background: #ffffff;margin-top: -14px;box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5); z-index: 100;">
	 	<div class="row " style="color: white;">
	 		<div class="col mx-auto">
				<ul class="list-group" style="border: 0px;">
				  <li class="list-group-item"><img alt='' id='profileImage' src='userPhoto?id=<%=uid %>' style='margin-right: 10px; margin-bottom: 5px; width: 75px; border-radius: 50%; height: 75px;border: 1px solid white;'/></li>
				  <li class="list-group-item"></li>
				 
				</ul>	 		
	 		</div>
	 		<div class="col mx-auto">
	 			<ul class="list-group">
				  <li class="list-group-item"><i class="fa fa-user" aria-hidden="true"></i> <%=name %></li>
				  <li class="list-group-item"><i class='fa fa-envelope mr-2'></i> <%=email %></li>
				</ul>
	 		</div>
	 		<div class="col mx-auto">
	 			<ul class="list-group">
				  <li class="list-group-item"><i class='fa fa-phone-alt mr-2'></i> <%=number %></li>
				  <li class="list-group-item"><i class=' fa fa-globe mr-2'></i> <img alt="" style="width: 30px" src="w2560/<%=country %>.png"></li>
				</ul>
	 		</div>
	 	</div>
	</nav>
	
</div>
<div class="container">

			<table class="table table-striped table-hover" style="margin-top: 20px;">
  					<thead>
					    <tr>
					      <th scope="col">User</th>
					      <th scope="col">Product</th>
					      <th scope="col">Image</th>
					      <th scope="col">Quantity</th>
					      <th scope="col">Price</th>
					      <th scope="col">Address one</th>
					      <th scope="col">Address two</th>
					      <th scope="col">City</th>
					      <th scope="col">State</th>
					      <th scope="col">PIN</th>
					      <th scope="col">Date of booking</th>
					      <th scope="col">status</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					    <%
					    
					    List<CartDTO> cart = ShopDAO.getAllCartwithUid(sid, uid);
					    for(CartDTO c : cart){
					    %>
					      <th><img alt="" style="width: 40px; border: 1px solid; border-radius: 50%" src="userPhoto?id=<%=c.getUid()%>"></th>
					      <td><%=ShopDAO.getProduct(c.getPid())%></td>
					      <td><img alt="" src="pImage?id=<%=c.getPid()%>" style="width: 50px; height: 50px;"></td>
					      <td><%=c.getQ() %></td>
					      <td><%= (c.getQ() * (Double.parseDouble(ShopDAO.getProductPrice(c.getPid())) - Double.parseDouble(ShopDAO.getProductDiscount(c.getPid())))) %></td>
					      <td><%=UserDAO.getUserAddressOne(c.getUid()) %></td>
					      <td><%=UserDAO.getUserAddressTWO(c.getUid()) %></td>
					      <td><%=UserDAO.getUserCity(c.getUid()) %></td>
					      <td><%=UserDAO.getUserState(c.getUid()) %></td>
					      <td><%=UserDAO.getUserPIN(c.getUid()) %></td>
					      <td><%=c.getDate() %></td>
					      <td>
					      <%
					     	 if(c.getStatus() == null){
				                out.print("<span  style='color : blue;'>Proccessing</span>");
				            } else if(c.getStatus().equals("accept")){
				                out.print("<span  style='color : green;'>Accept</span>");
				            }else if(c.getStatus().equals("delivery")){
				                out.print("<span  style='color : green;'>Delivery</span>");
				            }
				            else if(c.getStatus().equals("delivered")){
				                out.print("<span  style='color : green;'>delivered</span>");
				            }else if(c.getStatus().equals("reject")){
				                out.print("<span  style='color : red;'>Reject</span>");
				            }
				            else{
				            	out.print("<span  style='color : red;'></span>");
				            }
					      %>
					      </td>
					      
					    </tr>
					    <%} %>
					  </tbody>
				</table>
</div>

</body>
</html>