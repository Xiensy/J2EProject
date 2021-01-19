package com.mi4.richomml_projet_mi4;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

public class Controleur extends HttpServlet {
    private String urlIndex;
    private String urlListeEtudiants;
    private String urlDetails;
    private String urlListeAbsences;

    public void init() {
        urlIndex = getInitParameter("urlIndex");
        urlListeEtudiants = getInitParameter("urlListeEtudiants");
        urlListeAbsences = getInitParameter("urlListeAbsences");
        urlDetails = getInitParameter("urlDetails");

        GestionFactory.open();

        ///// INITIALISATION DE LA BD
        // Normalement l'initialisation se fait directement dans la base de données
        if ((GroupeDAO.getAll().size() == 0) && (EtudiantDAO.getAll().size() == 0)) {

            // Creation des groupes
            Groupe MIAM = GroupeDAO.create("miam");
            Groupe SIMO = GroupeDAO.create("SIMO");
            Groupe MESSI = GroupeDAO.create("MESSI");

            // Creation des étudiants
            EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM);
            EtudiantDAO.create("Philippe", "Martin", MIAM);
            EtudiantDAO.create("Mario", "Cortes-Cornax", MIAM);
            EtudiantDAO.create("Françoise", "Coat", SIMO);
            EtudiantDAO.create("Laurent", "Bonnaud", MESSI);
            EtudiantDAO.create("Sébastien", "Bourdon", MESSI);
            EtudiantDAO.create("Mathieu", "Gatumel", SIMO);

            // Creation des groupes
            Module MI1 = ModuleDAO.create("MI1");
            Module MI4 = ModuleDAO.create("MI4");

            // Liés groupe et module
            //MIAM.addModule(MI1);
            //MIAM.addModule(MI4);
            //SIMO.addModule(MI1);

            MI1.addGroupe(MIAM);
            MI4.addGroupe(MIAM);
            MI1.addGroupe(SIMO);

            //GroupeDAO.update(MIAM);
            //GroupeDAO.update(SIMO);

            ModuleDAO.update(MI1);
            ModuleDAO.update(MI4);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String methode = request.getMethod().toLowerCase();

        String action = request.getPathInfo();
        if (action == null){
            action = "/";
        }

        if (methode.equals("get") && action.equals("/listeEtudiants")) {
            showEtudiants(request, response);
        } else if (methode.equals("get") && action.equals("/details")) {
            showStudentDetails(request, response);
        } else if (methode.equals("get") && action.equals("/listeAbsences")) {
            showAbsences(request, response);
        } else {
            loadJSP(urlIndex, request, response);
        }
    }

    private void showEtudiants(HttpServletRequest request, HttpServletResponse response){
        List<Etudiant> etudiants = EtudiantDAO.getAll();

        request.setAttribute("etudiants", etudiants);

        loadJSP(urlListeEtudiants, request, response);
    }

    private void showStudentDetails(HttpServletRequest request, HttpServletResponse response){
        int idEtudiant = Integer.parseInt(request.getParameter("idEtudiant"));

        Etudiant etudiant = EtudiantDAO.getEtudiantById(idEtudiant);
        int nbAbsencesEtudiant = etudiant.getNbAbsences();

        request.setAttribute("etudiant", etudiant);
        request.setAttribute("nbAbsencesEtudiant", nbAbsencesEtudiant);

        loadJSP(urlDetails, request, response);
    }

    private void showAbsences(HttpServletRequest request, HttpServletResponse response){
        List<Etudiant> etudiants = EtudiantDAO.getAll();

        request.setAttribute("etudiants", etudiants);

        loadJSP(urlListeAbsences, request, response);
    }

    private void loadJSP(String jsp, HttpServletRequest req, HttpServletResponse res){
        try {
            this.getServletContext().getRequestDispatcher(jsp).forward(req, res);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}