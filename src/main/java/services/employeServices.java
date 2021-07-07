package services;

import Dao.employeDao;
import entity.Employe;
import entity.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

public class employeServices implements employeDao{
    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory emf;
    private static EntityManager em;


    public employeServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
    }


    @Override
    public int save(Employe e) {
        return 0;
    }

    @Override
    public List<Employe> getAllEmployees() {
        String StrQuery = "SELECT e FROM Employe e";
        Query tq = em.createQuery(StrQuery, Employe.class);
        List<Employe>	listEmployee = tq.getResultList();
        return listEmployee;
    }
}
