<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Groupe" %><%--
  Created by IntelliJ IDEA.
  User: lr
  Date: 05/01/2021
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="groupes" class="java.util.List<com.mi4.richomml_projet_mi4.model.Groupe>" scope="request"/>

<html>
<head>
    <title>Liste des groupes</title>
</head>
<body>
    <h1>Liste des groupes</h1>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <table>
        <thead>
        <tr>
            <td>Groupe</td>
            <td>Nombres d'absences</td>
        </tr>
        </thead>
        <tbody>
        <% for (Groupe groupe : groupes) { %>
                <tr>
                    <td>
                        <a href="<%= application.getContextPath()%>/do/listeAbsences?idGroupe=<%= groupe.getId() %>"><%= groupe.getNom() %></a>
                    </td>
                    <td>
                        <%= groupe.getNbAbsences() %>
                    </td>
                </tr>
        <% } %>

        </tbody>
    </table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
