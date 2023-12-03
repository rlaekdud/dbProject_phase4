<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KNUFLIX</title>
</head>
<body>
    <h1><< KNUFLIX >></h1>
    <h2>Sign Up</h2>
    <%
        String serverIP = "localhost";
        String strSID = "orcl";
        String portNum = "1521";
        String user = "seven";
        String pass = "eleven";
        String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
        
        // Get the user ID from the form
        String userId = request.getParameter("userId");

        // Check if the user ID already exists
        boolean isDuplicate = false;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM USERS WHERE user_id = '" + userId + "'");

            if (rs.next() && rs.getInt(1) > 0) {
                // User ID already exists
                isDuplicate = true;
            }

            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            out.println("[Error] SQL error: " + e.getMessage());
        }

        if (isDuplicate) {
    %>
            <p style="color: red;">Error: User ID already exists. Please choose a different one.</p>
    <%
        }
    %>

    <form action="/Knuflix_web/UserMenu/SignUpView.jsp" method="post">
        <label for="userId"> User ID : </label>
        <input type="text" name="userId" id="userId" required>
        <br><br>

        <!-- Include other input fields as needed -->

        <label for="password"> Password : </label>
        <input type="password" name="password" id="password" required>
        <br><br>

        <!-- Include other input fields as needed -->

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>
