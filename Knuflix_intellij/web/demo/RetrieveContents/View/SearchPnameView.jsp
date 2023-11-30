<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNUFLIX</title>
</head>
<body>
    <%
    String serverIP = "localhost";
    String strSID = "xe"; // my local env : xe, lecture : orcl
    String portNum = "11521"; // my local env : 11521, lecture : 1521
    String user = "platform"; // my local env : platform
    String pass = "platform"; // my local env : platform
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    Connection conn = null;
    PreparedStatement pstmt;
    ResultSet rs;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);

    String query = "SELECT c.title, c.genre, c.rating " +
    "FROM CONTENT c " +
    "WHERE c.content_id IN ((SELECT s.content_id " +
    "FROM SHOW s " +
    "WHERE s.pltf_name = ? ) " +
    "INTERSECT " +
    "(SELECT c1.content_id " +
    "FROM CONTENT c1 " +
    "WHERE c1.rating >= ? ))" +
    "ORDER BY c.rating desc";

    String pltfName = request.getParameter("pname");
    String rating = request.getParameter("rating");
    %>
    <h1>[ KNUFLIX ]</h1>
    <h3>-- Result --</h3>
    <table border="1">
        <%
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, pltfName);
            pstmt.setString(2, rating);

            rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int cnt = rsmd.getColumnCount();

            for(int i = 1; i <= cnt; i++) {
                out.println("<th>" + rsmd.getColumnName(i) + "</th>");
            }
            
            while(rs.next()) {
                out.println("<tr>");

                out.println("<td>" + rs.getString(1) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");

                out.println("</tr>");
            }
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        %>
    </table>
</body>
</html>