package com.mi4.richomml_projet_mi4.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Entity implementation class for Entity: Groupe
 */
@Entity
public class Groupe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Integer id;

    @Column(unique = true, nullable = false)
    private String nom;

    @OneToMany(mappedBy = "groupe", fetch = FetchType.LAZY)    // LAZY = fetch when needed, EAGER = fetch immediately
    private List<Etudiant> etudiants;

    //@ManyToMany(mappedBy = "groupes", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    //private List<Module> modules = new ArrayList<>();

    public Groupe() {
        super();
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom.toUpperCase();
    }

    public List<Etudiant> getEtudiants() {
        return this.etudiants;
    }

    public int getNbAbsences() {
        int nbAbcences = 0;
        for (Etudiant etu : this.etudiants) {
            nbAbcences += etu.getNbAbsences();
        }
        return nbAbcences;
    }
	/*public List<Module> getModules() {
		return modules;
	}

	public void addModule(Module module) {
		if (!modules.contains(module)) {
			modules.add(module);
			module.addGroupe(this);
		}
	}*/

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Groupe)) return false;
        return id != null && id.equals(((Groupe) o).id);
    }

    @Override
    public int hashCode() {
        return id;
    }
}
