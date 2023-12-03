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
    session = request.getSession();

    String query = "SELECT c.title, c.genre, c.rating " +
                  "FROM CONTENT c " +
                  "WHERE c.content_id IN ((SELECT s.content_id " +
                                          "FROM SHOW s " +
                                          "WHERE s.pltf_name = ?) " +
                                          "INTERSECT " +
                                          "(SELECT c1.content_id " +
                                          "FROM CONTENT c1 " +
                                          "WHERE c1.rating >= ?)) " +
                  "ORDER BY c.rating desc";
    String pname = request.getParameter("pname");
    double rating = Double.parseDouble(request.getParameter("rating"));

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, pname);
        pstmt.setDouble(2, rating);

        ResultSet rs = repository.getQueryResult();

        StringBuilder result = repository.getResult();

        while(rs.next()) {
          result.append("<tr>");
          result.append("<td>").append(rs.getString(1)).append("</td>");
          result.append("<td>").append(rs.getString(2)).append("</td>");
          result.append("<td>").append(rs.getDouble(3)).append("</td>");
          result.append("</tr>");
        }
        result.append("</table>");

        session.setAttribute("pname", pname);
        session.setAttribute("rating", Double.toString(rating));
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Contents/SearchPnameRating/PnameRatingView.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
