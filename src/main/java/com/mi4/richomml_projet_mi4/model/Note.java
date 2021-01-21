package com.mi4.richomml_projet_mi4.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Note implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne
    private Etudiant etudiant;

    @ManyToOne
    private Module module;

    @Column(nullable = false)
    private int valeur;

    public Note(){
        super();
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public int getValeur() {
        return valeur;
    }

    public Integer getId() {
        return id;
    }

    public Module getModule() {
        return module;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public void setValeur(int valeur) {
        this.valeur = valeur;
    }
}
