<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KNUFLIX</title>
</head>
<body>
    <h1><< KNUFLIX >></h1>
    <h2>Modify Password</h2>
    <form action="/UserMenu/ModifyPasswordView.jsp" method="post">
        <label for="currentPassword"> Current Password : </label>
        <input type="password" name="currentPassword" id="currentPassword" required>
        <br><br>

        <label for="newPassword"> New Password : </label>
        <input type="password" name="newPassword" id="newPassword" required>
        <br><br>

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>
