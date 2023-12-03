<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Higher Subscription Price Platforms</title>
</head>
<body>
<%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "seven";
    String pass = "eleven";
    String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
    String query = "SELECT Pltf_name AS Platform, Sub_price " +
                   "FROM PLATFORM " +
                   "WHERE Sub_price > (SELECT Sub_price FROM PLATFORM WHERE Pltf_name = ?)";
    
    String selectedPlatform = request.getParameter("selectedPlatform");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try {
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, selectedPlatform);
        ResultSet rs = pstmt.executeQuery();

        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();

        StringBuilder result = new StringBuilder();
        result.append("<table border=\"1\">");

        // Display table header
        result.append("<tr>");
        for (int i = 1; i <= columnCount; i++) {
            result.append("<th>").append(rsmd.getColumnName(i)).append("</th>");
        }
        result.append("</tr>");

        // Display table rows
        while (rs.next()) {
            result.append("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                result.append("<td>").append(rs.getString(i)).append("</td>");
            }
            result.append("</tr>");
        }

        result.append("</table>");
        request.setAttribute("result", result.toString());
        request.getRequestDispatcher("/demo/FE/outputTest.jsp").forward(request, response);
    } catch (SQLException e) {
        out.println("[Error] SQL error: " + e.getMessage());
    }
%>
</body>
</html>
