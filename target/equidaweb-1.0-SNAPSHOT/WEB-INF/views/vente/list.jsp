<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Vente" %>
<%@ page import="model.Lieu" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Equida - Liste des ventes</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <style>
        body { padding-top: 50px; }
        .special { padding-top: 50px; }
        .header-actions {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href='<%= request.getContextPath() %>/vente-servlet/list' class="navbar-brand">
                Système de gestion des ventes aux enchères de chevaux
            </a>
        </div>
    </div>
</nav>

<div class="container special">
    <div class="header-actions">
        <h2 class="h2">Liste des ventes</h2>
        <a href="<%= request.getContextPath() %>/vente-servlet/add" class="btn btn-primary">
            <span class="glyphicon glyphicon-plus"></span> Ajouter une vente
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Ville</th>
                <th>Catégorie</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Vente> lesVentes = (ArrayList<Vente>)request.getAttribute("pLesVentes");
                if (lesVentes != null && !lesVentes.isEmpty()) {
                    for (Vente v : lesVentes) {
            %>
            <tr>
                <td><%= v.getId() %></td>
                <td><a href="<%= request.getContextPath() %>/vente-servlet/show?idVente=<%= v.getId() %>"><%= v.getNom() %></a></td>
                <td><%= v.getLieu() != null ? v.getLieu().getVille() : "Non renseignée" %></td>
                <td><%= v.getCategVente() != null ? v.getCategVente().getLibelle() : "Non renseignée" %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/vente-servlet/update?idVente=<%= v.getId() %>" class="btn btn-warning btn-xs">
                        <span class="glyphicon glyphicon-pencil"></span> Modifier
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="5" class="text-center">Aucune vente trouvée.</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>