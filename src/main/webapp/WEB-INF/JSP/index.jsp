<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
</head>
<body>
    <h1>Accueil</h1>
    <ul>
        <li>
            <a href="<%= application.getContextPath() + "/do/listeEtudiants" %>">Liste des étudiants</a>
        </li>
        <li>
            <a href="<%= application.getContextPath() + "/do/listeAbsences" %>">Liste des absences</a>
        </li>
    </ul>
</body>
</html>