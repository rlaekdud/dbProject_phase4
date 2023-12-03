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

    String query = "SELECT pltf_name AS Platform, sub_price " +
                    "FROM PLATFORM " +
                    "WHERE sub_price > (SELECT sub_price " +
                                        "FROM PLATFORM " +
                                        "WHERE pltf_name = ?)";
    String pname = request.getParameter("pname");

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, pname);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        if (rs == null) {
            response.sendRedirect("/FE/Platform/SearchExpensive/ExpensiveView_NoResult.jsp");
        } else {
            StringBuilder result = repository.getResult();

            while(rs.next()) {
                result.append("<tr>");
                result.append("<td>").append(rs.getString(1)).append("</td>");
                result.append("<td>").append(rs.getString(2)).append("</td>");
                result.append("</tr>");
            }
            result.append("</table>");

            session.setAttribute("pname", pname);
            session.setAttribute("result", result.toString());
            response.sendRedirect("/FE/Platform/SearchExpensive/ExpensiveView.jsp");
        }
    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
