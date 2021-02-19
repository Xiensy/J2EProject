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

<form action="<%=application.getContextPath()%>/do/submitEtudiant?id=<%= etudiant.getId() %>" method="post" enctype="multipart/form-data">
    <h1>Edition de l'étudiant : <jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/></h1>
    <label for="prenomEtudiant">Prénom :</label>
    <input id="prenomEtudiant" type="text" value="<jsp:getProperty name="etudiant" property="prenom"/>">
    <label for="prenomEtudiant">Nom :</label>
    <input id="prenomEtudiant" type="text" value="<jsp:getProperty name="etudiant" property="nom"/>">

    <label for="nbAbsences">Nombre d'absences : </label><input id="nbAbsences" type="number" min="0" value="<%= nbAbsencesEtudiant %>">
    <p>Notes : </p>
    <% for (Note note : etudiant.getNotes()) { %>
        <label><%= note.getModule().getNom() %> : </label><input id="<%= note.getId() %>" type="number" value="<%= note.getValeur() %>"/></br>
    <% } %>
</form>

<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>