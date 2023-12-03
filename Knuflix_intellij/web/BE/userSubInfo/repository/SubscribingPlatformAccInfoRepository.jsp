<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="user.UserDto" %>
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

    String query = "SELECT Pltf_name, Pltf_acc_id, Pltf_acc_pw "
                + "FROM PARTY "
                + "WHERE Leader_id = ? "
                + "OR Party_ID IN (SELECT Party_id "
                                + "FROM PARTICIPATE "
                                + "WHERE User_id = ?)";
    String userID = UserDto.userID;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    }

    try {
        Connection conn = DriverManager.getConnection(url, user, pass);

        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userID);
        pstmt.setString(2, userID);

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
