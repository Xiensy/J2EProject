<%@ page import="com.mi4.richomml_projet_mi4.model.GestionFactory" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %><%--
  Created by IntelliJ IDEA.
  User: lr
  Date: 09/12/2020
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="etudiant" class="com.mi4.richomml_projet_mi4.model.Etudiant" scope="request"/>
<jsp:useBean id="nbAbsencesEtudiant" class="java.lang.Integer" scope="request"/>
<html>
<head>
    <title><%= etudiant.getPrenom() + " " + etudiant.getNom() %></title>
</head>
<body>
    <h1><jsp:getProperty name="etudiant" property="prenom"/> <jsp:getProperty name="etudiant" property="nom"/></h1>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <p>Identifiant : <jsp:getProperty name="etudiant" property="id"/></p>
    <p>Nombre d'absences : <%= nbAbsencesEtudiant %></p>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
</body>
</html>
