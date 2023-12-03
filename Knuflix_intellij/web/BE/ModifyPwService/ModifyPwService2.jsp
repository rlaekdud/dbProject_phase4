<%@ page import="repository.CheckPw" %>
<%@ page import="dto.UserDto" %>
<%@ page import="java.sql.*" %>
<%@ page import="repository.Repository" %>
<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/3/23
  Time: 23:11
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
    String formerPw = (String) session.getAttribute("formerPw");
    String newPw1 = request.getParameter("pw1");
    String newPw2 = request.getParameter("pw2");
    CheckPw checkPw = new CheckPw(UserDto.userID);
    Repository repository = new Repository();

    String query = "UPDATE USERS SET pw = ? WHERE user_id = ?";

    if (checkPw.checkNewPw(newPw1, newPw2)) {
        try {
            PreparedStatement pstmt = repository.initPstmt(query);
            pstmt.setString(1, newPw1);
            pstmt.setString(2, formerPw);

            repository.setPstmt(pstmt);
            repository.exeUpdate();
            response.sendRedirect("/FE/Home/Home_SignIn.jsp");

        } catch (SQLException e) {
            out.println("[Error] SQL error");
        }
    }
    else {
        response.sendRedirect("/FE/MyAccount/ModifyPw2_Error.jsp");
    }
%>
</body>
</html>
