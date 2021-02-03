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
    <h1>Etudiants</h1>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <ul>
        <%for (Etudiant etu : etudiants){ %>
            <li><a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= etu.getId() %>"><%= etu.getPrenom() + " " + etu.getNom() %></a></li>
        <% } %>
    </ul>
    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>