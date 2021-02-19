package com.mi4.richomml_projet_mi4.model;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {

    public static Note create(Etudiant etudiant, Module module, int valeur) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        // create
        em.getTransaction().begin();

        // create new groupe
        Note note = new Note();
        note.setEtudiant(etudiant);
        note.setModule(module);
        note.setValeur(valeur);
        em.persist(note);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return note;
    }

    public static Note update(Note note) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // Attacher une entité persistante (etudiant) à l’EntityManager courant  pour réaliser la modification
        em.merge(note);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return note;
    }

    public static List<Note> getNotesByEtudiant(Etudiant etudiant){

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();
        List<Note> notes = new ArrayList<>();
        int idetu = etudiant.getId();

        //
        Query q = em.createQuery("SELECT n FROM Note n WHERE n.etudiant = :id").setParameter("id", idetu);

        notes = q.getResultList();

        return notes;

    }


    public static Note getNoteById(int id) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        Note note = em.find(Note.class, id);
        // etu est maintenant un objet de la classe Etudiant
        // ou NULL si l'étudiant n'existe pas


        // Close the entity manager
        em.close();

        return note;
    }

}
