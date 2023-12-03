<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KNUFLIX</title>
</head>
<body>
<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "seven";
    String pass = "eleven";
    String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

    // Get user ID from request parameter
    String userId = request.getParameter("userId");

    // Initialize variables to store user data
    String fetchedUserId = "";
    String fetchedPassword = "";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = conn.prepareStatement("SELECT user_id, password FROM Users WHERE user_id = ?");
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        // Check if a user with the specified ID exists
        if (rs.next()) {
            // User exists, fetch data
            fetchedUserId = rs.getString("user_id");
            fetchedPassword = rs.getString("password");
        }

        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("[Error] SQL error: " + e.getMessage());
    }
%>

<h1><< KNUFLIX >></h1>
<h2>Sign Up</h2>
<form action="/UserMenu/SignUpView.jsp" method="post">
    <label for="userId"> User ID : </label>
    <input type="text" name="userId" id="userId" value="<%= fetchedUserId %>" required>
    <br><br>
    
    <!-- Add other input fields for password, phone number, name, bank name, and account number -->
    <label for="password"> Password : </label>
    <input type="password" name="password" id="password" value="<%= fetchedPassword %>" required>
    <br><br>

    <input type="reset" value="Reset">
    <input type="submit" value="Submit">
</form>
</body>
</html>
