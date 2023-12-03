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
    String query = "WITH GROUPS AS " +
                        "(SELECT * " +
                        "FROM CONTENT " +
                        "WHERE Genre = ?) " +
                    "SELECT g.title, g.rating, s.pltf_name " +
                    "FROM GROUPS g, SHOW s " +
                    "WHERE g.rating >= ? " +
                    "AND s.content_id = g.content_id " +
                    "ORDER BY g.rating desc, s.pltf_name";
    String genre = request.getParameter("genre");
    double rating = Double.parseDouble(request.getParameter("rating"));

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, genre);
        pstmt.setDouble(2, rating);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        StringBuilder result = repository.getResult();

        while(rs.next()) {
            result.append("<tr>");
            result.append("<td>").append(rs.getString(1)).append("</td>");
            result.append("<td>").append(rs.getDouble(2)).append("</td>");
            result.append("<td>").append(rs.getString(3)).append("</td>");
            result.append("</tr>");
        }
        result.append("</table>");

        session = request.getSession();
        session.setAttribute("genre", genre);
        session.setAttribute("rating", Double.toString(rating));
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Contents/SearchGenreRating/GenreRatingView.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
