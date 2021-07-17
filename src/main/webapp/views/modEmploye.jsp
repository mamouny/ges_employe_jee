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
    <title>Modifier un employé</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script type="text/javascript">
        $(document).ready( function () {
            $('#myTable').DataTable();
        } );
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />
<div id="wrapper" style="margin-top:25px">
    <div class="container">
        <div class=" text-center">
            <h4>Modifier un employe</h4>
        </div>
        <div class=" w-50 m-auto ">
        <% Employe employe = (Employe) request.getAttribute("emp"); %>
        <form action="modEmp" method="post">
            <div class="modal-body">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label>Nom</label>
                        <input type="text" id="nomEmp" value="<%= employe.getNomEmp() %>" name="nomEmp" placeholder="Le nom du l'client " class="form-control"/>
                        <input type="hidden" name="idemploye" value="<%= employe.getIdemploye() %>"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Prenom</label>
                        <input type="text" id="prenomEmp" value="<%= employe.getPrenomEmp() %>" name="prenomEmp" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Date de naissance</label>
                        <input type="date" id="dateN" value="<%= employe.getDateN() %>" name="dateN" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Nationnalite</label>
                        <input type="text" id="nationnalite" value="<%= employe.getNationnalite() %>" name="nationnalite" placeholder="Le nom du l'client " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Situation Familiale</label>
                        <input type="text" id="situat_F" value="<%= employe.getSituat_F() %>" name="situat_F" placeholder=" " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Ville</label>
                        <input type="text" id="ville" value="<%= employe.getVille() %>" name="ville" placeholder="Le nom du ville " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Niveau</label>
                        <input type="text" id="niveau" value="<%= employe.getNiveau() %>" name="niveau" placeholder="votre niveau " class="form-control"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Salaire</label>
                        <input type="number" id="salaire" value="<%= employe.getSalaire() %>" name="salaire" placeholder="votre salaire " class="form-control"/>
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
            <div class="pull-center" align="center">
                <input type="submit" name="submit" value="Modifier" class="btn btn-primary">
                <a href="accruil" class="btn btn-success text-center">Annuler</a>
            </div>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>
