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
<form method="post" action="<%= application.getContextPath()%>/do/submitNoteEtudiant">
    <table cellspacing="0">
        <thead>
            <tr>
                <th>Nom étudiant</th>
                <th>Note</th>
            </tr>
        </thead>
        <tbody>
            <%for (Note note : module.getNotes()){ %>
                <tr>
                    <input type="hidden" name="notes" value="<%= note.getId() %>">
                    <td><%= note.getEtudiant().getPrenom() + " " + note.getEtudiant().getNom() %></td>
                    <td><input type="number" name="noteValeurs" value="<%= note.getValeur() %>" min="0" max="20"></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <input type="submit" name="edit" value="Enregistrer">
    <input type="hidden" name="idModule" value="<%= module.getId() %>"/>
</form>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
