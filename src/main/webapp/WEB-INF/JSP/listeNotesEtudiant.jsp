<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="module" class="com.mi4.richomml_projet_mi4.model.Module" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<h1>Notes du module : <%= module.getNom() %></h1>
<div><a href="<%= application.getContextPath()%>/do/listeNotesEtudiant?idModule=<%= module.getId() %>&edit=true">Modifier les notes</a><a href="#">Ajouter un étudiant</a></div>
<table>
    <thead>
        <tr>
            <th>Nom étudiant</th>
            <th>Note</th>
        </tr>
    </thead>
    <tbody>
        <%for (Note note : module.getNotes()){ %>
            <tr>
                <td><a href="<%= application.getContextPath()%>/do/details?idEtudiant=<%= note.getEtudiant().getId() %>"><%= note.getEtudiant().getPrenom() + " " + note.getEtudiant().getNom() %></a></td>
                <td><%= note.getValeur() %></td>
            </tr>
        <% } %>
    </tbody>
</table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
