<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNUFLIX</title>
</head>
<body>
    <h1>[ KNUFLIX ]</h1>
    <h2>E-Book Inquiry</h2>
    <form action="/Knuflix_web/RetrieveContents/View/SearchAuthorView.jsp">
        <label for="job"> Author Job : </label>
        <input type="text" name="job" id="job">
        <br><br>

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>