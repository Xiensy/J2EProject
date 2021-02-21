<%@ page import="com.mi4.richomml_projet_mi4.model.Note" %>
<%@ page import="com.mi4.richomml_projet_mi4.model.Etudiant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>

<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<% if (enseignant.getId() == null) {%>
<h1>Se connecter</h1>
<div>
    <form method="post" action="<%= application.getContextPath()%>/do/submitSeConnecter">
        <table class="noBorderTable" cellspacing="0">
            <tr>
                <td>
                    <label for="identifiant">Identifiant</label>
                </td>
                <td>
                    <input type="text" id="identifiant" name="identifiant" required/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="mdp">Mot de passe</label>
                </td>
                <td>
                    <input id="mdp" name="mdp" type="password" required>
                </td>
            </tr>
        </table>
        <input type="submit" name="seConnecter" value="Se connecter">
    </form>
</div>
<% } else { %>
    <h1><%= enseignant.getNomComplet() %></h1>
    <a class="btn btnCenter" href="<%= application.getContextPath()%>/do/submitSeConnecter?seDeconnecter=true">Se déconnecter</a>
<% } %>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
