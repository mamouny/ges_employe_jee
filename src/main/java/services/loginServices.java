package services;

import Dao.UserDao;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


public class loginServices implements UserDao {

    private static final String PERSISTENCE_UNIT_NAME = "default";
    private final EntityManagerFactory emf;
    private final EntityManager em;

    public loginServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
    }
    @Override
    public boolean login(String nom,String password) {
        em.getTransaction().begin();
        String sql = "SELECT U FROM users U where  U.nom = :nom and U.password = :password ";
        Query query = em.createQuery(sql,User.class);
        query.setParameter("nom",nom);
        query.setParameter("password",password);
        try{
            User u = (User) query.getSingleResult();
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
