<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
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
    String platform = request.getParameter("pname");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try {
        Connection conn = DriverManager.getConnection(url, user, pass);

        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, platform);

        ResultSet rs = pstmt.executeQuery();
        ResultSetMetaData rsmd = rs.getMetaData();
        int cnt = rsmd.getColumnCount();

        StringBuilder result = new StringBuilder();

        result.append("<table border=\"1\">");

        for(int i = 1; i <= cnt; i++) {
            result.append("<th>").append(rsmd.getColumnName(i)).append("</th>");
        }

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
        session.setAttribute("result", result.toString());
        response.sendRedirect("/FE/Contents/SearchPnameAll/PnameAllView.jsp");

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
