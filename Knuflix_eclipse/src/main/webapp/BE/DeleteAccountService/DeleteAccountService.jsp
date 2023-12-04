<%@ page import="repository.Repository" %>
<%@ page import="repository.CheckPw" %>
<%@ page import="dto.UserDto" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: rlaekdud
  Date: 12/3/23
  Time: 23:36
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
    String myPw = request.getParameter("pw");
    CheckPw checkPw = new CheckPw(UserDto.userID);
    Repository repository = new Repository();

    String query = "DELETE FROM USERS WHERE user_id = ?";

    if(checkPw.checkMyPw(myPw)) {
        try {
            PreparedStatement pstmt = repository.initPstmt(query);
            pstmt.setString(1, UserDto.userID);
            repository.setPstmt(pstmt);
            repository.execUpdate();
            response.sendRedirect("/FE/Home/Home.jsp");
        } catch (SQLException e) {
            out.println("[Error] SQL error");
        }
    }
    else {
        response.sendRedirect("/FE/MyAccount/DeleteAccount_Error.jsp");
    }
%>
</body>
</html>
