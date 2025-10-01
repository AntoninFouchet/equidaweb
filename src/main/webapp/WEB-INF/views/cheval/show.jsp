<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Cheval" %>
<%@ page import="model.Course" %>
<%@ page import="model.ChevalCourse" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equida - Détails du cheval</title>
        <link rel="stylesheet" 
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
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
            .detail-row { margin-bottom: 15px; }
            .detail-label { font-weight: bold; color: #555; }
            .detail-value { padding-top: 7px; }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="<%= request.getContextPath() %>/cheval-servlet/list">
                        Gestion des chevaux
                    </a>
                </div>
            </div>
        </nav>

        <div class="container special">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="form-container">
                        <% 
                            Cheval leCheval = (Cheval)request.getAttribute("pLeCheval");
                            ArrayList<model.ChevalCourse> lesChevauxCourses =
                                (ArrayList<model.ChevalCourse>) request.getAttribute("pLesChevauxCourses");
                            if(leCheval != null) {
                        %>
                            <h2>Détails du cheval : <%= leCheval.getNom() %></h2>

                            <!-- Informations du cheval -->
                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Identifiant</div>
                                <div class="col-sm-9 detail-value"><%= leCheval.getId() %></div>
                            </div>

                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Nom</div>
                                <div class="col-sm-9 detail-value"><%= leCheval.getNom() %></div>
                            </div>

                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Date de naissance</div>
                                <div class="col-sm-9 detail-value">
                                    <%= leCheval.getDateNaissance() != null ? leCheval.getDateNaissance() : "Non renseignée" %>
                                </div>
                            </div>

                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Race</div>
                                <div class="col-sm-9 detail-value">
                                    <%= leCheval.getRace() != null ? leCheval.getRace().getNom() : "Non renseignée" %>
                                </div>
                            </div>

                            <!-- Parents -->
                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Père</div>
                                <div class="col-sm-9 detail-value">
                                    <%= leCheval.getChevalpere() != null ? leCheval.getChevalpere().getNom() : "Non renseigné" %>
                                </div>
                            </div>

                            <div class="row detail-row">
                                <div class="col-sm-3 detail-label">Mère</div>
                                <div class="col-sm-9 detail-value">
                                    <%= leCheval.getChevalmere() != null ? leCheval.getChevalmere().getNom() : "Non renseignée" %>
                                </div>
                            </div>

                            <!-- Tableau des courses -->
                            <h3 style="margin-top:40px;">Courses de <%= leCheval.getNom() %></h3>
                            <% if (lesChevauxCourses != null && !lesChevauxCourses.isEmpty()) { %>
                                <table class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Lieu</th>
                                            <th>Date</th>
                                            <th>Position</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (model.ChevalCourse cc : lesChevauxCourses) { %>
                                            <tr>
                                                <td><%= cc.getCourse().getNom() %></td>
                                                <td><%= cc.getCourse().getLieu() %></td>
                                                <td><%= cc.getCourse().getDate() %></td>
                                                <td><%= cc.getPosition() %></td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            <% } else { %>
                                <div class="alert alert-info">
                                    Ce cheval n'a pas encore participé à une course.
                                </div>
                            <% } %>

                            <!-- Bouton retour -->
                            <div class="row" style="margin-top: 30px;">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <a href="<%= request.getContextPath() %>/cheval-servlet/list" class="btn btn-default">
                                        <span class="glyphicon glyphicon-arrow-left"></span> Retour à la liste
                                    </a>
                                </div>
                            </div>

                        <% } else { %>
                            <div class="alert alert-danger">
                                Le cheval demandé n'existe pas.
                            </div>
                            <a href="<%= request.getContextPath() %>/cheval-servlet/list" class="btn btn-default">
                                <span class="glyphicon glyphicon-arrow-left"></span> Retour à la liste
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
