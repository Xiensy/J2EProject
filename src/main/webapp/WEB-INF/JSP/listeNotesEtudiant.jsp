<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="module" class="com.mi4.richomml_projet_mi4.model.Module" scope="request"/>
<jsp:useBean id="selectString" class="java.lang.String" scope="request"/>
<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<h1>Notes du module : <%= module.getNom() %></h1>
<% if (enseignant.getId() == null || (enseignant.getId() != null && (! module.isEnseignantModule(enseignant.getId()) || ! enseignant.isAdmin()))) { %>
    <p>Uniquement les professeurs responsables du module peuvent modifier les notes</p>
    <p>Merci de vous <a href="<%= application.getContextPath()%>/do/seConnecter">connecter</a></p>
<% } else if (enseignant.getId() != null && (enseignant.isAdmin() || module.isEnseignantModule(enseignant.getId()))) { %>
<div>
    <a href="<%= application.getContextPath()%>/do/listeNotesEtudiant?idModule=<%= module.getId() %>&edit=true">Modifier les notes</a>
    <a id="bntAddEtudiant" href="#addEtudiant">Ajouter un étudiant</a>
</div>
<div id="addEtudiant" class="displayNone">
    <form method="post" action="<%= application.getContextPath()%>/do/submitNoteEtudiant">
        <table>
            <tr>
                <td>
                    <label for="idEtudiant">Etudiant</label>
                </td>
                <td>
                    <select id="idEtudiant" name="idEtudiant">
                        <option value="-1"></option>
                        <%= selectString %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="note">Note</label>
                </td>
                <td>
                    <input id="note" name="note" type="number" value="0" min="0" max="20">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" name="idModule" value="<%= module.getId() %>">
                    <input type="submit" name="addEtudiant" value="Ajouter l'étudiant">
                </td>
            </tr>
        </table>
    </form>
</div>
<% } %>
<table>
    <thead>
        <tr>
            <th>Nom étudiant</th>
            <th>Note</th>
        </tr>
    </thead>
    <tbody>
        <%for (Note note : module.getNotes()){ %>
            <tr>
                <td><a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= note.getEtudiant().getId() %>"><%= note.getEtudiant().getPrenom() + " " + note.getEtudiant().getNom() %></a></td>
                <td><%= note.getValeur() %></td>
            </tr>
        <% } %>
    </tbody>
</table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
<script type="text/javascript">

    function functionBntAddEtudiant() {
        var divAddEtudiant = document.getElementById('addEtudiant');
        if (! divAddEtudiant.classList.contains('displayNone')) {
            divAddEtudiant.classList.add('displayNone') }
        else {
            divAddEtudiant.classList.remove('displayNone')
        }
    }

    var bntAddEtudiant = document.getElementById("bntAddEtudiant")
    bntAddEtudiant.addEventListener('click', function() { functionBntAddEtudiant() });

</script>
</body>
</html>
