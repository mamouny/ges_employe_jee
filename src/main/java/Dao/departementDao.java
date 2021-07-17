package Dao;

import entity.*;
import java.util.List;

public interface departementDao {
    public void save(Departement d);
    public void delete(int id);
    public Departement update(Departement d);
    List<Departement> getAllDepartements();
    public Departement getById(int id);
}
