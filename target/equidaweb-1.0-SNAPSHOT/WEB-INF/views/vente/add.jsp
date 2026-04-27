<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Lieu" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une Vente</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body { padding-top: 50px; }
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
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="form-container">
                <h2>Ajouter une nouvelle vente</h2>

                <form class="form-horizontal" action="<%= request.getContextPath() %>/vente-servlet/add" method="POST">

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nom de la vente *</label>
                        <div class="col-sm-9">
                            <input type="text" name="nom" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Date de début *</label>
                        <div class="col-sm-9">
                            <input type="date" name="dateDebutVente" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Lieu *</label>
                        <div class="col-sm-9">
                            <select name="lieu" class="form-control" required>
                                <option value="">Sélectionnez un lieu</option>
                                <%
                                    ArrayList<Lieu> lesLieux = (ArrayList<Lieu>)request.getAttribute("pLesLieux");
                                    if (lesLieux != null) {
                                        for(Lieu unLieu : lesLieux) {
                                %>
                                <option value="<%= unLieu.getId() %>">
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
                                <option value="">Sélectionnez une catégorie</option>
                                <%
                                    ArrayList<model.CategVente> lesCategs = (ArrayList<model.CategVente>)request.getAttribute("pLesCategVentes");
                                    if (lesCategs != null) {
                                        for(model.CategVente c : lesCategs) {
                                %>
                                <option value="<%= c.getCode() %>">
                                    <%= c.getLibelle() %>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>