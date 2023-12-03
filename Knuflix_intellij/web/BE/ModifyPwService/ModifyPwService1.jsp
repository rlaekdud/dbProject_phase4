<%@ page import="repository.CheckPw" %>
<%@ page import="dto.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/3/23
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    session = request.getSession();
    String formerPw = request.getParameter("formerPw");
    CheckPw checkPw = new CheckPw(UserDto.userID);

    if(checkPw.checkMyPw(formerPw)) {
        session.setAttribute("formerPw", formerPw);
        response.sendRedirect("/FE/MyAccount/ModifyPw2.jsp");
    }
    else {
        response.sendRedirect("/FE/MyAccount/ModifyPw1_Error.jsp");
    }
%>
</body>
</html>
