<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNUFLIX</title>
</head>
<body>
    <h1> [ KNUFLIX ]</h1>
    <h2>Contents Inquiry</h2>
    <form action="/RetrieveContents/View/SearchGenreView.jsp">
        <label for="genre">Genre : </label>
        <select name="genre" id="genre">
            <option value="Horror" selected>Horror</option>
            <option value="RomCom">RomCom</option>
            <option value="SF">SF</option>
            <option value="Disaster">Disaster</option>
            <option value="Blockbuster">Blockbuster</option>
            <option value="Comedy">Comedy</option>
            <option value="Action">Action</option>
            <option value="Animation">Animation</option>
            <option value="Documentary">Documentary</option>
            <option value="Classic">Classic</option>
            <option value="Romance">Romance</option>
            <option value="Drama">Drama</option>
            <option value="Fantasy">Fantasy</option>
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