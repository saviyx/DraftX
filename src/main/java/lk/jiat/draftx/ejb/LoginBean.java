package lk.jiat.draftx.ejb;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import lk.jiat.draftx.ejb.local.LoginService;
import lk.jiat.draftx.entity.User;


@Stateless
public class LoginBean implements LoginService {


    @PersistenceContext
    private EntityManager em;
    @Override
    public boolean login(String email, String password) {

        try {
            System.out.println("Attempting login for: " + email + ", " + password);
            User user = em.createNamedQuery("User.findByEmailAndPassword", User.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
            System.out.println("User found: " + user.getEmail());
            return true;
        }catch (NoResultException e){
            System.out.println("No user found with given credentials.");
            return false;
        }
    }

    @Override
    public User getUserByEmail(String email) {
        try{
            User user =em.createNamedQuery("User.findByEmail",User.class)
                    .setParameter("email",email)
                    .getSingleResult();
            return user;
        }catch(NoResultException e){
            return null;
        }
    }
}
