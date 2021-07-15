package entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "departement")
public class Departement {

    @Id
    @Column(name = "idDepartement")
    private int departement_id;

    @OneToMany
    private List<Employe> employes;

    public List<Employe> getEmployes() {
        return employes;
    }

    public void setEmployes(List<Employe> employes) {
        this.employes = employes;
    }

    @Column(name = "nomDepartement")
    private String nomDepartement;

    public Departement() {
    }

    public int getDepartement_id() {
        return departement_id;
    }

    public String getNomDepartement() {
        return nomDepartement;
    }

    public void setDepartement_id(int departement_id) {
        this.departement_id = departement_id;
    }

    public void setNomDepartement(String nomDepartement) {
        this.nomDepartement = nomDepartement;
    }

}
