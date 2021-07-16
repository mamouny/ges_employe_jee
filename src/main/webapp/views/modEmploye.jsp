<%@ page import="entity.Employe" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 16/07/2021
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Accueil</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabEmp").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
    </script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <div class="modal-header">
            <h5 class="modal-title" id="staticBackdropLabel">Editer un employée </h5>
        </div>
        <% Employe employe = (Employe) request.getAttribute("emp"); %>
        <form action="modEmp" method="post">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label>Nom</label>
                        <input type="text" id="nomEmp" value="<%= employe.getNomEmp() %>" name="nomEmp" placeholder="Le nom du l'client " class="form-control"/>
                        <input type="hidden" name="idemploye" value="<%= employe.getIdemploye() %>"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Prenom</label>
                        <input type="text" id="prenomEmp" value="<%= employe.getPrenomEmp() %>" name="prenomEmp" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Date de naissance</label>
                        <input type="date" id="dateN" value="<%= employe.getDateN() %>" name="dateN" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Nationnalite</label>
                        <input type="text" id="nationnalite" value="<%= employe.getNationnalite() %>" name="nationnalite" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Situation Familiale</label>
                        <input type="text" id="situat_F" value="<%= employe.getSituat_F() %>" name="situat_F" placeholder=" " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Ville</label>
                        <input type="text" id="ville" value="<%= employe.getVille() %>" name="ville" placeholder="Le nom du ville " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Niveau</label>
                        <input type="text" id="niveau" value="<%= employe.getNiveau() %>" name="niveau" placeholder="votre niveau " class="form-control"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Salaire</label>
                        <input type="number" id="salaire" value="<%= employe.getSalaire() %>" name="salaire" placeholder="votre salaire " class="form-control"/>
                    </div>
                </div>
                <div class="form-group col-md-12">
                    <label>Departement</label>
                    <select class="form-control form-select " name="departement_id" >
                        <% if (request.getAttribute("listesDep") != null) { %>
                        <% List<entity.Departement> listesDep = (List<entity.Departement>) request.getAttribute("listesDep"); %>
                        <% for (entity.Departement dep : listesDep) { %>
                        <option value="<%= dep.getDepartement_id() %>" selected><%= dep.getNomDepartement() %></option>
                        <% } %>
                        <% } %>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary float-right">Modifier</button>
            </div>

        </form>
    </div>
</body>
</html>
