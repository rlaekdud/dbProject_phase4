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

    // Get user ID and password from the form
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    // Initialize variables to store user data
    String fetchedUserId = "";
    String fetchedPassword = "";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = conn.prepareStatement("SELECT user_id, pw FROM USERS WHERE user_id = ?");
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();

        // Check if a user with the specified ID exists
        if (rs.next()) {
            // User exists, fetch data
            fetchedUserId = rs.getString("user_id");
            fetchedPassword = rs.getString("pw");

            // Check if the entered password matches the stored password
            if (password.equals(fetchedPassword)) {
                // Password is correct, proceed with login logic
                out.println("<p style=\"color: green;\">Login successful! Welcome, " + fetchedUserId + ".</p>");
            } else {
                // Password is incorrect, display an error message
                out.println("<p style=\"color: red;\">Error: Incorrect password.</p>");
            }
        } else {
            // User does not exist, display an error message
            out.println("<p style=\"color: red;\">Error: User not found.</p>");
        }

        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        out.println("<p style=\"color: red;\">[Error] SQL error: " + e.getMessage() + "</p>");
    }
%>

<h1><< KNUFLIX >></h1>
<h2>Sign In</h2>
<form action="/UserMenu/SignInView.jsp" method="post">
    <label for="userId"> User ID : </label>
    <input type="text" name="userId" id="userId" value="<%= fetchedUserId %>" required>
    <br><br>

    <label for="password"> Password : </label>
    <input type="password" name="password" id="password" value="<%= fetchedPassword %>" required>
    <br><br>

    <input type="reset" value="Reset">
    <input type="submit" value="Submit">
</form>
</body>
</html>
