package Dao;

import entity.*;

import java.util.List;

public interface employeDao {
    public void save(Employe e);
    public void delete(int id);
    public Employe update(Employe e);
    List<Employe> getAllEmployees();
    List<Departement> getAllDep();
    public Employe getById(int id);

}
