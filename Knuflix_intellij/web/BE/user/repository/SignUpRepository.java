package BE.user.repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import repository.Repository;

public class SignUpRepository {
    private final String id;
    private final String pw;
    private final String name;
    private final String phone;
    private final String bank;
    private final String accnum;

    public SignUpRepository(String id, String pw, String name, String phone, String bank, String accnum) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.phone = phone;
        this.bank = bank;
        this.accnum = accnum;
    }

    public void insertUser() {
        Repository repository = new Repository();
        String query = "INSERT INTO USERS VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = repository.initPstmt(query);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, name);
            pstmt.setString(4, phone);
            pstmt.setString(5, bank);
            pstmt.setString(6, accnum);
            repository.setPstmt(pstmt);

            repository.execUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        repository.execUpdate();
    }
}
