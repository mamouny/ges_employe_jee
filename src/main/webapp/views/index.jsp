<%@ page language="java" contentType="text/html; ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Employe" %>
<html>
<head>
    <title>Accueil</title>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="container">
        <button class="btn btn-primary p-1 btnright m-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            Ajouter un employé
        </button>
        <h1>Employees List</h1>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>NOM</th>
                <th>PRENOM</th>
                <th>Date de naissance</th>
                <th>Nationnalite </th>
                <th>Situation Familiale </th>
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
                            <td id="situal_f" ><%= e.getSituat_F() %></td>
                            <td>
                                <button class="btn btn-dark" >visualiser</button>
                                <button class="btn btn-danger">supprimer</button>
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
                                <label>ID</label>
                                <input type="number" id="idemployee" name="idemployee" placeholder="Entrer votre numero" class="form-control"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label> Nom </label>
                                <input type="text"   name="cout" placeholder="Entrer votre nom" class="form-control"/>
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
