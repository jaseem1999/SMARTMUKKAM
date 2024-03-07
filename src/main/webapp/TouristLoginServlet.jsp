<%@page import="smartMukkam.com.tourist.TouristDTO"%>
<%@page import="java.util.List"%>
<%@page import="smartMukkam.com.tourist.TouristDAO"%>
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

String email = (String) request.getParameter("email");
String pass = (String) request.getParameter("pass");

int i = TouristDAO.touristLogin(email, pass);

if(i>0){
	int j = TouristDAO.getTouristStatus(email);
	if(j>0){
		List<TouristDTO> tourist = TouristDAO.getAllTouristDetailsBasedTouristId(email);
		for(TouristDTO t : tourist){
			session.setAttribute("touristEmail", t.getEmail());
			session.setAttribute("touristName", t.getName());
			session.setAttribute("touristPhone", t.getPhone());
			session.setAttribute("touristPlaceName", t.getTouristPlace());
			int k = TouristDAO.loginTourist(email);
			response.sendRedirect("touristHome.jsp");
		}
	}else{
		response.sendRedirect("index.jsp?message=shopLoginFailedPleaseContactMunicipality");
	}
}else{
	response.sendRedirect("index.jsp?message=touristLoginFailed");
}

%>

</body>
</html>