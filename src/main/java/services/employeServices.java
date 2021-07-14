package services;

import Dao.employeDao;
//import entity.Employe;
import entity.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class employeServices implements employeDao{
    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory emf;
    private static EntityManager em;
    private static EntityManager emAdd;
    private static EntityManager emDel;
    private static EntityManager emUpd;



    public employeServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
        emAdd = emf.createEntityManager();
        emDel = emf.createEntityManager();
        emUpd = emf.createEntityManager();
    }


    @Override
    public void save(Employe e) {
        emAdd.getTransaction().begin();
        emAdd.persist(e);
        emAdd.getTransaction().commit();
    }

    @Override
    public void delete(int id) {
        emDel.getTransaction().begin();
        int idemployee = (int) id;
        Employe emp = emDel.find(Employe.class,idemployee);
        emDel.remove(emp);
        emDel.getTransaction().commit();
    }

    @Override
    public Employe update(Employe e) {
        return null;
    }

    @Override
    public List<Employe> getAllEmployees() {
        String StrQuery = "SELECT e FROM Employe e";
        Query tq = em.createQuery(StrQuery, Employe.class);
        List<Employe>	listEmployee = tq.getResultList();
        return listEmployee;
    }

}
