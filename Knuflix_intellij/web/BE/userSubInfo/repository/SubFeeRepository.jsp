<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.UserDto" %>
<%@ page import="repository.Repository" %>
<%@ page import="static java.lang.System.out" %>
<!DOCTYPE html>
<html>
<head>
    <title>KNUFLIX</title>
</head>
<body>
<%
    session = request.getSession();
%>
<%!
    public StringBuilder subFeeRepo(String query) {
        Repository repository = new Repository();
        StringBuilder result = new StringBuilder();

        String userID = UserDto.userID;

        try {
            PreparedStatement pstmt = repository.initPstmt(query);
            pstmt.setString(1, userID);
            repository.setPstmt(pstmt);

            ResultSet rs = repository.getQueryResult();

            if (rs == null) {   // no result
                return null;
            }

            result = repository.getResult();

            while(rs.next()) {
                result.append("<tr>");
                result.append("<td>").append(rs.getString(1)).append("</td>");
                result.append("<td>").append(rs.getInt(2)).append("</td>");
                result.append("</tr>");
            }
            result.append("</table>");

        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }

        return result;
    }
%>
<%--Leader--%>
<%
    String queryL = "SELECT F.Pltf_name, F.Sub_price "
                    + "FROM USERS U, PARTY A, PLATFORM F "
                    + "WHERE U.User_id = A.Leader_id "
                    + "AND A.Pltf_name = F.Pltf_name "
                    + "AND U.User_id = ?";

    StringBuilder resultL = subFeeRepo(queryL);
%>
<%--Member--%>
<%
    String queryM = "SELECT F.Pltf_name, F.Sub_price "
                    + "FROM USERS U, PARTICIPATE P, PARTY A, PLATFORM F "
                    + "WHERE U.User_id = P.User_id "
                    + "AND P.Party_id = A.Party_id "
                    + "AND A.Pltf_name = F.Pltf_name "
                    + "AND U.User_id = ?";

    StringBuilder resultM = subFeeRepo(queryM);
%>
<%
    if (resultL == null) {
        if (resultM == null) {
            response.sendRedirect("/FE/MyParty/SearchMyPartyFee/MyPartyFee_NoParty.jsp");   // no result
        }
        session.setAttribute("resultMember", resultM.toString());
        response.sendRedirect("/FE/MyParty/SearchMyPartyFee/MyPartyFee_OnlyMember.jsp");    // no leader
    } else if (resultM == null) {
        session.setAttribute("resultLeader", resultL.toString());
        response.sendRedirect("/FE/MyParty/SearchMyPartyFee/MyPartyFee_OnlyLeader.jsp");    // no member
    }

    session.setAttribute("resultLeader", resultL.toString());
    session.setAttribute("resultMember", resultM.toString());
    response.sendRedirect("/FE/MyParty/SearchMyPartyFee/MyPartyFee.jsp");
%>
</body>
</html>
