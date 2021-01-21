<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
</head>
<body>
    <h1>Accueil</h1>
    <jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
    <jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>