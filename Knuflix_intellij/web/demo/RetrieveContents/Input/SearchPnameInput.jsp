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
    <h2>Contents Inquiry</h2>
    <form action="/RetrieveContents/View/SearchPnameView.jsp">
        <label for="pname"> Platform name : </label> 
        <select name="pname" id="pname">
            <option value="Disney+" selected>Disney+</option>
            <option value="Netflix">Netflix</option>
            <option value="Tving">Tving</option>
            <option value="Watcha">Watcha</option>
            <option value="Wavve">Wavve</option>
        </select>
        <br>

        <label for="rating">Rating : </label>
        <select name="rating" id="rating">
            <option value="0" selected>0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
        <br><br>

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>