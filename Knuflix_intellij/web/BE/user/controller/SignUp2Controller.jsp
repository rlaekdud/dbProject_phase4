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

    if (signUpService.isValidPhoneNumber(phone)) {
        response.sendRedirect("/FE/SignUp/SignUp2Error.jsp");//todo:check
    } else {
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        // transfer data to last page
        request.getRequestDispatcher("/BE/user/controller/SignUp3Controller.jsp").forward(request, response);

        response.sendRedirect("/FE/SignUp/SignUp3.jsp");//todo:check
    }
%>
</body>
</html>
