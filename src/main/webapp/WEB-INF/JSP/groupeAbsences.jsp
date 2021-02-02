<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %><%--
  Created by IntelliJ IDEA.
  User: lr
  Date: 05/01/2021
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="etudiants" class="java.util.List<com.mi4.richomml_projet_mi4.model.Etudiant>" scope="request"/>

<html>
<head>
    <title>Liste des Absences</title>
</head>
<body>
    <h1>Liste des absences</h1>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <table>
        <thead>
        <tr>
            <td>Nom</td>
            <td>Nb Absences</td>
        </tr>
        </thead>
        <tbody>
        <% for (Etudiant etu : etudiants) { %>
                <tr>
                    <td>
                        <a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= etu.getId() %>"><%= etu.getPrenom() + " " + etu.getNom() %></a>
                    </td>
                    <td>
                        <p><a href="<%= application.getContextPath()%>/do/removeAbsences?idEtudiant=<%= etu.getId() %>">-</a> <%= etu.getNbAbsences() %> <a href="<%= application.getContextPath()%>/do/addAbsences?idEtudiant=<%= etu.getId() %>">+</a></p>
                    </td>
                </tr>
        <% } %>

        </tbody>
    </table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
