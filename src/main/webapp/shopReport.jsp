<%@page import="smartMukkam.com.shop.ShopDAO"%>
<%@page import="smartMukkam.com.shop.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.municipality.login.MunicipalityAdminDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="fontawesome-free-6.5.1-web/css/fontawesome.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/brands.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/solid.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
<link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%
Integer sid = (Integer) session.getAttribute("sid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("shopemail");
Long phone = (Long) session.getAttribute("phone");
String shopType = (String) session.getAttribute("shopType");
String status = (String) session.getAttribute("status");
String shopName = (String) session.getAttribute("shopName");
String addressOne = (String) session.getAttribute("addressOne");
String addressTwo = (String) session.getAttribute("addressTwo");
String city = (String) session.getAttribute("city");
String state = (String) session.getAttribute("state");

if(shopType == null){
	response.sendRedirect("index.jsp?message=unautherizedAccess");
}

%>

<title><%=shopName %></title>
<style type="text/css">
		
		.profile-image {
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 23%;
		}
		.homeFull{
		 	max-width: 1070px;
		 	height: auto;
		 	border: 1px solid white;
		 	box-shadow: 3px 3px 3px 5px rgba(0, 0, 0, 0.5);
		}
		.home{
			width: 100%;
			height: 60px;
			background: #353f5a;
			color: white;
		}
		.home span{
			margin: 10px;
		    color: black;
		    font-size: medium;
		    font-weight: 600;
		}
		.tooltip {
		  visibility: hidden;
		  background-color: #333;
		  color: #fff;
		  text-align: center;
		  padding: 5px;
		  border-radius: 5px;
		  position: absolute;
		  z-index: 100;
		  opacity: 0;
		  transition: opacity 0.3s;
		}
		
		.nav-item:hover .tooltip {
		  visibility: visible;
		  opacity: 1;
		}
		.availability-status.online {
			<%
			String munAdminActive = MunicipalityAdminDAO.getActive();
			if(munAdminActive.equals("active")){
				out.print("background: #1bcfb4;");
			}else{
				out.print("background: black;");  
			}
			%>
		    position: absolute;
		    width: 12px;
		    height: 12px;
		    border-radius: 57%;
		    border: 2px solid #ffffff;
		    margin-left: -5px;
  			  margin-top: 29px;
		}
		
	</style>
</head>
<body>
<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="shopImage?id=<%=sid %>" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
      <span style="margin-left: 10px;"><%=shopName %></span>
    </a>
  
  <ul class="nav justify-content-end">
  			<li class="nav-item">
		       <img alt="" src="images/kerala-govt-logo.png" class="profile-image">
				<span class="tooltip">
					<%
						      
					  if(munAdminActive.equals("active")){
						   out.print("Municipality Admin is online");
					  }else{
						    out.print("Municipality Admin is offline");  
						}
				      %>
				</span>
			      <span class="availability-status online"></span>
			</li> 
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="shopHome.jsp">home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" style="color: red;" href="shopLogout.jsp?sid=<%=sid%>">Logout</a>
		  </li>	 
		  
	</ul>
	
</div>
</nav>
	<div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
            	<img src="shopImage?id=<%=sid %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #353f5a;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%= sid %></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= name %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= email %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= phone %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= shopType %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= status %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%= shopName %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= addressOne %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= addressTwo %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= city %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= state %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
            </nav>
        </div>
    </div>
<div class="container-fluid" style="margin-top: 50px;" >
	<div class="row">
    <div class="col-sm-2">
			<ul class="list-group list-group-flush" style="">
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAddproduct.jsp"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add product</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopOrder.jsp"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> Orders</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopAdvertisement.jsp"><i class="fa fa-film" aria-hidden="true"></i> Advertisement</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopHome.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopGallery"><i class="fa fa-camera" aria-hidden="true"></i> Gallery</a>
			  	</li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopProductReview.jsp"><i class="fa fa-comments" aria-hidden="true"></i> Review</a>
			  </li>
			  <li class="list-group-item">
			  	<a class="nav-link" href="shopFeedback.jsp"><i class="fa fa-paper-plane" aria-hidden="true"></i> Feedback</a>
			  </li>
			  
			  <li class="list-group-item">
			  	<p class="nav-link" style="color: red;" >It's Administration panel for shops</p>
			  </li>
			</ul>
			    	
    </div>
    <div class="col-sm-10" >
    	<div class="homeFull" style="margin: 50px; max-height: 500px; overflow: auto;">
    <div class="home">
        <span style="color: white;">Report</span>
        <button type="button" id="printButton" class="btn btn-outline-info">Print report</button>
    </div>
    <table class="table table-hover" id="reportTable">
        <thead>
            <tr>
                <th scope="col">*</th>
                <th scope="col">Product name</th>
                <th scope="col">Delivered</th>
                <th scope="col">Delivery</th>
                <th scope="col">Accepted</th>
                <th scope="col">Reject</th>
                <th scope="col">Processing</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Integer sids = (Integer) session.getAttribute("sid");
            List<CartDTO> cart = ShopDAO.getAllCart(sids);
            for(CartDTO c : cart) {
            %>
            <tr>
                <th scope="row"><img alt="" src="pImage?id=<%=c.getPid()%>" style="width: 50px; height: 50px;"></th>
                <td><%=ShopDAO.getProduct(c.getPid()) %></td>
                <td>
                    <% if(c.getStatus() != null && c.getStatus().equals("delivered")) { %>
                    <%=ShopDAO.getProductPrice(c.getPid()) %>
                    <% }else if(c.getStatus() == null){ 
                    out.print("");
                    }else{
                    out.print("");
                    }
                    %>
                </td>
                <td>
                    <% if(c.getStatus() != null && c.getStatus().equals("delivery")) { %>
                    <%=ShopDAO.getProductPrice(c.getPid()) %>
                    <% }else if(c.getStatus() == null){
                    out.print("");
                    }else{
                    out.print("");
                    }
                    %>
                </td>
                <td>
                    <% if(c.getStatus() != null && c.getStatus().equals("accept")) { %>
                    <%=ShopDAO.getProductPrice(c.getPid()) %>
                    <% }else if(c.getStatus() == null){
                    out.print("");
                    }else{
                    out.print("");
                    }
                    %>
                </td>
                <td>
                    <% if(c.getStatus() != null && c.getStatus().equals("reject")) { %>
                    <%=ShopDAO.getProductPrice(c.getPid()) %>
                    <% }else if(c.getStatus() == null){
                    out.print("");
                    }else{
                    out.print("");
                    }
                    %>
                </td>
                <td>
                    <% if(c.getStatus() != null && c.getStatus().equals("delivered")) { 
                    out.print("");
                    }else if(c.getStatus() == null){
                    out.print(ShopDAO.getProductPrice(c.getPid()));
                    }else{
                    out.print("");
                    }
                    %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
    	
    </div>
    </div>
   </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
document.getElementById('printButton').addEventListener('click', function() {
    var table = document.getElementById('reportTable');
    var newWin = window.open('', 'Print-Window');
    newWin.document.open();
    newWin.document.write('<html><head><title>Print Table Report</title></head><body>' + table.outerHTML + '</body></html>');
    newWin.document.close();
    newWin.print();
});
</script>


</body>
</html>