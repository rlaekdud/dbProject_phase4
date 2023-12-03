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
    String strSID = "orcl";
    String portNum = "1521";
    String user = "seven";
    String pass = "eleven";
    String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    String query = "SELECT e.title, e.author_name AS Author, e.publisher, e.year, s.pltf_name AS Platform " +
                    "FROM EBOOK e, SERVE s " +
                    "WHERE e.author_name IN (SELECT a.name " +
                                            "FROM AUTHOR a " +
                                            "WHERE a.job = ?) " +
                    "AND e.book_id = s.book_id " +
                    "ORDER BY e.year desc";
    String job = request.getParameter("job");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try {
        Connection conn = DriverManager.getConnection(url, user, pass);

        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, job);

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
            result.append("<td>").append(rs.getString(2)).append("</td>");
            result.append("<td>").append(rs.getString(3)).append("</td>");
            result.append("<td>").append(rs.getString(4)).append("</td>");
            result.append("<td>").append(rs.getString(5)).append("</td>");
            result.append("</tr>");
        }

        request.setAttribute("result", result.toString());
        request.getRequestDispatcher("/demo/FE/outputTest.jsp").forward(request, response);

    } catch(SQLException e) {
        out.println("[Error] SQL error");
    }
%>
</body>
</html>
