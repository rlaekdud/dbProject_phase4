<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BE.user.service.SignUpService" %>
<%@ page import="BE.user.repository.SignUpRepository" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    String bank = request.getParameter("bank");
    String accnum = request.getParameter("accnum");

    SignUpService signUpService = new SignUpService();

    String id = (String)request.getAttribute("id");
    String pw = (String)request.getAttribute("pw");
    String name = (String)request.getAttribute("name");
    String phone = (String)request.getAttribute("phone");

    if (signUpService.isIdRedundant(id)) {
        response.sendRedirect("/FE/SignUp/SignUp1Error.jsp");//todo:check
    } else {
        SignUpRepository signUpRepository = new SignUpRepository(id, pw, name, phone, bank, accnum);
        signUpRepository.insertUser();

        response.sendRedirect("/FE/Home/Home.jsp");//todo:check
    }
%>
</body>
</html>
