package services;

import Dao.*;
import entity.*;
import javax.persistence.*;
import java.util.*;

public class departementServices implements departementDao {
    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory emf;
    private static EntityManager em;
    private static EntityManager emAdd;
    private static EntityManager emDel1;
    private static EntityManager emUpd;
    private static EntityManager emGet;

    public departementServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
        emAdd = emf.createEntityManager();
        emDel1 = emf.createEntityManager();
        emUpd = emf.createEntityManager();
        emGet = emf.createEntityManager();
    }

    @Override
    public void save(Departement d) {
        emAdd.getTransaction().begin();
        emAdd.persist(d);
        emAdd.getTransaction().commit();
    }

    @Override
    public void delete(int id) {
        emDel1.getTransaction().begin();
        Departement d = emDel1.find(Departement.class,id);
        emDel1.remove(d);
        emDel1.getTransaction().commit();
    }

    @Override
    public List<Departement> getAllDepartements() {
        String StrQuery = "SELECT d FROM Departement d";
        Query tq = em.createQuery(StrQuery, Departement.class);
        List<Departement>	listDep = tq.getResultList();
        return listDep;
    }

    @Override
    public Departement getById(int id) {
        emGet.getTransaction().begin();
        Departement dep = emGet.find(Departement.class,id);
        return dep;
    }

    @Override
    public Departement update(Departement d) {
        emUpd.getTransaction().begin();
        Departement dep = emUpd.find(Departement.class,d.getDepartement_id());
        dep.setNomDepartement(d.getNomDepartement());
        emUpd.getTransaction().commit();
        return dep;
    }
}
