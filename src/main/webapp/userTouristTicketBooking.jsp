
<%@page import="smartMukkam.com.tourist.TicketBookedDTO"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
<%@page import="smartMukkam.com.tourist.TouristDTO"%>
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

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}

Integer toid = Integer.parseInt(request.getParameter("toid"));
String alert = (String) request.getParameter("message");
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
     <%
     List<TouristDTO> tourists = TouristDAO.getAllTouristDetailsBasedToId(toid);
     for(TouristDTO t : tourists){
     %>
	<title><%=t.getTouristPlace() %></title>
	<%
	     }
	%>
	
	<style type="text/css">
	.nav-bar::before {
	    position: absolute;
	    content: "";
	    width: 100%;
	    height: 0%;
	    top: 0;
	    left: 0;
	    background: #FFFFFF;
    }
    
    .list-group-item{
 	background: transparent;
    color: #494545;
    border: 0px;
}

	
	</style>
</head>
<body>
<nav class="navbar " style="background: black;">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">
    <%
    String touristPlace = null;
    for(TouristDTO t : tourists){
   touristPlace = t.getTouristPlace();
    %>
      <img src="images/kerala-tourisum-logo.png" alt="Bootstrap" width="200" height="30">
    
    </a>
	<a style="color: white;" class="nav-link" href="">
		<%=t.getTouristPlace() %>
	</a>
	<%} %>
    
  
    <ul class="nav justify-content-end">
    	<li class="nav-item"><img src="userPhoto?id=<%=uid%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>
    	<li class="nav-item"><a class="nav-link" style="color: white;" href="userTouristTicketBooking.jsp?uid=<%=uid%>&toid=<%=toid%>">Your Tickets</a></li>
    	<li class="nav-item"><a class="nav-link" style="color: red;" href="useLogout.jsp">Logout</a></li>
    </ul>
    
  </div>
</nav>












<div class="container-xxl position-relative nav-bar p-0" style="z-index: 100;">
        
            <nav class="navbar navbar-expand-lg  navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5" style="width: 100%;">
            <%
    for(TouristDTO t : tourists){
    %>
	<img src="timg?id=<%=t.getTouristId() %>" alt="Logo" width="150" height="130" class="d-inline-block align-text-top">
	
                <div class="row" style="margin: auto; width: 100%; color: #f0eae4; height: 150px; background: #01040d9c;">
                	<div class="col" style="">
                		<p><i class="fa fa-id-badge" aria-hidden="true"></i> : <%=t.getTouristId()%></p>
						<p><i class="fa fa-user" aria-hidden="true"></i>  : <%= t.getName() %></p>
						<p><i class="fa fa-envelope" aria-hidden="true"></i>: <%= t.getEmail() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-phone" aria-hidden="true"></i>: <%= t.getPhone() %></p>
						<p><i class="fa fa-shopping-basket" aria-hidden="true"></i>: <%= t.getTouristPlace() %></p>
						<p><i class="fa fa-bell" aria-hidden="true"></i>: <%= t.getStatus() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-building" aria-hidden="true"></i>: <%=t.getTouristPlace() %></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> One : <%= t.getAddressOne()%></p>
						<p><i class="fa fa-address-card" aria-hidden="true"></i> Two: <%= t.getAddressTwo() %></p>
                	</div>
                	<div class="col">
                		<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= t.getCity() %></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: <%= t.getState()%></p>
						<p><i class="fa fa-globe" aria-hidden="true"></i>: India</p>
                	</div>
                </div>
                <%} %>
			</nav>
		</div>

<h6 class="text-primary text-uppercase" style="letter-spacing: 5px; align-content: center;align-items: center;text-align: center; margin-top: 40px;">Your ticket status</h6>


<div class="container-sm">
	<table class="table" style="margin-top: 30px;">
  <thead>
    <tr>
      <th scope="col">User</th>
      <th scope="col">Ticket</th>
      <th scope="col">Ticket place image</th>
      <th scope="col">Slot</th>
      <th scope="col">Price</th>
      <th scope="col">Date</th>
      <th scope="col">status</th>
      <th scope="col">Print</th>
    </tr>
  </thead>
  <tbody>
  <%
List<TicketBookedDTO> tbs = TouristDAO.getAllTicketBookedBasedOnToidAndUIDForUser(toid, uid);
for(TicketBookedDTO tb : tbs) {
%>
<tr>
    <td><img src="userPhoto?id=<%=tb.getUid()%>" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></td>
    <td><%=TouristDAO.ticketName(tb.getTicketId()) %></td>
    <td><img alt="cd" src="imTick?id=<%=tb.getTicketId()%>" style="width: 100px; height:50px;"></td>
    <td><%=tb.getSlot() %></td>
    <td><%=Double.parseDouble(String.valueOf(tb.getSlot())) * TouristDAO.ticketPrice(tb.getTicketId()) %></td>
    <td><%=tb.getDate() %></td>
    <td>
        <%
        if(tb.getStatus() == null){
            out.print("<span  style='color : blue;'>Processing</span>");
        } else if(tb.getStatus().equals("Accept")){
            out.print("<span  style='color : green;'>Accept</span>");
        } else if(tb.getStatus().equals("Reject")){
            out.print("<span  style='color : red;'>Reject</span>");
        } else {
            out.print("<span  style='color : red;'></span>");
        }
        %>
    </td>
    <td><a href="javascript:void(0);" onclick="printRow('<%=tb.getUid()%>', '<%=TouristDAO.ticketName(tb.getTicketId()) %>', '<%=tb.getTicketId()%>', '<%=tb.getSlot()%>', '<%=Double.parseDouble(String.valueOf(tb.getSlot())) * TouristDAO.ticketPrice(tb.getTicketId()) %>', '<%=tb.getStatus()%>')">Print</a></td>
</tr>
<%
}
%>
  </tbody>
</table>

</div>





 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
   
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">


document.addEventListener('DOMContentLoaded', function() {
    var alertElement = document.getElementById('alert');
    if (alertElement) {
        setTimeout(function() {
            alertElement.style.display = 'none';
        }, 2000); // 2000 milliseconds = 2 seconds
    }
});


function printRow(uid, ticketName, ticketId, slot, totalPrice, status) {
    var printWindow = window.open('', '_blank');
    var htmlContent = '<!DOCTYPE html>';
    htmlContent += '<html>';
    htmlContent += '<head>';
    htmlContent += '<title>Print Ticket</title>';
    htmlContent += '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">';
    htmlContent += '</head>';
    htmlContent += '<body>';
    htmlContent += '<div class="container">';
    htmlContent += '<h2>Bill Details</h2>';
    htmlContent += '<ul class="list-group">';
    htmlContent += '<li class="list-group-item"><strong>User ID: </strong>' + uid + '<img src="userPhoto?id=' + uid + '" alt="" style="height: 40px; width: 40px; border: 1px solid white; border-radius: 50%;"></li>';
    htmlContent += '<li class="list-group-item"><strong>Ticket Name: </strong>' + ticketName + '</li>';
    htmlContent += '<li class="list-group-item"><strong>Ticket ID: </strong>' + ticketId + '</li>';
    htmlContent += '<li class="list-group-item"><strong>Slot: </strong>' + slot + '</li>';
    htmlContent += '<li class="list-group-item"><strong>Total Price: </strong>' + totalPrice + '</li>';
    if (status == 'null') {
        htmlContent += '<li class="list-group-item"><strong>Status: </strong> Processing </li>';
    } else {
        htmlContent += '<li class="list-group-item"><strong>Status: </strong>' + status + '</li>';
    }
    htmlContent += '</ul>';
    htmlContent += '</div>';
    htmlContent += '</body>';
    htmlContent += '</html>';

    printWindow.document.open();
    printWindow.document.write(htmlContent);
    printWindow.document.close();
    printWindow.print();
}


</script>

</body>
</html>