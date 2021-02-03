<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Groupe" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="groupes" class="java.util.List<com.mi4.richomml_projet_mi4.model.Groupe>" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
</head>
<body>
<h1>Groupes</h1>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<ul>
<%for (Groupe groupe : groupes){ %>
    <li><a href="<%= application.getContextPath()%>/do/listeNotesEtudiant?idGroupe=<%= groupe.getId() %>"><%= groupe.getNom() %></a></li>
<% } %>
</ul>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
