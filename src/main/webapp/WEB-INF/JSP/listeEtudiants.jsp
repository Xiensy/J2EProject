<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="etudiants" class="java.util.List<com.mi4.richomml_projet_mi4.model.Etudiant>" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <h1>Liste des étudiants : </h1>
    <table>
        <thead>
        <tr><th>Nom Complet</th></tr>
        </thead>
        <tbody>
        <%for (Etudiant etu : etudiants){ %>
            <tr>
                <td>
                    <a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= etu.getId() %>">
                        <%= etu.getPrenom() + " " + etu.getNom() %>
                    </a>
                </td>
                <td>
                    <a href="<%= application.getContextPath()%>/do/editerEtudiant?idEtudiant=<%= etu.getId() %>">
                        <img src="<%= application.getContextPath() + "/IMAGES/edit_icon.png"%>" alt="editer">
                    </a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <ul>

    </ul>
    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>