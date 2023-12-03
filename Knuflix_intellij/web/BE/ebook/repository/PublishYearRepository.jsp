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
    String query = "SELECT e.title, e.author_name AS Author, e.publisher, e.year, s.pltf_name AS Platform " +
                    "FROM EBOOK e, SERVE s " +
                    "WHERE e.book_id = s.book_id " +
                    "ORDER BY e.year desc";

    Repository repository = new Repository();

    try {
        repository.initPstmt(query);

        ResultSet rs = repository.getQueryResult();

        StringBuilder result = repository.getResult();

        while(rs.next()) {
            result.append("<tr>");
            result.append("<td>").append(rs.getString(1)).append("</td>");
            result.append("<td>").append(rs.getString(2)).append("</td>");
            result.append("<td>").append(rs.getString(3)).append("</td>");
            result.append("<td>").append(rs.getString(4)).append("</td>");
            result.append("<td>").append(rs.getString(5)).append("</td>");
            result.append("</tr>");
        }
        result.append("</table>");

        session = request.getSession();
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Ebook/SearchYear/Year.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
