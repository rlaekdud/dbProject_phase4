<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.UserDto" %>
<%@ page import="repository.Repository" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    session = request.getSession();

    String query = "SELECT Pltf_name AS Platform, Sub_price "
                + "FROM PARTY NATURAL JOIN PLATFORM "
                + "WHERE leader_id = ? "
                + "OR party_id IN (SELECT party_id "
                                + "FROM PARTICIPATE "
                                + "WHERE user_id = ?)";
    String userID = UserDto.userID;

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, userID);
        pstmt.setString(2, userID);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        if (rs == null) {
            response.sendRedirect("/FE/MyParty/SearchMySub/MySub_NoSub.jsp");
        } else {
            StringBuilder result = new StringBuilder();

            while(rs.next()) {
                result.append("<tr>");
                result.append("<td>").append(rs.getString(1)).append("</td>");
                result.append("<td>").append(rs.getDouble(2)).append("</td>");
                result.append("</tr>");
            }
            result.append("</table>");

            session.setAttribute("result", result.toString());
            response.sendRedirect("/FE/MyParty/SearchMySub/MySub.jsp");
        }
    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
