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
Integer otp = (Integer) session.getAttribute("otpforVerificationUser");

try {
    // Retrieving OTP from request parameter
    // Assuming "otp" is the name of the parameter in the request
    Integer votp = Integer.parseInt(request.getParameter("otp"));

    if (otp != null && otp.equals(votp)) {
        response.sendRedirect("userResetPass.jsp");
    } else {
        response.sendRedirect("userPasswordForgetOtP.jsp?message=notvalidotp");
    }
} catch (NumberFormatException e) {
    // Handle the case where the parameter is not a valid integer
    response.sendRedirect("userPasswordForgetOtP.jsp?message=invalidInput");
}

%>

</body>
</html>