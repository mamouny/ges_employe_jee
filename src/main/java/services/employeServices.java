package services;

import Dao.employeDao;
import entity.Employe;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class employeServices {
    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory emf;
    private static EntityManager em;


    public employeServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
    }


    public int save(Employe e) {
        return 0;
    }


    public static List<Employe> getAllEmployees() {
        List<Employe> list=new ArrayList<Employe>();
        try {
            em.getTransaction().begin();
            list = em.createQuery("from Employe").getResultList();

            em.getTransaction().commit();
        }catch (Exception e){
            //em.getTransaction().rollback();
        }
        return list;
    }
}
