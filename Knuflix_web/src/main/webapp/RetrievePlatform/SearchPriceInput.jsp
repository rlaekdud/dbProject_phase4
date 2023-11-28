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
    <h2>Contents Inquiry</h2>
    <form action="SearchPriceView.jsp">
        <label for="pname"> Platform name : </label> 
        <select name="pname" id="pname">
            <option value="Disney+" selected>Disney+</option>
            <option value="Netflix">Netflix</option>
            <option value="Tving">Tving</option>
            <option value="Watcha">Watcha</option>
            <option value="Wavve">Wavve</option>
        </select>
        <br><br>

        <input type="reset" value="Reset">
        <input type="submit" value="Submit">
    </form>
</body>
</html>