package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "departement")
public class Departement {

    @Id
    @Column(name = "idDepatement")
    private int departement_id;

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
