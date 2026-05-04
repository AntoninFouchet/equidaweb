<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cheval" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Equida - Liste des chevaux</title>
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
            <a href='<%= request.getContextPath() %>/cheval-servlet/list' class="navbar-brand">
                Gestion des chevaux
            </a>
        </div>
    </div>
</nav>

<div class="container special">
    <div class="header-actions">
        <h2 class="h2">Liste des chevaux</h2>
        <a href="<%= request.getContextPath() %>/cheval-servlet/add" class="btn btn-primary">
            <span class="glyphicon glyphicon-plus"></span> Ajouter un cheval
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>Id</th>
                <th>Nom</th>
                <th>Race</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Cheval> lesChevaux = (ArrayList<Cheval>)request.getAttribute("pLesChevaux");
                if (lesChevaux != null && !lesChevaux.isEmpty()) {
                    for (Cheval c : lesChevaux) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><a href="<%= request.getContextPath() %>/cheval-servlet/show?idCheval=<%= c.getId() %>"><%= c.getNom() %></a></td>
                <td><%= c.getRace() != null ? c.getRace().getNom() : "Non renseignée" %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/cheval-servlet/update?idCheval=<%= c.getId() %>" class="btn btn-warning btn-xs">
                        <span class="glyphicon glyphicon-pencil"></span> Modifier
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="4" class="text-center">Aucun cheval trouvé.</td></tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>