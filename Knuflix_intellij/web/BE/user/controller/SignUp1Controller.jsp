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
        response.sendRedirect("/FE/SignUp/SignUp1Error.jsp");//todo:check
    } else {
        request.setAttribute("id", id);
        request.setAttribute("pw", pw);
        // transfer data to last page
        request.getRequestDispatcher("/BE/user/controller/SignUp3Controller.jsp").forward(request, response);

        response.sendRedirect("/FE/SignUp/SignUp2.jsp");//todo:check
    }
%>
</body>
</html>
