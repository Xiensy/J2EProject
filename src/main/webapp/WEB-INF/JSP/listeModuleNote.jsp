<%@ page import="com.mi4.richomml_projet_mi4.model.Module" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="modules" class="java.util.List<com.mi4.richomml_projet_mi4.model.Module>" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<h1>Module</h1>
<table>
    <thead>
        <tr>
            <th>Nom</th>
            <th>Nombre d'étudiant</th>
            <th>Moyenne</th>
        </tr>
    </thead>
    <tbody>
    <%for (Module module : modules){ %>
        <tr>
            <td><a href="<%= application.getContextPath()%>/do/listeNotesEtudiant?idModule=<%= module.getId() %>"><%= module.getNom() %></a></td>
            <td><%= module.getAllEtudiant().size() %></td>
            <td><%= module.getMoyenneNotes() %></td>
        </tr>
    <% } %>
    </tbody>

</table>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
