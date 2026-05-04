<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Race" %>
<%@ page import="model.Cheval" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Equida - Modifier un cheval</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body { padding-top: 50px; }
        .special { padding-top: 50px; }
        .form-container {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/cheval-servlet/list">Gestion des chevaux</a>
        </div>
    </div>
</nav>

<div class="container special">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="form-container">
                <h2>Modifier le cheval</h2>

                <% Cheval cheval = (Cheval)request.getAttribute("pLeCheval"); %>

                <form class="form-horizontal" action="<%= request.getContextPath() %>/cheval-servlet/update" method="POST">

                    <!-- CHAMP CACHÉ POUR L'ID -->
                    <input type="hidden" name="id" value="<%= cheval.getId() %>">

                    <!-- Nom -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nom *</label>
                        <div class="col-sm-9">
                            <input type="text" name="nom" class="form-control" required value="<%= cheval.getNom() %>">
                        </div>
                    </div>

                    <!-- Sire -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label text-right">N° SIRE</label>
                        <div class="col-sm-9">
                            <input type="text" name="sire" class="form-control" value="<%= (cheval.getSire() != null) ? cheval.getSire() : "" %>">
                        </div>
                    </div>

                    <!-- Sexe -->
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label text-right">Sexe *</label>
                        <div class="col-sm-9">
                            <select name="sexe" class="form-control" required>
                                <option value="M" <%= "M".equals(cheval.getSexe()) ? "selected" : "" %>>Mâle (M)</option>
                                <option value="F" <%= "F".equals(cheval.getSexe()) ? "selected" : "" %>>Femelle (F)</option>
                                <option value="G" <%= "G".equals(cheval.getSexe()) ? "selected" : "" %>>Hongre (G)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Date de naissance -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Date de naissance</label>
                        <div class="col-sm-9">
                            <input type="date" name="dateNaissance" class="form-control" value="<%= (cheval.getDateNaissance() != null) ? cheval.getDateNaissance() : "" %>">
                        </div>
                    </div>

                    <!-- Race -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Race *</label>
                        <div class="col-sm-9">
                            <select name="race" class="form-control" required>
                                <%
                                    ArrayList<Race> lesRaces = (ArrayList<Race>)request.getAttribute("pLesRaces");
                                    if (lesRaces != null) {
                                        for(Race r : lesRaces) {
                                            // On sélectionne la race actuelle du cheval
                                            String selected = (cheval.getRace() != null && cheval.getRace().getId() == r.getId()) ? "selected" : "";
                                %>
                                <option value="<%= r.getId() %>" <%= selected %>>
                                    <%= r.getNom() %>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-warning">Modifier</button>
                            <a href="<%= request.getContextPath() %>/cheval-servlet/show?idCheval=<%= cheval.getId() %>" class="btn btn-default">Annuler</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>