package services;

import Dao.employeDao;
import entity.*;
import javax.persistence.*;
import java.util.*;


public class employeServices implements employeDao{

    private static final String PERSISTENCE_UNIT_NAME = "default";
    private static EntityManagerFactory emf;
    private static EntityManager em;
    private static EntityManager emAdd;
    private static EntityManager emDel;
    private static EntityManager emUpd;
    private static EntityManager emGet;

    public employeServices() {
        emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        em = emf.createEntityManager();
        emAdd = emf.createEntityManager();
        emDel = emf.createEntityManager();
        emUpd = emf.createEntityManager();
        emGet = emf.createEntityManager();
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
        emUpd.getTransaction().begin();
        Employe employe = emUpd.find(Employe.class,e.getIdemploye());
        employe.setNomEmp(e.getNomEmp());
        employe.setPrenomEmp(e.getPrenomEmp());
        employe.setDateN(e.getDateN());
        employe.setNationnalite(e.getNationnalite());
        employe.setSituat_F(e.getSituat_F());
        employe.setSalaire(e.getSalaire());
        employe.setVille(e.getVille());
        employe.setNiveau(e.getNiveau());
        employe.setDepartement_id(e.getDepartement_id());
        emUpd.getTransaction().commit();
        return employe;
    }
    @Override
    public List<Employe> getAllEmployees() {
        String StrQuery = "SELECT e FROM Employe e";
        Query tq = em.createQuery(StrQuery, Employe.class);
        List<Employe>	listEmployee = tq.getResultList();
        return listEmployee;
    }

    @Override
    public List<Departement> getAllDep() {
        String StrQuery = "SELECT d FROM Departement d";
        Query tq = em.createQuery(StrQuery, Departement.class);
        List<Departement>	listDep = tq.getResultList();
        return listDep;
    }

    @Override
    public Employe getById(int id) {
        emGet.getTransaction().begin();
        Employe employe = emGet.find(Employe.class,id);
        return employe;
    }

}
