<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KNUFLIX</title>
<style>
    body {
        background-color: #f0f0f0;
        font-family: Arial, sans-serif;
    }
    h1 {
        color: #333;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:hover {background-color: #f5f5f5;}
</style>
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

    String query = "SELECT a.pltf_name AS Platform, COUNT(*) AS NUM, f.sub_price AS PRICE " +
                "FROM PARTY a, PLATFORM f " +
                "WHERE a.pltf_name = f.pltf_name " +
                "GROUP BY a.pltf_name, f.sub_price " +
                "ORDER BY COUNT(*) desc";
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

                out.println("</tr>");
            }
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        %>
    </table>
</body>
</html>