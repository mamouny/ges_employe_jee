<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Employe" %>
<%@ page import="entity.Departement" %>
<html>
<head>
    <title>Accueil</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
    <script type="text/javascript">
        $(document).ready( function () {
            $('#myTable').DataTable();
        } );
    </script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <button class="btn btn-primary p-1 btnright m-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Ajouter un employé
        </button>
        <h1>Liste des émployees</h1>
        <table class="table table-bordered" id="myTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>NOM</th>
                <th>PRENOM</th>
                <th>Date de naissance</th>
                <th>Nationnalite </th>
                <th>Ville </th>
                <th>Salaire </th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
                <% if (request.getAttribute("listesEmp") != null) { %>
                    <% List<Employe> listesEmp = (List) request.getAttribute("listesEmp"); %>
                    <% for (Employe e : listesEmp) { %>
                        <tr class="text-center">
                            <td id="idemploye"><%= e.getIdemploye() %></td>
                            <td id="nomEmp"><%= e.getNomEmp() %></td>
                            <td id="prenomEmp" ><%= e.getPrenomEmp() %></td>
                            <td id="dateN" ><%= e.getDateN() %></td>
                            <td id="nationnalite" ><%= e.getNationnalite() %></td>
                            <td id="ville" ><%= e.getVille() %></td>
                            <td id="salaire" ><%= e.getSalaire() %></td>
                            <td>
                                <a href="modEmp?idemploye=<%= e.getIdemploye() %>" class="btn btn-dark" >visualiser</a>
                                <a href="supEmp?idemploye=<%= e.getIdemploye() %>" class="btn btn-danger">supprimer</a>
                            </td>
                        </tr>
                    <% } %>
                <% } %>
            </tbody>
        </table>
    </div>
    <!-- Modal Add-->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="" method="post" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Ajouter un employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label> Nom </label>
                                <input type="text"   name="nom" placeholder="Entrer votre nom" class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Prénom</label>
                                <input type="text"  name="prenom" placeholder="Entrer votre prenom" class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Date de naissance</label>
                                <input type="date"  name="dateN"  class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Lieu de naissance</label>
                                <input type="text" placeholder="Entrer votre lieu naissance"  name="lieuN"  class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Nationnalite</label>
                                <input type="text" placeholder="Entrer votre nationnalite"  name="nationnalite"  class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Salaire</label>
                                <input type="number" placeholder="Entrer votre salaire"  name="salaire"  class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Departement</label>
                                <select class="form-control form-select " name="departement_id">
                                    <% if (request.getAttribute("listesDep") != null) { %>
                                    <% List<Departement> listesDep = (List) request.getAttribute("listesDep"); %>
                                    <% for (Departement dep : listesDep) { %>
                                        <option value="<%= dep.getDepartement_id() %>" selected><%= dep.getNomDepartement() %></option>
                                    <% } %>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary float-right">Sauvegarder</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
