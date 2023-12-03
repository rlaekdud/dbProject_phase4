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
    String serverIP = "localhost";
    String strSID = "xe";
    String portNum = "11521";
    String user = "platform";
    String pass = "platform";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String query = "SELECT C.Title, C.Rating, C.Genre, P.Pltf_name as Platform "
                + "FROM PLATFORM P, SHOW S, CONTENT C "
                + "WHERE P.Pltf_name = S.Pltf_name "
                + "AND S.Content_id = C.Content_id "
                + "AND P.Pltf_name = ?";

    String pname = request.getParameter("pname");

    Repository repository = new Repository();

    try {
        PreparedStatement pstmt = repository.initPstmt(query);
        pstmt.setString(1, pname);
        repository.setPstmt(pstmt);

        ResultSet rs = repository.getQueryResult();

        StringBuilder result = repository.getResult();

        while(rs.next()) {
            result.append("<tr>");
            result.append("<td>").append(rs.getString(1)).append("</td>");
            result.append("<td>").append(rs.getDouble(2)).append("</td>");
            result.append("<td>").append(rs.getString(3)).append("</td>");
            result.append("<td>").append(rs.getString(4)).append("</td>");
            result.append("</tr>");
        }
        result.append("</table>");

        session = request.getSession();
        session.setAttribute("pname", pname);

        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Contents/SearchPnameAll/PnameAllView.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
