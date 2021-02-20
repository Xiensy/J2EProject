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

    @ManyToMany
    private List<Enseignant> enseignants;

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

    public List<Enseignant> getEnseignants() {
        return enseignants;
    }

    public void setEnseignants(List<Enseignant> enseignants) {
        this.enseignants = enseignants;
    }

    public void addEnseignants(Enseignant enseignant) {
        this.enseignants.add(enseignant);
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
        List<Etudiant> etudiants = new ArrayList<>();
        for (Note note : this.notes) {
            etudiants.add(note.getEtudiant());
        }
        return etudiants;
    }

    public List<Integer> getAllIdEtudiant() {
        List<Integer> idEtudiants = new ArrayList<>();
        for (Note note : this.notes) {
            idEtudiants.add(note.getEtudiant().getId());
        }
        return idEtudiants;
    }

    public String getSelectAllEtudiantsModule() {
        List<Etudiant> allEtudiants = new ArrayList<>(EtudiantDAO.getAll());
        List<Integer> etudiantsIdModule = this.getAllIdEtudiant();

        String selectEtudiant = "";
        for (Etudiant etudiant : allEtudiants) {
            if (! etudiantsIdModule.contains(etudiant.getId())) {
                selectEtudiant += "<option value='" + etudiant.getId() + "'>" + etudiant.getNomComplet() + "</option>";
            }
        }
        return selectEtudiant;
    }

    public boolean isEnseignantModule(int idEnseignant) {
        boolean isEnseignantModule = false;
        int i = 0;
        while (i < this.enseignants.size() && ! isEnseignantModule) {
            isEnseignantModule = this.enseignants.get(i).getId() == idEnseignant;
            i++;
        }
        return isEnseignantModule;
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
