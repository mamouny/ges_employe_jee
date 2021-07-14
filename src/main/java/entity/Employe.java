package entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "employe")
public class Employe {
    @Id
    private int idemploye;

    @Column(name = "depatement_id")
    private int departement_id;

    @Column(name = "nomEmp")
    private String nomEmp;

    @Column(name = "prenomEmp")
    private String prenomEmp;

    @Column(name = "dateN")
    private String dateN;

    @Column(name = "nationnalite")
    private String nationnalite;

    @Column(name = "situat_F")
    private String situat_F;

    @Column(name = "niveau")
    private String niveau;
    @Column(name = "ville")
    private String ville;

    @Column(name = "salaire")
    private Double salaire;

    public Employe() {
    }

    public String getDateN() {
        return dateN;
    }

    public void setDateN(String dateN) {
        this.dateN = dateN;
    }

    public Double getSalaire() {
        return salaire;
    }

    public void setSalaire(Double salaire) {
        this.salaire = salaire;
    }

    public int getIdemploye() {
        return idemploye;
    }

    public int getDepartement_id() {
        return departement_id;
    }

    public String getNomEmp() {
        return nomEmp;
    }

    public String getPrenomEmp() {
        return prenomEmp;
    }


    public String getNationnalite() {
        return nationnalite;
    }

    public String getSituat_F() {
        return situat_F;
    }

    public String getNiveau() {
        return niveau;
    }

    public String getVille() {
        return ville;
    }

    public void setIdemploye(int idemploye) {
        this.idemploye = idemploye;
    }

    public void setDepartement_id(int departement_id) {
        this.departement_id = departement_id;
    }

    public void setNomEmp(String nomEmp) {
        this.nomEmp = nomEmp;
    }

    public void setPrenomEmp(String prenomEmp) {
        this.prenomEmp = prenomEmp;
    }


    public void setNationnalite(String nationnalite) {
        this.nationnalite = nationnalite;
    }

    public void setSituat_F(String situat_F) {
        this.situat_F = situat_F;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }
}
