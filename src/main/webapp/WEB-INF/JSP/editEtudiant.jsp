<%@ page import="com.mi4.richomml_projet_mi4.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>
<jsp:useBean id="groupes" class="java.util.List<com.mi4.richomml_projet_mi4.model.Groupe>" scope="request"/>
<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>

<html>
<head>
    <title><%= etudiant.getPrenom() + " " + etudiant.getNom() %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<% if (enseignant.getId() != null) { %>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>

<form action="<%=application.getContextPath()%>/do/submitEditerEtudiant" method="post">
    <input id="idEtudiant" name="idEtudiant" type="hidden" value="<%= etudiant.getId() %>">
    <h1>Edition de l'étudiant : <jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/></h1>
    <table>
        <tbody>
        <tr>
            <td><label for="prenomEtudiant">Prénom :</label></td>
            <td><input id="prenomEtudiant" name="prenomEtudiant" type="text" value="<jsp:getProperty name="etudiant" property="prenom"/>"></td>
        </tr>
        <tr>
            <td><label for="nomEtudiant">Nom :</label></td>
            <td><input id="nomEtudiant" name="nomEtudiant"  type="text" value="<jsp:getProperty name="etudiant" property="nom"/>"></td>
        </tr>
        </tbody>
        <div>
            <label for="groupeEtudiant">Groupe : </label>
            <select id="groupeEtudiant" name="groupeEtudiant">
                <% for (Groupe groupe : groupes) { %>
                <% if (etudiant.getGroupe().getId().equals(groupe.getId())) {%>
                <option value="<%= groupe.getId() %>" selected><%= groupe.getNom() %></option>
                <% } else { %>
                <option value="<%= groupe.getId() %>"><%= groupe.getNom() %></option>
                <% }%>
                <% } %>
            </select>
        </div>
        <div>
            <label for="nbAbsences">Nombre d'absences : </label>
            <input id="nbAbsences" name="nbAbsences" type="number" min="0" value="<%= etudiant.getNbAbsences() %>">
        </div>
        <input type="submit" value="Confirmer">
    </table>
</form>

<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
<% } %>
</body>
</html>