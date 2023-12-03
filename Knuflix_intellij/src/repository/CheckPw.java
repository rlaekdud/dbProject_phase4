package repository;

import dto.UserDto;

import java.sql.*;

public class CheckPw {
    UserDto user = null;
    Repository repository = new Repository();

    final String query = "SELECT pw FROM USERS WHERE user_id = ? ";
    public CheckPw(String id) {
        user = new UserDto(id);
    }

    public boolean checkMyPw(String pw) {
        try {
            PreparedStatement pstmt = repository.initPstmt(query);
            pstmt.setString(1, user.userID);
            repository.setPstmt(pstmt);

            ResultSet rs = repository.getQueryResult();

            if (rs == null) {
                return false;
            } else {
                rs.next();
                String answerPw = rs.getString(1);
                if (answerPw.equals(pw)) {
                    return true;
                }
                else {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println("[Error] SQL error");
        }
        return false;
    }

    public boolean checkNewPw(String pw1, String pw2) {
        if(pw1.equals(pw2)) {
            return true;
        }
        return false;
    }
}
