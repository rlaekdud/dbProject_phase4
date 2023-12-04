package BE.user.service;

import java.sql.*;
import repository.Repository;

public class SignUpService {
    public boolean isIdRedundant(String id) {
        String query = "SELECT * FROM USERS WHERE User_id = " + id;

        Repository repository = new Repository();
        repository.initPstmt(query);
        ResultSet rs = repository.getQueryResult();

        return rs != null;
    }

    public boolean isValidPhoneNumber(String phone) {
        String regex = "^\\d{3}-\\d{4}-\\d{4}$";
        return phone.matches(regex);
    }
}
