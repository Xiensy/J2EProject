<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>
<jsp:useBean id="selectModule" class="java.lang.String" scope="request"/>
<jsp:useBean id="selectEnseignant" class="java.lang.String" scope="request"/>
<jsp:useBean id="selectGroupe" class="java.lang.String" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<% if (enseignant.getId() == null) {%>
<h1>Se connecter</h1>
<div>
    <form method="post" action="<%= application.getContextPath()%>/do/submitSeConnecter">
        <table id="tableSeConnecter" cellspacing="0">
            <tr>
                <td>
                    <label for="identifiant">Identifiant</label>
                </td>
                <td>
                    <input type="text" id="identifiant" name="identifiant" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="mdp">Mot de passe</label>
                </td>
                <td>
                    <input id="mdp" name="mdp" type="password" required>
                </td>
            </tr>
        </table>
        <input type="submit" name="seConnecter" value="Se connecter">
    </form>
</div>
<% } else { %>
    <h1><%= enseignant.getNomComplet() %></h1>
    <div>
        <a href="<%= application.getContextPath()%>/do/submitSeConnecter?seDeconnecter=true">Se déconnecter</a>
    </div>
    <% if (enseignant.isAdmin()) { %>
    <div>
        <a href="">Ajout d'un etudiant</a>
        <form action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomEtudiant">Nom</label>
                    </td>
                    <td>
                        <input type="text" id="nomEtudiant" name="nomEtudiant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomEtudiant">Prénom</label>
                    </td>
                    <td>
                        <input type="text" id="prenomEtudiant" name="prenomEtudiant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="groupeEtudiant">Groupe</label>
                    </td>
                    <td>
                        <select id="groupeEtudiant" name="groupeEtudiant">
                            <%= selectGroupe %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="createEtudiant" value="Crée l'étudiant">
                    </td>
                </tr>
            </table>
        </form>

        <a href="">Ajout d'un enseignant</a>
        <form action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomEnseignant">Nom :</label>
                    </td>
                    <td>
                        <input type="text" id="nomEnseignant" name="nomEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomEnseignant">Prénom :</label>
                    </td>
                    <td>
                        <input type="text" id="prenomEnseignant" name="prenomEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="identifiantEnseignant">Identifiant :</label>
                    </td>
                    <td>
                        <input type="text" id="identifiantEnseignant" name="identifiantEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="adminEnseignant">Admin :</label>
                    </td>
                    <td>
                        <input type="checkbox" name="adminEnseignant" id="adminEnseignant">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="mdpEnseignant">Mot de passe :</label>
                    </td>
                    <td>
                        <input type="password" id="mdpEnseignant" name="mdpEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="createEnseignant" value="Crée l'enseignant">
                    </td>
                </tr>
            </table>
        </form>

        <a href="">Ajout d'un enseigant responsable</a>
        <form action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="idModule">Module</label>
                    </td>
                    <td>
                        <select id="idModule" name="idModule">
                            <%= selectModule %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="idEnseignantModule">Enseignant</label>
                    </td>
                    <td>
                        <select id="idEnseignantModule" name="idEnseignantModule">
                            <%= selectEnseignant %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="addEnseigantToModule" value="Ajout d'un enseigant responsable">
                    </td>
                </tr>
            </table>
        </form>

        <a href="">Ajout d'un module</a>
        <form action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomModule">Nom</label>
                    </td>
                    <td>
                        <input type="text" id="nomModule" name="nomModule" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="idEnseignantNewModule">Enseignant respondable</label>
                    </td>
                    <td>
                        <select id="idEnseignantNewModule" name="idEnseignantNewModule">
                            <%= selectEnseignant %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="addModule" value="Ajout du module">
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <% } %>
<% } %>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
