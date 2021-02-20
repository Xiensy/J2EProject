<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="enseignant" class="com.mi4.richomml_projet_mi4.model.Enseignant" scope="session"/>
<header>
    <nav>
        <ul>
            <li><a href="<%= application.getContextPath()%>/do/listeEtudiants">Afficher les étudiants</a></li>
            <li><a href="<%= application.getContextPath()%>/do/listeModuleNote">Consulter les notes</a></li>
            <li><a href="<%= application.getContextPath()%>/do/groupeAbsences">Consulter les absences</a></li>
            <li><a href="<%= application.getContextPath()%>/do/seConnecter">
                <% if (enseignant.getId() != null) { %>
                    Se déconnecter
                <% } else { %>
                    Se connecter
                <% } %>
            </a></li>
        </ul>
    </nav>
</header>