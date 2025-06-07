package lk.jiat.draftx.ejb.local;

import lk.jiat.draftx.entity.User;

public interface LoginService {

    boolean login(String email, String password);
    User getUserByEmail(String email);

}
