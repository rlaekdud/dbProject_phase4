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

    String query = "SELECT e.title, e.author_name AS Author, e.publisher, e.year, s.pltf_name AS Platform " +
    "FROM EBOOK e, SERVE s " +
    "WHERE e.book_id = s.book_id " +
    "ORDER BY e.year desc";
    %>
    <h1>[ KNUFLIX ]</h1>
    <h3>-- Result --</h3>
    <table border="1">
        <%
        try {
            pstmt = conn.prepareStatement(query);

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
                out.println("<td>" + rs.getString(4) + "</td>");
                out.println("<td>" + rs.getString(5) + "</td>");

                out.println("</tr>");
            }
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        %>
    </table>
</body>
</html>