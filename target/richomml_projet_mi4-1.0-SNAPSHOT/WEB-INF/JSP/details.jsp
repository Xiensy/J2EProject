<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>

<html>
<head>
    <title><%= etudiant.getPrenom() + " " + etudiant.getNom() %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <h1>Informations de <jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/>
        <a href="<%= application.getContextPath()%>/do/editerEtudiant?idEtudiant=<%= etudiant.getId() %>">
            <img src="<%= application.getContextPath() + "/IMAGES/edit_icon.png"%>" alt="editer">
        </a>
    </h1>

    <table>
        <tbody>
        <tr>
            <td><p>Groupe</p></td><td><p><%= etudiant.getGroupe().getNom() %></p></td>
        </tr>
        <tr>
            <td><p>Nombre d'absences</p></td><td><p><%= etudiant.getNbAbsences() %></p></td>
        </tr>
        </tbody>
    </table>

    <h3>Notes : </h3>
    <table>
        <thead>
        <tr><th>Module</th><th>Valeur</th></tr>
        </thead>
        <tbody>
        <% for (Note note : etudiant.getNotes()) { %>
        <tr><td><%= note.getModule().getNom() %></td><td> <%= note.getValeur() %></td></tr>
        <% } %>
        </tbody>
    </table>

    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
