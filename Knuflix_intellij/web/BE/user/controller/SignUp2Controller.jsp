<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BE.user.service.SignUpService" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    SignUpService signUpService = new SignUpService();

    if (!signUpService.isValidPhoneNumber(phone)) {
        response.sendRedirect("/FE/SignUp/SignUp2Error.jsp");
    } else {
        session.setAttribute("name", name);
        session.setAttribute("phone", phone);

        response.sendRedirect("/FE/SignUp/SignUp3.jsp");
    }
%>
</body>
</html>
