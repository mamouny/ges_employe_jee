package Dao;

import entity.Employe;

import java.util.List;

public interface employeDao {
    int save(Employe e);
    List<Employe> getAllEmployees();

}
