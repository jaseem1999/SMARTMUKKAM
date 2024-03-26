<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<%
    // Assuming 'tid' is passed as a request parameter
    int sid = Integer.parseInt(request.getParameter("sid"));
%>



<iframe src="license?sid=<%=sid%>" width="100%" height="600"></iframe>
<a href="adminManageShop.jsp" style="margin: 30px;" class="btn btn-primary">Go Back</a>

</body>
</html>