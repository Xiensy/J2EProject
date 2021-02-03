<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="groupe" class="com.mi4.richomml_projet_mi4.model.Groupe" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<h1>Notes de <%= groupe.getNom() %></h1>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <%for (Etudiant etu : groupe.getEtudiants()){ %>
        <h2><%= etu.getNom() %></h2>
        <ul>
        <%for (Note note : etu.getNotes()) {%>
            <li><p><%= note.getModule().getNom() %></p><p><%= note.getValeur() %></p></li>
        <% } %>
        </ul>
    <% } %>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
