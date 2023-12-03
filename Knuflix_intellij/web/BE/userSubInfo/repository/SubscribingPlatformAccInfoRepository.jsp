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

    String query = "SELECT Pltf_name, Pltf_acc_id, Pltf_acc_pw "
                + "FROM PARTY "
                + "WHERE Leader_id = ? "
                + "OR Party_ID IN (SELECT Party_id "
                                + "FROM PARTICIPATE "
                                + "WHERE User_id = ?)";
    String userID = UserDto.userID;

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, userID);
        pstmt.setString(2, userID);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        if (rs == null) {
            response.sendRedirect("/FE/MyParty/SearchMyPInfo/MyPInfo_NoShare.jsp");
        }

        StringBuilder result = repository.getResult();

        while(rs.next()) {
            result.append("<tr>");
            result.append("<td>").append(rs.getString(1)).append("</td>");
            result.append("<td>").append(rs.getString(2)).append("</td>");
            result.append("<td>").append(rs.getString(3)).append("</td>");
            result.append("</tr>");
        }
        result.append("</table>");

        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/MyParty/SearchMyPInfo/MyPInfo.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
