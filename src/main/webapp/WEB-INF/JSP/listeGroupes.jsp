<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Groupe" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="groupes" class="java.util.List<com.mi4.richomml_projet_mi4.model.Groupe>" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<h1>Groupes</h1>
<ul>
<%for (Groupe groupe : groupes){ %>
    <li><a href="<%= application.getContextPath()%>/do/listeNotesEtudiant?idGroupe=<%= groupe.getId() %>"><%= groupe.getNom() %></a></li>
<% } %>
</ul>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
