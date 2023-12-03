<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KNUFLIX</title>
</head>
<body>
<%
    // Retrieve data from the session
    HttpSession session = request.getSession();
    String fetchedUserId = (String) session.getAttribute("fetchedUserId");
    String fetchedPassword = (String) session.getAttribute("fetchedPassword");

    // Check if the data exists in the session
    if (fetchedUserId != null && fetchedPassword != null) {
%>
    <h1><< KNUFLIX >></h1>
    <h2>Modify Password</h2>
    <form action="/UserMenu/ModifyPasswordProcess.jsp" method="post">
        <label for="currentPassword"> Current Password : </label>
        <input type="password" name="currentPassword" id="currentPassword" required>
        <br><br>

        <label for="newPassword"> New Password : </label>
        <input type="password" name="newPassword" id="newPassword" required>
        <br><br>

        <!-- Hidden fields to pass user ID and fetched password to the processing page -->
        <input type="hidden" name="userId" value="<%= fetchedUserId %>">
        <input type="hidden" name="fetchedPassword" value="<%= fetchedPassword %>">

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
<%
    } else {
        // Handle the case where data is not available in the session
        out.println("Error: Data not found in the session.");
    }
%>
</body>
</html>

