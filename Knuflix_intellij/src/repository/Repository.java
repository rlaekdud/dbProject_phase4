package repository;

import static java.lang.System.out;

import java.sql.*;

public class Repository {
    private final String serverIP = "localhost";
    private final String strSID = "xe";
    private final String portNum = "11521";
    private final String id = "platform";
    private final String pw = "platform";
    private final String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

    private Connection conn;
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
            conn = DriverManager.getConnection(url, id, pw);
            pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                                    // TYPE_SCROLL_INSENSITIVE: ResultSet이 생성된 후에 데이터베이스에서 데이터가 변경되더라도 ResultSet에는 그 변경사항이 반영되지 않음
                                                    // to use rs.previous()
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        return pstmt;
    }

    public ResultSet getQueryResult() {
        ResultSet rs = null;
        try {
            rs = pstmt.executeQuery();

            if (rs.next()) {
                rs.previous();

                ResultSetMetaData rsmd = rs.getMetaData();
                int cnt = rsmd.getColumnCount();

                result.append("<table border=\"1\">");

                for(int i = 1; i <= cnt; i++) {
                    result.append("<th>").append(rsmd.getColumnName(i)).append("</th>");
                }
            } else {
                return null;
            }
        } catch(SQLException e) {
            out.println("[Error] SQL error");
        }
        return rs;
    }

    public void execInsert(String query) {
        try {
            conn = DriverManager.getConnection(url, id, pw);
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
