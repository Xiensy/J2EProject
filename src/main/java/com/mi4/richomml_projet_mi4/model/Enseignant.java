package com.mi4.richomml_projet_mi4.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Entity implementation class for Entity: Enseignant
 */
@Entity
public class Enseignant implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String prenom;

    @Column(nullable = false)
    private String nom;

    @Column(nullable = false)
    private String identifiant;

    @Column(nullable = false)
    private String mdp;

    @Column(nullable = false)
    private boolean admin;

    @ManyToMany
    private List<Module> modules;

    private static final long serialVersionUID = 1L;

    public Enseignant() {
        super();
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNomComplet() {
        return this.getPrenom() + " " + this.getNom();
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public List<Module> getModules() {
        return modules;
    }

    public void setModules(List<Module> modules) {
        this.modules = modules;
    }

    public void addModule(Module module){
        modules.add(module);
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public static String getSelectAllEnseignant() {
        List<Enseignant> allEnseignant = new ArrayList<>(EnseignantDAO.getAll());

        String select = "";
        for (Enseignant enseignant : allEnseignant) {
            select += "<option value='" + enseignant.getId() + "'>" + enseignant.getNomComplet() + "</option>";
        }
        return select;
    }

    @Override
    public String toString() {
        return "[" + this.getId() + "] " + this.getPrenom() + " " + this.getNom();
    }
}
