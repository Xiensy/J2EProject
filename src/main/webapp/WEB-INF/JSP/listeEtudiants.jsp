<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="etudiants" class="java.util.List<com.mi4.richomml_projet_mi4.model.Etudiant>" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
</head>
<body>
    <h1>Etudiants</h1>
    <br/>
    <ul>
        <%
            for (Etudiant etu : etudiants){
                out.println("<li><a href=\"" +  application.getContextPath()  + "/do/details?idEtudiant=" + etu.getId() + "\">" + etu.getPrenom() + " " + etu.getNom() + "</a></li>");
            }
        %>
    </ul>
</body>
</html>