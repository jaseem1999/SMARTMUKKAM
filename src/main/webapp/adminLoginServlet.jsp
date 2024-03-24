<%@page import="smartMukkam.com.admin.AdminDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.admin.AdminDAO"%>
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
String email = request.getParameter("email");
String pass = request.getParameter("pass");
int i = AdminDAO.login(email, pass);
if(i>0){
	List<AdminDTO> admin = AdminDAO.AdminDetails(email);
	for(AdminDTO ad : admin){
		session.setAttribute("adminId", ad.getAdminId());
		session.setAttribute("adminEmail", ad.getEmail());
		session.setAttribute("adminActive", ad.getActive());
		session.setAttribute("adminStatus", ad.getStatus());
	}
	response.sendRedirect("adminHome.jsp");
	
}else{
	response.sendRedirect("AdminLogin.jsp?message=loginFailed");
}
%>

</body>
</html>