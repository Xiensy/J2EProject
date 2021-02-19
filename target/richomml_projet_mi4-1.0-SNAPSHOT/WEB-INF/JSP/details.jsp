<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>
<jsp:useBean id="nbAbsencesEtudiant" class="java.lang.Integer" scope="request"/>

<html>
<head>
    <title><%= etudiant.getPrenom() + " " + etudiant.getNom() %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <h1><jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/></h1>
    <a href="<%= application.getContextPath()%>/do/editerEtudiant?idEtudiant=<%= etudiant.getId() %>">Editer</a>
    <p>Groupe : <%= etudiant.getGroupe().getNom() %></p>
    <p>Nombre d'absences : <%= nbAbsencesEtudiant %></p>
    <p>Notes : </p>
    <% for (Note note : etudiant.getNotes()) { %>
        <span><%= note.getModule().getNom() %> </span><span> <%= note.getValeur() %></span></br>
    <% } %>
    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
