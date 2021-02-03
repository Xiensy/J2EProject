<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <h1>Accueil</h1>
    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>