package com.mi4.richomml_projet_mi4.controler;

import com.mi4.richomml_projet_mi4.model.*;
import com.mi4.richomml_projet_mi4.model.Module;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Controleur extends HttpServlet {
    private String urlIndex;
    private String urlListeEtudiants;
    private String urlDetails;
    private String urlListeAbsences;
    private String urlGroupeAbsences;
    private String urlNotesEtudiant;
    private String urlListeGroupes;
    private String urlListeModuleNote;
    private String urlEditNotesEtudiant;
    private String urlEditEtudiant;
    private String urlSeConnecter;
    public void init() {
        urlIndex = getInitParameter("urlIndex");
        urlListeEtudiants = getInitParameter("urlListeEtudiants");
        urlListeAbsences = getInitParameter("urlListeAbsences");
        urlGroupeAbsences = getInitParameter("urlGroupeAbsences");
        urlNotesEtudiant = getInitParameter("urlNotesEtudiant");
        urlDetails = getInitParameter("urlDetails");
        urlListeGroupes = getInitParameter("urlListeGroupes");
        urlListeModuleNote = getInitParameter("urlListeModuleNote");
        urlEditNotesEtudiant = getInitParameter("urlEditNotesEtudiant");
        urlEditEtudiant = getInitParameter("urlEditEtudiant");
        urlSeConnecter = getInitParameter("urlSeConnecter");

        GestionFactory.open();

        ///// INITIALISATION DE LA BD
        // Normalement l'initialisation se fait directement dans la base de données
        if ((GroupeDAO.getAll().size() == 0) && (EtudiantDAO.getAll().size() == 0)) {

            // Creation des groupes
            Groupe MIAM = GroupeDAO.create("miam");
            Groupe SIMO = GroupeDAO.create("SIMO");
            Groupe MESSI = GroupeDAO.create("MESSI");

            // Creation des étudiants
            Etudiant etu1 = EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM);
            EtudiantDAO.create("Philippe", "Martin", MIAM);
            EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM);
            EtudiantDAO.create("Françoise", "Coat", SIMO);
            EtudiantDAO.create("Laurent", "Bonnaud", MESSI);
            EtudiantDAO.create("Sébastien", "Bourdon", MESSI);
            EtudiantDAO.create("Mathieu", "Gatumel", SIMO);

            // Creation des groupes
            Module MI1 = ModuleDAO.create("MI1");
            Module MI4 = ModuleDAO.create("MI4");

            Note n1 = NoteDAO.create(etu1, MI1, 15);
            Note n2 = NoteDAO.create(etu1, MI4, 12);

            MI1.addNote(n1);
            MI4.addNote(n2);

            etu1.addNote(n1);
            etu1.addNote(n2);

            // Liés groupe et module
            //MIAM.addModule(MI1);
            //MIAM.addModule(MI4);
            //SIMO.addModule(MI1);

            MI1.addGroupe(MIAM);
            MI4.addGroupe(MIAM);
            MI1.addGroupe(SIMO);

            //GroupeDAO.update(MIAM);
            //GroupeDAO.update(SIMO);

            EtudiantDAO.update(etu1);

            Enseignant admin = EnseignantDAO.create("admin", "admin", "admin.admin", "admin", true);
            Enseignant ens1 = EnseignantDAO.create("Yoann", "Domingo", "yoann.domingo", "mdpyd", false);
            Enseignant ens2 = EnseignantDAO.create("Lucas", "Richomme", "Lucas.richomme", "mdplr", false);

            ens1.addModule(MI4);
            ens2.addModule(MI1);

            MI4.addEnseignants(ens1);
            MI1.addEnseignants(ens2);

            ModuleDAO.update(MI4);
            ModuleDAO.update(MI1);

            EnseignantDAO.update(ens1);
            EnseignantDAO.update(ens2);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String methode = request.getMethod().toLowerCase();

        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }

        if (methode.equals("get") && action.equals("/listeEtudiants")) {
            showEtudiants(request, response);
        } else if (methode.equals("get") && action.equals("/details")) {
            showStudentDetails(request, response);
        }  else if (methode.equals("get") && action.equals("/groupeAbsences")) {
            showGroupeAbsences(request, response);
        }else if (methode.equals("get") && action.equals("/listeAbsences")) {
            showAbsences(request, response);
        } else if (methode.equals("get") && action.equals("/addAbsences")) {
            addAbsences(request, response);
        } else if (methode.equals("get") && action.equals("/removeAbsences")) {
            removeAbsences(request, response);
        } else if (methode.equals("get") && action.equals("/listeNotesEtudiant")) {
            showEtudiantNotes(request, response);
        } else if (methode.equals("get") && action.equals("/listeGroupes")) {
            showListeGroupes(request, response);
        } else if (methode.equals("get") && action.equals("/listeModuleNote")) {
            showListeModuleNote(request, response);
        } else if (methode.equals("get") && action.equals("/seConnecter")) {
            showSeConnecter(request, response);
        } else if (action.equals("/submitNoteEtudiant")) {
            submitEtudiantNotes(request, response);
        } else if (action.equals("/editerEtudiant")){
            showEditerEtudiant(request, response);
        } else if (action.equals("/submitEditerEtudiant")){
            submitEditerEtudiant(request, response);
        } else if (action.equals("/submitSeConnecter")){
            submitSeConnecter(request, response);
        } else if (action.equals("/submitAdmin")){
            submitAdmin(request, response);
        } else {
            loadJSP(urlIndex, request, response);
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
        doGet(request, response);
    }

    private void showEtudiants(HttpServletRequest request, HttpServletResponse response){
        List<Etudiant> etudiants = EtudiantDAO.getAll();

        request.setAttribute("etudiants", etudiants);

        loadJSP(urlListeEtudiants, request, response);
    }

    private void showListeGroupes(HttpServletRequest request, HttpServletResponse response){
        List<Groupe> groupes = GroupeDAO.getAll();

        request.setAttribute("groupes", groupes);

        loadJSP(urlListeGroupes, request, response);
    }

    private void showListeModuleNote(HttpServletRequest request, HttpServletResponse response){
        List<Module> modules = ModuleDAO.getAll();

        request.setAttribute("modules", modules);

        loadJSP(urlListeModuleNote, request, response);
    }

    private void showSeConnecter(HttpServletRequest request, HttpServletResponse response){
        String selectModule = Module.getSelectAllModule();
        String selectEnseignant = Enseignant.getSelectAllEnseignant();
        String selectGroupe = Groupe.getSelectAllGroupe();

        request.setAttribute("selectModule", selectModule);
        request.setAttribute("selectEnseignant", selectEnseignant);
        request.setAttribute("selectGroupe", selectGroupe);

        loadJSP(urlSeConnecter, request, response);
    }
    private void submitSeConnecter(HttpServletRequest request, HttpServletResponse response){

        if (request.getParameter("seConnecter") != null) {
            Enseignant enseignant = EnseignantDAO.getEnseingantByIdentifiant(request.getParameter("identifiant"));
            if (enseignant != null && request.getParameter("mdp") != null && enseignant.getMdp().equals(request.getParameter("mdp"))) {
                    request.getSession().setAttribute("enseignant", enseignant);
            }
        } else if (request.getParameter("seDeconnecter") != null) {
            request.getSession().removeAttribute("enseignant");
        }

        showSeConnecter(request, response);
    }

    private void showStudentDetails(HttpServletRequest request, HttpServletResponse response){
        int idEtudiant = Integer.parseInt(request.getParameter("idEtudiant"));

        Etudiant etudiant = EtudiantDAO.getEtudiantById(idEtudiant);
        int nbAbsencesEtudiant = etudiant.getNbAbsences();

        request.setAttribute("etudiant", etudiant);
        request.setAttribute("nbAbsencesEtudiant", nbAbsencesEtudiant);

        loadJSP(urlDetails, request, response);
    }

    private void showEtudiantNotes(HttpServletRequest request, HttpServletResponse response){
        int idModule = Integer.parseInt(request.getParameter("idModule"));

        Module module = ModuleDAO.getModuleById(idModule);

        request.setAttribute("module", module);
        if ("true".equals(request.getParameter("edit"))) {
            loadJSP(urlEditNotesEtudiant, request, response);
        } else {
            String selectString = module.getSelectAllEtudiantsModule();
            request.setAttribute("selectString", selectString);

            loadJSP(urlNotesEtudiant, request, response);
        }
    }

    private void submitEditerEtudiant(HttpServletRequest request, HttpServletResponse response){
        String idEtudiant = request.getParameter("idEtudiant");
        String nbAbsences = request.getParameter("nbAbsences");

        Etudiant etudiant = EtudiantDAO.getEtudiantById(Integer.parseInt(idEtudiant));

        String prenom = request.getParameter("prenomEtudiant");
        String nom = request.getParameter("nomEtudiant");
        Groupe groupe = GroupeDAO.getGroupeById(Integer.parseInt(request.getParameter("groupeEtudiant")));

        if (!"".equals(prenom)){
            etudiant.setPrenom(prenom);
        }

        if (!"".equals(nom)){
            etudiant.setNom(nom);
        }

        etudiant.setGroupe(groupe);
        etudiant.setNbAbsences(Integer.parseInt(nbAbsences));

        EtudiantDAO.update(etudiant);

        request.setAttribute("etudiant", etudiant);
        loadJSP(urlDetails, request, response);
    }

    private void showEditerEtudiant(HttpServletRequest request, HttpServletResponse response){
        int idEtudiant = Integer.parseInt(request.getParameter("idEtudiant"));

        Etudiant etudiant = EtudiantDAO.getEtudiantById(idEtudiant);
        List<Groupe> groupes = GroupeDAO.getAll();

        request.setAttribute("etudiant", etudiant);
        request.setAttribute("groupes", groupes);

        loadJSP(urlEditEtudiant, request, response);
    }

    private void submitAdmin(HttpServletRequest request, HttpServletResponse response){
        if (request.getParameter("createEtudiant") != null) {
            String nomEtudiant = request.getParameter("nomEtudiant");
            String prenomEtudiant = request.getParameter("prenomEtudiant");
            String groupeEtudiantStr = request.getParameter("groupeEtudiant");
            Groupe groupeEtudiant = GroupeDAO.getGroupeById(Integer.parseInt(groupeEtudiantStr));

            Etudiant newEtu = EtudiantDAO.create(nomEtudiant, prenomEtudiant, groupeEtudiant);

            groupeEtudiant.addEtudiant(newEtu);
            GroupeDAO.update(groupeEtudiant);

        } else if (request.getParameter("createEnseignant") != null) {
            String nomEnseignant = request.getParameter("nomEnseignant");
            String prenomEnseignant = request.getParameter("prenomEnseignant");
            String identifiantEnseignant = request.getParameter("identifiantEnseignant");
            String adminEnseignant = request.getParameter("adminEnseignant");
            String mdpEnseignant = request.getParameter("mdpEnseignant");

            if (EnseignantDAO.getEnseingantByIdentifiant(identifiantEnseignant) == null) {
                EnseignantDAO.create(nomEnseignant, prenomEnseignant, identifiantEnseignant, mdpEnseignant, "on".equals(adminEnseignant));
            }

        } else if (request.getParameter("addEnseigantToModule") != null) {
            String idModule = request.getParameter("idModule");
            String idEnseignantModule = request.getParameter("idEnseignantModule");

            Module module = ModuleDAO.getModuleById(Integer.parseInt(idModule));
            Enseignant enseignant = EnseignantDAO.getEnseingantById(Integer.parseInt(idEnseignantModule));


            if (! module.isEnseignantModule(enseignant.getId())) {

                module.addEnseignants(enseignant);
                ModuleDAO.update(module);
            }



        } else if (request.getParameter("addModule") != null) {
            String nomModule = request.getParameter("nomModule");
            String idEnseignantNewModule = request.getParameter("idEnseignantNewModule");

            Module module = ModuleDAO.create(nomModule);
            Enseignant enseignant = EnseignantDAO.getEnseingantById(Integer.parseInt(idEnseignantNewModule));

            module.addEnseignants(enseignant);
            enseignant.addModule(module);

            ModuleDAO.update(module);
        }

        showSeConnecter(request, response);
    }

    private void submitEtudiantNotes(HttpServletRequest request, HttpServletResponse response){

        if (request.getParameter("edit") != null) {
            String[] idNotes = request.getParameterValues("notes");
            String[] notesValues = request.getParameterValues("noteValeurs");

            for (int i = 0; i < idNotes.length; i++) {
                Note note = NoteDAO.getNoteById(Integer.parseInt(idNotes[i]));
                int noteValeur = Integer.parseInt(notesValues[i]);
                if (noteValeur != note.getValeur()) {
                    note.setValeur(noteValeur);
                    NoteDAO.update(note);
                }
            }
        } else if (request.getParameter("addEtudiant") != null) {
            String idEtudiant = request.getParameter("idEtudiant");
            System.out.println(idEtudiant);
            if (idEtudiant != null && Integer.parseInt(idEtudiant) != -1) {

                Module module = ModuleDAO.getModuleById(Integer.parseInt(request.getParameter("idModule")));
                Etudiant etudiant = EtudiantDAO.getEtudiantById(Integer.parseInt(idEtudiant));
                int noteValeur = Integer.parseInt(request.getParameter("note"));

                Note note = NoteDAO.create(etudiant, module, noteValeur);

                module.addNote(note);
                etudiant.addNote(note);

                ModuleDAO.update(module);
                EtudiantDAO.update(etudiant);
            }
        }

        showEtudiantNotes(request, response);
    }

    private void showGroupeAbsences(HttpServletRequest request, HttpServletResponse response) {
        List<Groupe> groupes = GroupeDAO.getAll();

        request.setAttribute("groupes", groupes);

        loadJSP(urlGroupeAbsences, request, response);

    }

    private void showAbsences(HttpServletRequest request, HttpServletResponse response){

        int idGroupe =Integer.parseInt(request.getParameter("idGroupe"));
        Groupe groupe = GroupeDAO.getGroupeById(idGroupe);

        request.setAttribute("groupe", groupe);

        loadJSP(urlListeAbsences, request, response);
    }

    private void addAbsences(HttpServletRequest request, HttpServletResponse response){
        int idEtudiant = Integer.parseInt(request.getParameter("idEtudiant"));

        EtudiantDAO.addAbsences(idEtudiant, 1);

        showAbsences(request, response);
    }

    private void removeAbsences(HttpServletRequest request, HttpServletResponse response){
        int idEtudiant = Integer.parseInt(request.getParameter("idEtudiant"));

        EtudiantDAO.addAbsences(idEtudiant, -1);

        showAbsences(request, response);
    }


    private void loadJSP(String jsp, HttpServletRequest req, HttpServletResponse res){
        try {
            this.getServletContext().getRequestDispatcher(jsp).forward(req, res);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
