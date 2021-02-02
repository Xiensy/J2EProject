<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
</head>
<body>
<h1>Notes de <%= etudiant.getPrenom() + " " + etudiant.getNom() %></h1>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<ul>
    <%for (Note note : etudiant.getNotes()){ %>
    <li><p><%= note.getModule() %></p><p><%= note.getValeur() %></p></li>
    <% } %>
</ul>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
