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
    <h2>Sign Up</h2>
    <form action="/Knuflix_web/UserMenu/SignUpView.jsp" method="post">
        <label for="userId"> User ID : </label>
        <input type="text" name="userId" id="userId" required>
        <br><br>
        
        <!-- Add other input fields for password, phone number, name, bank name, and account number -->
        <label for="password"> Password : </label>
        <input type="password" name="password" id="password" required>
        <br><br>

        <!-- Include other input fields as needed -->

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>
