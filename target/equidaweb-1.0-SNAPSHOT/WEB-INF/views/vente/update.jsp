<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Lieu" %>
<%@ page import="model.Vente" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Equida - Modifier une vente</title>
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
      <a class="navbar-brand" href="<%= request.getContextPath() %>/vente-servlet/list">Gestion des ventes</a>
    </div>
  </div>
</nav>

<div class="container special">
  <div class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="form-container">
        <h2>Modifier la vente</h2>

        <% Vente laVente = (Vente)request.getAttribute("pLaVente"); %>

        <form class="form-horizontal" action="<%= request.getContextPath() %>/vente-servlet/update" method="POST">

          <!-- CHAMP CACHÉ POUR L'ID -->
          <input type="hidden" name="id" value="<%= laVente.getId() %>">

          <div class="form-group">
            <label class="col-sm-3 control-label">Nom de la vente *</label>
            <div class="col-sm-9">
              <input type="text" name="nom" class="form-control" required value="<%= laVente.getNom() %>">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">Date de début *</label>
            <div class="col-sm-9">
              <input type="date" name="dateDebutVente" class="form-control" required value="<%= laVente.getDateDebutVente() != null ? laVente.getDateDebutVente() : "" %>">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">Lieu *</label>
            <div class="col-sm-9">
              <select name="lieu" class="form-control" required>
                <%
                  ArrayList<Lieu> lesLieux = (ArrayList<Lieu>)request.getAttribute("pLesLieux");
                  if (lesLieux != null) {
                    for(Lieu unLieu : lesLieux) {
                      String selected = (laVente.getLieu() != null && laVente.getLieu().getId() == unLieu.getId()) ? "selected" : "";
                %>
                <option value="<%= unLieu.getId() %>" <%= selected %>>
                  <%= unLieu.getVille() %>
                </option>
                <%
                    }
                  }
                %>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">Catégorie *</label>
            <div class="col-sm-9">
              <select name="categVente" class="form-control" required>
                <%
                  ArrayList<model.CategVente> lesCategs = (ArrayList<model.CategVente>)request.getAttribute("pLesCategVentes");
                  if (lesCategs != null) {
                    for(model.CategVente c : lesCategs) {
                      String selected = (laVente.getCategVente() != null && c.getCode().equals(laVente.getCategVente().getCode())) ? "selected" : "";
                %>
                <option value="<%= c.getCode() %>" <%= selected %>>
                  <%= c.getLibelle() %>
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
              <button type="submit" class="btn btn-warning">
                <span class="glyphicon glyphicon-pencil"></span> Modifier
              </button>
              <a href="<%= request.getContextPath() %>/vente-servlet/show?idVente=<%= laVente.getId() %>" class="btn btn-default">
                Annuler
              </a>
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>