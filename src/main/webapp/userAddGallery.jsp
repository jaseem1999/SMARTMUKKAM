<%@page import="smartMukkam.main.user.userData.UserDAO"%>
<%@page import="smartMukkam.main.user.userData.GalleryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Gallery</title>
<link href="fontawesome-free-6.5.1-web/css/fontawesome.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/brands.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/solid.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
  <link href="fontawesome-free-6.5.1-web/css/custom-icons.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
	.userProfile{
		      margin-top: 8px;
    		  width: 40px;
    		  border-radius: 50%;
		}
</style>
</head>
<%
Integer uid = (Integer) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String country = (String) session.getAttribute("country");
Long number =(Long) session.getAttribute("phone");

if (email == null){
	response.sendRedirect("index.jsp?message=login");
}
String alert = (String) request.getParameter("message");
%>
<body>
<div class="container">
			<%
			if(alert != null && alert.equals("success")){
				out.print("<div id='alert' class='alert alert-success' style='' role='alert'>Gallery added success</div>");
			}
			if(alert != null && alert.equals("failed")){
				out.print("<div id='alert' class='alert alert-danger' style='' role='alert'>Gallery added failed</div>");
			}
			%>
			<form action="addUG" method="post" enctype="multipart/form-data" style="margin: 30px;">
				  <input type="hidden" value="<%=uid%>" class="form-control" id="uid" name="uid" aria-describedby="hoid">
				  <div class="mb-3">
				    <label for="description" class="form-label">Description</label>
				    <input type="text" class="form-control" id="description" name="description" placeholder="Enter description">
				  </div>
				  <div class="mb-3">
				    <label for="image" class="form-label">Upload Image</label>
				    <input type="file" class="form-control" id="image" name="image">
				  </div>
		
				  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
			<div class="row" style="margin-top: 30px;">
			<%
			List<GalleryDTO> gallery = UserDAO.getAllGalleryForUserSpecific(uid);
			for(GalleryDTO g : gallery){
			%>
				<div class="col">
					<div class="card" style="width: 13rem;">
					  <img src="imUG?id=<%=g.getTid() %>" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><img alt="" src="userPhoto?id=<%=g.getUid()%>" class="userProfile"></h5>
					    <p class="card-text"><%=g.getDescription() %></p>
					    <p class="card-text"><%
					    if(g.getStatus() == null){
					    	out.print("<span style='color:green'>actve</span>");
					    }else{
					    	out.print("<span style='color:red'>Deleted</span>");
					    }
					    %></p>
					    <a href="userGalleryDelete.jsp?tid=<%=g.getTid()%>" class="btn btn-danger">Delete</a>
					  </div>
					</div>
				</div>
				<%} %>
			</div>
</div>






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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

</script>
</body>
</html>