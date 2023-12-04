<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BE.user.service.SignUpService" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    SignUpService signUpService = new SignUpService();

    if (signUpService.isIdRedundant(id)) {
        response.sendRedirect("/FE/SignUp/SignUp1Error.jsp");
    } else {
        session.setAttribute("id", id);
        session.setAttribute("pw", pw);

        response.sendRedirect("/FE/SignUp/SignUp2.jsp");
    }
%>
</body>
</html>
