<%@ page import="repository.CheckPw" %>
<%@ page import="dto.UserDto" %>
<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/3/23
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    String myId = request.getParameter("id");
    String myPw = request.getParameter("pw");
    CheckPw checkPw = new CheckPw(myId);

    if(checkPw.checkMyPw(myPw)) {
      UserDto.userID = myId;
      response.sendRedirect("/FE/Home/Home_SignIn.jsp");
    }
    else {
      response.sendRedirect("/FE/SignIn/SignInError.jsp");
    }
%>
</body>
</html>
