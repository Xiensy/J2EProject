<%@ page import="com.mi4.richomml_projet_mi4.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>
<jsp:useBean id="groupes" class="java.util.List<com.mi4.richomml_projet_mi4.model.Groupe>" scope="request"/>

<html>
<head>
    <title><%= etudiant.getPrenom() + " " + etudiant.getNom() %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>

<form action="<%=application.getContextPath()%>/do/submitEditerEtudiant" method="post">
    <input id="idEtudiant" name="idEtudiant" type="hidden" value="<%= etudiant.getId() %>">
    <h1>Edition de l'étudiant : <jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/></h1>
    <label for="prenomEtudiant">Prénom :</label>
    <input id="prenomEtudiant" name="prenomEtudiant" type="text" value="<jsp:getProperty name="etudiant" property="prenom"/>">
    <label for="nomEtudiant">Nom :</label>
    <input id="nomEtudiant" name="nomEtudiant"  type="text" value="<jsp:getProperty name="etudiant" property="nom"/>">

    <label for="groupeEtudiant">Groupe : </label>
    <select id="groupeEtudiant" name="groupeEtudiant">
        <% for (Groupe groupe : groupes) { %>
            <option value="<%= groupe.getId() %>"><%= groupe.getNom() %></option>
        <% } %>
    </select>

    <label for="nbAbsences">Nombre d'absences : </label><input id="nbAbsences" name="nbAbsences" type="number" min="0" value="<%= etudiant.getNbAbsences() %>">
    <p>Notes : </p>
    <% for (Note note : etudiant.getNotes()) { %>
        <label for="<%= note.getId() %>"><%= note.getModule().getNom() %> : </label><input id="<%= note.getId() %>" name="notes" min="0" max="20" type="number" value="<%= note.getValeur() %>"/></br>
    <% } %>
    <input type="submit" value="Confirmer">
</form>

<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>