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
    <h2>Delete Account</h2>
    <form action="/Knuflix_web/UserMenu/DeleteAccountView.jsp" method="post">
        <label for="password"> Password : </label>
        <input type="password" name="password" id="password" required>
        <br><br>

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>
