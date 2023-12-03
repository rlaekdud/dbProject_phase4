package repository;

import static java.lang.System.out;

import java.sql.*;

public class Repository {
    private final String serverIP = "localhost";
    private final String strSID = "orcl";
    private final String portNum = "1521";
    private final String id = "seven";
    private final String pw = "eleven";
    private final String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    private PreparedStatement pstmt;

    private StringBuilder result = new StringBuilder();

    public Repository() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void setPstmt(PreparedStatement pstmt) {
        this.pstmt = pstmt;
    }

    public StringBuilder getResult() {
        return result;
    }

    public PreparedStatement initPstmt(String query) {
        try {
            Connection conn = DriverManager.getConnection(url, id, pw);
            pstmt = conn.prepareStatement(query);
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        return pstmt;
    }

    public ResultSet getQueryResult() {
        ResultSet rs = null;
        try {
            rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int cnt = rsmd.getColumnCount();

            result.append("<table border=\"1\">");

            for(int i = 1; i <= cnt; i++) {
                result.append("<th>").append(rsmd.getColumnName(i)).append("</th>");
            }
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        return rs;
    }
}
