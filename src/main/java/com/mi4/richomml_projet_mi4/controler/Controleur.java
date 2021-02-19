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
            ModuleDAO.update(MI1);
            ModuleDAO.update(MI4);

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
        } else if (action.equals("/submitNoteEtudiant")) {
            submitEtudiantNotes(request, response);
        } else if (action.equals("/editerEtudiant")){
            showEditerEtudiant(request, response);
        } else if (action.equals("/submitEditerEtudiant")){
            submitEditerEtudiant(request, response);
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
        String[] valeurNotes = request.getParameterValues("notes");

        int i = 0;
        for (Note note : etudiant.getNotes()){
            note.setValeur(Integer.parseInt(valeurNotes[i]));
            NoteDAO.update(note);
            i++;
        }

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

    private void submitEtudiantNotes(HttpServletRequest request, HttpServletResponse response){

        System.out.println();
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

        int idModule = Integer.parseInt(request.getParameter("idModule"));

        Module module = ModuleDAO.getModuleById(idModule);

        request.setAttribute("module", module);

        loadJSP(urlNotesEtudiant, request, response);
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
