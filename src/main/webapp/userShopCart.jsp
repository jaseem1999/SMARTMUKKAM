<%@page import="smartMukkam.com.shop.AdvertisementDTO"%>
<%@page import="smartMukkam.com.shop.ShopDTO"%>
<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.ProductDTO"%>
<%@page import="java.util.List"%>
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
String message = request.getParameter("message");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
Integer tid = Integer.parseInt(request.getParameter("pid"));
String shopType = (String) request.getParameter("typeShop");
Integer sid = Integer.parseInt(request.getParameter("sid"));
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
     #adsBox{
		height: 700px;
	}
	.w-100{
		height: 400px;
		width: 300px;
	}
	.pName{
		text-align: center;
    	font-size: 25px;
    	font-weight: 900;
    	color: cyan;
    	margin: 10px;
	}
	.cName{
		position: relative;
    	font-size: 15px;
    	margin-right: 30px;
    	left: 70%;
    	color: #6c757d;
    	font-style: italic;
	}
	.priceName{
		position: relative;
    	font-size: 60px;
    	margin-right: 30px;
    	left: 10%;
    	color: #4cc600;
    	margin-top: -64px;
	}
	.oName{
		position: relative;
	    font-size: 30px;
	    margin-right: 30px;
	    left: 43%;
	    color: #ff1616;
	    margin-top: -36px;
	}
     
     </style>
<title>Shop(<%=sid %>)</title>
</head>
<body>
<%
List<ShopDTO> shop = ShopDAO.getAllShopsBasedSid(sid);
	
for(ShopDTO s : shop){
shopType = s.getShopType();
%>
<nav class="navbar bg-body-tertiary">

    <a class="navbar-brand" href="userShops.jsp?id=<%=sid%>">
      <img src="shopImage?id=<%=sid %>" alt="Bootstrap" width="30" height="24">
      <span class="availability-status online"></span>
    </a>
    <div style="text-align: center; text-transform: uppercase;font-weight: 700; font-size: larger;"><%=s.getShopName() %></div>
    <ul  class="nav justify-content-end">
    	
    	<li class="nav-item">
		    <a class="nav-link" style="color: red;" href="useLogout.jsp?sid=<%=uid%>">Logout</a>
		 </li>
    </ul>
    
    

</nav>
<%} %>

<div class="container" style="margin-top: 30px;">
	<div class="row">
		<%
		List<ProductDTO> product = ShopDAO.getProductBasedOnProductId(tid);
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
			<div class="list" style="color: blue;"><a href="userProductReview.jsp?sid=<%=p.getSid()%>&pid=<%=p.getTid()%>"><i class="fa fa-star" aria-hidden="true"></i> review</a></div>
			
			<div style="margin-top: 10px;">
				<%=p.getProduct() %>
			</div>
			
		</div>
		<%} %>
		
	</div>
	<hr style="border-top: 2px solid ;">
	<div class="row" style="margin-top: 10px;">
	<%
	if(message != null && message.equals("minimuFive")){
		out.print("<div class='alert alert-danger' role='alert'>Sorry its wholesale market so you minimum buy 5 items!</div>");
	}else{
		
	}
	%>
	
		<div class="col">
		<form id="form-1" action="userShopCartAddServlet.jsp" method="get">
			<input value="<%=uid %>" type="hidden" class="form-control" id="uid" name="uid">
		    <input value="<%=tid %>" type="hidden" class="form-control" id="tid" name="tid">
		    <input value="<%=sid %>" type="hidden" class="form-control" id="sid" name="sid">

			<div class="mb-3">
                <label for="shop" class="form-label">Type of shop</label>
                <select class="form-select" id="shop" name="shop">
			<%
			if(shopType.equals("wholesale")){
				out.print("<option value='wholesale' selected>wholesale shop</option>");
			}else{
				out.print("<option value='retail' selected>Retail shop</option>");
			}
			%>
			 	</select>
            </div>
            <div class="mb-3">
            
            <%
            if(shopType.equals("wholesale")){
            	out.print("<label for='Quantity' class='form-label'>Quantity minimum 5</label>");
            	out.print("<input type='number' class='form-control' id='Quantity' aria-describedby='Quantity' name='Quantity' placeholder='Enter quantity' value='5'>");
            }else{
            	out.print("<label for='Quantity' class='form-label'>Quantity</label>");
            	out.print("<input type='number' class='form-control' id='Quantity' name='Quantity' aria-describedby='Quantity' placeholder='Enter quantity' value='1'>");
            }
            
            %>
            </div>
            <button type="submit" class="btn btn-primary">Buy</button>
           </form>
		</div>
		<div class="col">
			<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <% 
        List<AdvertisementDTO> pro = ShopDAO.getAllAdsBaseSid(sid);
        for (int i = 0; i < pro.size(); i++) {
        %>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<%=i%>" <%= i == 0 ? "class='active'" : "" %> aria-label="Slide <%=i+1%>"></button>
        <% } %>
    </div>
    
    <div class="carousel-inner">
        <% 
        for (int i = 0; i < pro.size(); i++) {
            AdvertisementDTO ads = pro.get(i);
        %>
            <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                <img src="imAds?id=<%=ads.getTid()%>" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h5 style="color: white;"><%=ads.getProduct() %></h5>
                    <p style="color: white;"><%=ads.getDescription() %></p>
                    <p style="color: red"><%=ads.getPrice() %></p>
                   
                     <p style="color: Green; font-size: 30px; font-weight: bolder;"> Now : <%=ads.getPrice() - ads.getDicscount() %></p>
                    <a href="<%=ads.getLink() %>" class="btn btn-outline-danger">Go To check</a>
                </div>
            </div>
        <% } %>
    </div>
    
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
				
		</div>
		</div>
	
	</div>
	<hr>


<!-- Template Javascript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>