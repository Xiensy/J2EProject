<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %><%--
  Created by IntelliJ IDEA.
  User: lr
  Date: 05/01/2021
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="groupe" class="com.mi4.richomml_projet_mi4.model.Groupe" scope="request"/>
<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>

<html>
<head>
    <title>Liste des Absences</title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <h1>Liste des absences : <%= groupe.getNom() %></h1>
    <table cellspacing="0">
        <thead>
        <tr>
            <td>Nom</td>
            <td>Nb Absences</td>
        </tr>
        </thead>
        <tbody>
        <% for (Etudiant etu : groupe.getEtudiants()) { %>
                <tr>
                    <td>
                        <a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= etu.getId() %>"><%= etu.getPrenom() + " " + etu.getNom() %></a>
                    </td>
                    <td>
                        <p>
                            <% if (enseignant.getId() != null) { %>
                            <a class="lilBtn" href="<%= application.getContextPath()%>/do/removeAbsences?idGroupe=<%= groupe.getId() %>&idEtudiant=<%= etu.getId() %>">-</a>
                            <% } %>
                            <%= etu.getNbAbsences() %>
                            <% if (enseignant.getId() != null) { %>
                            <a class="lilBtn" href="<%= application.getContextPath()%>/do/addAbsences?idGroupe=<%= groupe.getId() %>&idEtudiant=<%= etu.getId() %>">+</a>
                            <% } %>
                        </p>
                    </td>
                </tr>
        <% } %>

        </tbody>
    </table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
