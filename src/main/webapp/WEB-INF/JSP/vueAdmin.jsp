<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
</body>
</html>
