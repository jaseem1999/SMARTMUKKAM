<%@page import="smartMukkam.com.shop.ShopDTO"%>
<%@page import="smartMukkam.com.shop.ReviewDTO"%>
<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>review</title>
<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");
String message = request.getParameter("message");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
Integer tid = Integer.parseInt(request.getParameter("sid"));
Integer pid = Integer.parseInt(request.getParameter("pid"));

int sid =0;
%>
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
			String shopActive = ShopDAO.getShopOnline(tid);
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
List<ShopDTO> shop = ShopDAO.getAllShopsBasedSid(tid);
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
		    <a class="nav-link" href="userViewCart.jsp?id=<%=tid %>">Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
		 </li>
    	<li class="nav-item">
		    <a class="nav-link" style="color: red;" href="useLogout.jsp?sid=<%=uid%>">Logout</a>
		 </li>
    </ul>
    
    

</nav>
<div class="container-xxl position-relative nav-bar p-0">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5" style="width: 100%;">
	<img src="shopImage?id=<%=tid %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
	
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
 

<div class="container" style="margin-top: 30px;">
	<div class="row">
		<%
		List<ProductDTO> product = ShopDAO.getProductBasedOnProductIdAndSID(tid, pid);
		for(ProductDTO p : product){
			sid = p.getSid();
		%>
		<div class="col" style="margin-top: 100px; ">
			<img alt="" src="pImage?id=<%=p.getTid()%>" style="width: 500px;">
		</div>
		<div class="col">
			<div style="font-size: 30px; font-weight: bolder;">
				<%=p.getDescription() %>
			</div>
			<hr style="border-top: 2px solid ;">
			<div style="margin-top: 10px;">
				<span style="color: red; font-size: 23px;">-<%=p.getDiscount() %></span><span style="margin-left: 30px; font-size: 35px; color: green;"><%=p.getPrice() - p.getDiscount() %></span>
			</div>
			<div style="margin-top: 5px;">
				MRP <span style="text-decoration: line-through; color: blue;"><%=p.getPrice() %></span>
			</div>
			<div class="list" style="color: blue;"><a href=""><i class="fa fa-star" aria-hidden="true"></i>rating</a><span style="margin-left:10px; color: blue;">10</span></div>
			
			<div style="margin-top: 10px;">
				<%=p.getProduct() %>
			</div>
			
		</div>
		<%} %>
		
		
		
	</div>
	<hr style="border-top: 2px solid ;">
<form action="userProductReviewServlet.jsp" method="get" onsubmit="return validateForm()">
    <input type="hidden" value="<%=uid %>" class="form-control" id="uid" name="uid" aria-describedby="commentHelp">
    <input type="hidden" value="<%=tid %>" class="form-control" id="sid" name="sid" aria-describedby="commentHelp">
    <input type="hidden" value="<%=pid %>" class="form-control" id="pid" name="pid" aria-describedby="commentHelp">
    <div class="mb-3">
        <label for="comment" class="form-label">Review</label>
        <input type="text" class="form-control" id="comment" name="comment" aria-describedby="commentHelp" placeholder="Add review">
    </div>
    <button type="submit" class="btn btn-primary">Review</button>
</form>

	
	<ul class="list-group" style="margin-top: 20px">
	<%
	List<ReviewDTO> review = ShopDAO.getReviewBasedSidPid(tid, pid);
	for(ReviewDTO r : review){
	%>
	  <li class="list-group-item">
	  	<div class="row">
	  		<div class="col-2"><img alt="" src="userPhoto?id=<%=r.getUid()%>" style="width: 50px;height: 50px; border-radius: 50%;">
	  		<%
	  		int i = ShopDAO.getVerifyCustomer(r.getPid(), r.getUid());
	  		if(i>0){
	  			out.print("<i class='fa fa-certificate' aria-hidden='true' style='margin-left: -8px; color: green;'></i><span style='color: green;'>verified</span>");
	  		}else{
	  			out.print("<i class='fa fa-certificate' aria-hidden='true' style='margin-left: -8px; color: red;'></i><span style='color: red;'>not verified</span>");
	  		}
	  		%>
	  		</div>
	  		<div class="col-10"><%=r.getReview() %></div>
	  	</div>
	  	<hr>
	  	<div class="row">
	  		<div class="col-11" style="text-align: right;"><span style=""><%
	  		if(r.getComment() != null){
	  			out.print(r.getComment());
	  		}else{
	  			out.print("");
	  		}
	  		%></span></div>
	  		<div class="col-1"><img alt="" src="shopImage?id=<%=r.getSid()%>" style="width: 50px;height: 50px; border-radius: 50%;"></div>
	  	</div>
	  </li>
	  <hr>
	  <%} %>
	  
	</ul>
		
</div>

<!-- Template Javascript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
function validateForm() {
    var comment = document.getElementById("comment").value.trim();

    if (comment === null || comment === "") {
        alert("Please enter a review.");
        return false;
    }

    return true;
}

</script>

</body>
</html>