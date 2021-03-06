package com.mi4.richomml_projet_mi4.model;


import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class EnseignantDAO {


    public static Enseignant getEnseingantById(int id) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        Enseignant enseignant = em.find(Enseignant.class, id);
        // etu est maintenant un objet de la classe Etudiant
        // ou NULL si l'étudiant n'existe pas


        // Close the entity manager
        em.close();

        return enseignant;
    }


    public static Enseignant create(String prenom, String nom, String identifiant, String mdp, boolean admin) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // create new etudiant
        Enseignant enseignant = new Enseignant();
        enseignant.setPrenom(prenom);
        enseignant.setNom(nom);
        enseignant.setIdentifiant(identifiant);
        enseignant.setMdp(mdp);
        enseignant.setAdmin(admin);
        em.persist(enseignant);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return enseignant;
    }

    public static Enseignant update(Enseignant enseignant) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // Attacher une entité persistante (etudiant) à l’EntityManager courant  pour réaliser la modification
        em.merge(enseignant);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return enseignant;
    }


    public static void remove(Enseignant enseignant) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // Retrouver l'entité persistante et ses liens avec d'autres entités en vue de la suppression
        enseignant = em.find(Enseignant.class, enseignant.getId());
        em.remove(enseignant);

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        // if EclipseLink cache enable -->
        // GestionFactory.factory.getCache().evictAll();
    }

    public static void remove(int id) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        //
        em.createQuery("DELETE FROM Enseignant AS e WHERE e.id = :id")
                .setParameter("id", id)
                .executeUpdate();

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        // if EclipseLink cache enable -->
        // GestionFactory.factory.getCache().evictAll();
    }

    public static int removeAll() {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        //
        em.getTransaction().begin();

        // RemoveAll
        int deletedCount = em.createQuery("DELETE FROM Enseignant").executeUpdate();

        // Commit
        em.getTransaction().commit();

        // Close the entity manager
        em.close();

        return deletedCount;
    }

    // Retourne l'ensemble des etudiants
    public static List<Enseignant> getAll() {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        // Recherche 
        Query q = em.createQuery("SELECT e FROM Enseignant e");

        @SuppressWarnings("unchecked")
        List<Enseignant> listEnseignant = q.getResultList();

        return listEnseignant;
    }

    public static Enseignant getEnseingantByIdentifiant(String identifiant) {

        // Creation de l'entity manager
        EntityManager em = GestionFactory.factory.createEntityManager();

        Query q = em.createQuery("SELECT e FROM Enseignant e WHERE e.identifiant='" + identifiant + "'");

        List<Enseignant> enseignants = q.getResultList();
        Enseignant enseignant = null;
        if (enseignants.size() > 0) {
            enseignant = enseignants.get(0);
        }
        return enseignant;
    }

}
