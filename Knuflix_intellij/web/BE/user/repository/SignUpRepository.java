package BE.user.repository;

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
        String query = String.format("INSERT INTO USERS VALUES (%s, %s, %s, %s, %s, %s)", id, pw, name, phone, bank, accnum);

        repository.execInsert(query);
    }
}
