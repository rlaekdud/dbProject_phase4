<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="repository.Repository" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    String query = "SELECT a.pltf_name AS Platform, COUNT(*) AS NUM " +
                    "FROM PARTY a, PLATFORM f " +
                    "WHERE a.pltf_name = f.pltf_name " +
                    "GROUP BY a.pltf_name " +
                    "ORDER BY COUNT(*) desc";

    Repository repository = new Repository();

    try {
        ResultSet rs = repository.getQueryResult();

        StringBuilder result = repository.getResult();

        while(rs.next()) {
            result.append("<tr>");
            result.append("<td>").append(rs.getString(1)).append("</td>");
            result.append("<td>").append(rs.getInt(2)).append("</td>");
            result.append("</tr>");
        }
        result.append("</table>");

        session = request.getSession();
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Platform/SearchPopularity/Popularity.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
