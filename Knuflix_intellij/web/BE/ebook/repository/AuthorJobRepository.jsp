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

    String query = "SELECT e.title, e.author_name AS Author, e.publisher, e.year, s.pltf_name AS Platform " +
                    "FROM EBOOK e, SERVE s " +
                    "WHERE e.author_name IN (SELECT a.name " +
                                            "FROM AUTHOR a " +
                                            "WHERE a.job = ?) " +
                    "AND e.book_id = s.book_id " +
                    "ORDER BY e.year desc";
    String job = request.getParameter("job");

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, job);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        if (rs == null) {
            response.sendRedirect("/FE/Ebook/SearchAuthorJob/AuthorJobView_NoSuchJob.jsp");
        }

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

        session.setAttribute("job", job);
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Ebook/SearchAuthorJob/AuthorJobView.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
