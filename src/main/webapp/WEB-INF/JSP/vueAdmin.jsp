<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="selectModule" class="java.lang.String" scope="request"/>
<jsp:useBean id="selectEnseignant" class="java.lang.String" scope="request"/>
<jsp:useBean id="selectGroupe" class="java.lang.String" scope="request"/>
<jsp:useBean id="error" class="java.lang.String" scope="request"/>
<jsp:useBean id="success" class="java.lang.String" scope="request"/>
<html>
<head>
    <title><%= application.getInitParameter("title") %></title>
    <jsp:include page="<%= application.getInitParameter("styleIncluder")%>"/>
</head>
<body>
<jsp:include page="<%= application.getInitParameter("entetedepage")%>"/>
<h1>Vue Admin</h1>
<% if (error != null && ! "".equals(error)){ %>
<div>
    <h2>Erreur :</h2>
    <ul>
        <%= error %>
    </ul>
</div>
<% } %>
<% if (success != null && ! "".equals(success)) { %>
<div>
    <h2>success :</h2>
    <ul>
        <%= success %>
    </ul>
</div>
<% } %>
<div>
    <div class="">
        <a id="btnAddEtudiant" class="btn" href="#formAddEtudiant">Ajout d'un etudiant</a>
        <a id="btnAddEnseignant" class="btn" href="#formAddEnseignant">Ajout d'un enseignant</a>
        <a id="btnAddEnseignantToModule" class="btn" href="#formAddEnseignantToModule">Ajout d'un enseigant responsable</a>
        <a id="btnAddModule" class="btn" href="#formAddModule">Ajout d'un module</a>
        <a id="btnAddGroupe" class="btn" href="#formAddGroupe">Ajout d'un groupe</a>
    </div>
    <div>
        <form id="formAddEtudiant"class="displayNone" action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomEtudiant">Nom</label>
                    </td>
                    <td>
                        <input type="text" id="nomEtudiant" name="nomEtudiant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomEtudiant">Prénom</label>
                    </td>
                    <td>
                        <input type="text" id="prenomEtudiant" name="prenomEtudiant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="groupeEtudiant">Groupe</label>
                    </td>
                    <td>
                        <select id="groupeEtudiant" name="groupeEtudiant">
                            <%= selectGroupe %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="createEtudiant" value="Crée l'étudiant">
                    </td>
                </tr>
            </table>
        </form>

        <form id="formAddEnseignant" class="displayNone" action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomEnseignant">Nom :</label>
                    </td>
                    <td>
                        <input type="text" id="nomEnseignant" name="nomEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="prenomEnseignant">Prénom :</label>
                    </td>
                    <td>
                        <input type="text" id="prenomEnseignant" name="prenomEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="identifiantEnseignant">Identifiant :</label>
                    </td>
                    <td>
                        <input type="text" id="identifiantEnseignant" name="identifiantEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="adminEnseignant">Admin :</label>
                    </td>
                    <td>
                        <input type="checkbox" name="adminEnseignant" id="adminEnseignant">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="mdpEnseignant">Mot de passe :</label>
                    </td>
                    <td>
                        <input type="password" id="mdpEnseignant" name="mdpEnseignant" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="createEnseignant" value="Crée l'enseignant">
                    </td>
                </tr>
            </table>
        </form>

        <form id="formAddEnseignantToModule" class="displayNone" action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="idModule">Module</label>
                    </td>
                    <td>
                        <select id="idModule" name="idModule">
                            <%= selectModule %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="idEnseignantModule">Enseignant</label>
                    </td>
                    <td>
                        <select id="idEnseignantModule" name="idEnseignantModule">
                            <%= selectEnseignant %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="addEnseigantToModule" value="Ajout d'un enseigant responsable">
                    </td>
                </tr>
            </table>
        </form>

        <form id="formAddModule" class="displayNone" action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomModule">Nom</label>
                    </td>
                    <td>
                        <input type="text" id="nomModule" name="nomModule" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="idEnseignantNewModule">Enseignant respondable</label>
                    </td>
                    <td>
                        <select id="idEnseignantNewModule" name="idEnseignantNewModule">
                            <%= selectEnseignant %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="addModule" value="Ajout du module">
                    </td>
                </tr>
            </table>
        </form>

        <form id="formAddGroupe" class="displayNone" action="<%= application.getContextPath()%>/do/submitAdmin" method="post">
            <table>
                <tr>
                    <td>
                        <label for="nomGroupe">Nom</label>
                    </td>
                    <td>
                        <input type="text" id="nomGroupe" name="nomGroupe" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="addGroupe" value="Ajout d'un groupe">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<jsp:include page="<%= application.getInitParameter("pieddepage")%>"/>
<script type="text/javascript">


    function addDisplayNone() {
        var forms = document.getElementsByTagName("form");
        for (var i = 0; i < forms.length; i++) {
            if (! forms[i].classList.contains('displayNone')) {
                forms[i].classList.add('displayNone')
            }
        }

    }
    var btnAddEtudiant = document.getElementById("btnAddEtudiant");
    btnAddEtudiant.addEventListener('click', function() {
            addDisplayNone();
            var formAddEtudiant = document.getElementById('formAddEtudiant');
            formAddEtudiant.classList.remove('displayNone');
        }
    );

    var btnAddEnseignant = document.getElementById("btnAddEnseignant")
    btnAddEnseignant.addEventListener('click', function() {addDisplayNone();
            addDisplayNone();
            var formAddEnseignant = document.getElementById('formAddEnseignant');
            formAddEnseignant.classList.remove('displayNone')
        }
    );

    var btnAddEnseignantToModule = document.getElementById("btnAddEnseignantToModule")
    btnAddEnseignantToModule.addEventListener('click', function() {addDisplayNone();
            addDisplayNone();
            var formAddEnseignantToModule = document.getElementById('formAddEnseignantToModule');
            formAddEnseignantToModule.classList.remove('displayNone')
        }
    );

    var btnAddModule = document.getElementById("btnAddModule")
    btnAddModule.addEventListener('click', function() {addDisplayNone();
            addDisplayNone();
            var formAddModule = document.getElementById('formAddModule');
            formAddModule.classList.remove('displayNone')
        }
    );

    var btnAddGroupe = document.getElementById("btnAddGroupe")
    btnAddGroupe.addEventListener('click', function() {addDisplayNone();
            addDisplayNone();
            var formAddGroupe = document.getElementById('formAddGroupe');
            formAddGroupe.classList.remove('displayNone')
        }
    );



</script>
</body>
</html>
