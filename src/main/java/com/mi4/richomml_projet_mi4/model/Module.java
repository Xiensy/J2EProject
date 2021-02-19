package com.mi4.richomml_projet_mi4.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Module implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(unique = true, nullable = false)
    private String nom;

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "module_groupe",
            joinColumns = @JoinColumn(name = "module_id"),
            inverseJoinColumns = @JoinColumn(name = "groupe_id")
    )
    private List<Groupe> groupes = new ArrayList<>();

    @OneToMany
    private List<Note> notes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Groupe> getGroupes() {
        return groupes;
    }

    public void addGroupe(Groupe groupe) {
        groupes.add(groupe);
        //groupe.getModules().add(this);
    }

    public void addNote(Note note){
        notes.add(note);
    }

    public List<Note> getNotes() {
        return notes;
    }

    public float getMoyenneNotes() {
        float moyenne = 0;
        for (Note note : this.notes) {
            moyenne += note.getValeur();
        }
        return moyenne / this.notes.size();
    }

    public void setNotes(List<Note> notes) {
        this.notes = notes;
    }

    public List<Etudiant> getAllEtudiant() {
        ArrayList<Etudiant> etudiants = new ArrayList<>();
        for (Note note : this.notes) {
            etudiants.add(note.getEtudiant());
        }
        return etudiants;
    }

    public String getSelectAllEtudiantsModule() {
        List<Etudiant> allEtudiants = EtudiantDAO.getAll();

        if (this.getAllEtudiant().size() > 0) {
            allEtudiants.removeAll(this.getAllEtudiant());
        }
        String selectEtudiant = "";
        for (Etudiant etudiant : allEtudiants) {
            selectEtudiant += "<option value='" + etudiant.getId() + "'>" + etudiant.getNomComplet() + "</option>";
        }
        return selectEtudiant;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Module)) return false;
        return id != null && id.equals(((Module) o).id);
    }

    @Override
    public int hashCode() {
        return id;
    }
}
