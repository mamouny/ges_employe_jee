<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Employe" %>
<%@ page import="entity.Departement" %>
<html>
<head>
    <title>Employee</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css">
    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable();
        } );
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/sidebar.jsp" />
<div id="wrapper" style="margin-top:25px">
    <div class="container">
        <div class="box mb-5 w-100">
            <div class="box-header p-1 m-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="pull-right text-right">
                                <span class="pull-left text-left" style="font-size: 22px;margin-left:20px"><i class="fa fa-list px-2"></i>Listes des émployes</span>
                                <button type="button" class="align-self-end btn btn-primary btn-sm text-right" data-toggle="modal" data-target="#myModal"><i class="fa fa-user-plus" aria-hidden="true"></i>Nouveau</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 table-responsive">
                <table id="example" width="100%" class="table table-bordered text-center dataTable">
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
                            <a href="modEmp?idemploye=<%= e.getIdemploye() %>" class="btn btn-dark" ><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a>
                            <a href="supEmp?idemploye=<%= e.getIdemploye() %>" onclick="return confirm('Vous etes sur pour suprimer cet employe');" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                        </td>
                    </tr>
                    <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Ajouter un employee</h5>
            </div>
            <div class="modal-body">
                <form action="" method="post" >
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        <button type="submit" class="btn btn-primary float-right">Enregistrer</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
