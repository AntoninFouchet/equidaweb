package servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.DaoCheval;
import database.DaoRace;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cheval;
import model.Race;
import java.time.LocalDate;
import model.ChevalCourse;
import model.Course;

@WebServlet(name = "chevalServlet", value = "/cheval-servlet/*")
public class ChevalServlet extends HttpServlet {

    Connection cnx;
    
    @Override
    public void init() {
        ServletContext servletContext = getServletContext();
        cnx = (Connection)servletContext.getAttribute("connection");
        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(ChevalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = request.getPathInfo();
        System.out.println("PathInfo: " + path);

        if ("/list".equals(path)) {
            ArrayList<Cheval> lesChevaux = DaoCheval.getLesChevaux(cnx);
            request.setAttribute("pLesChevaux", lesChevaux);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/list.jsp").forward(request, response);
        }
        if ("/show".equals(path)) {
            try {
                int idCheval = Integer.parseInt(request.getParameter("idCheval"));
                Cheval leCheval = DaoCheval.getLeCheval(cnx, idCheval);
                ArrayList<ChevalCourse> lesChevauxCourses = DaoCheval.getLesCoursesByCheval(cnx, idCheval);

                if (leCheval != null) {
                    request.setAttribute("pLeCheval", leCheval);
                    request.setAttribute("pLesChevauxCourses", lesChevauxCourses);
                    this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/show.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/cheval-servlet/list");
                }
            } catch (NumberFormatException e) {
                System.out.println("Erreur : l'id du cheval n'est pas un nombre valide");
                response.sendRedirect(request.getContextPath() + "/cheval-servlet/list");
            }

        }

        if ("/add".equals(path)) {
            ArrayList<Race> lesRaces = DaoRace.getLesRaces(cnx);
            request.setAttribute("pLesRaces", lesRaces);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/add.jsp").forward(request, response);
        }

        if ("/update".equals(path)) {
            try {
                // 1. Récupérer l'ID du cheval à modifier
                int idCheval = Integer.parseInt(request.getParameter("idCheval"));

                // 2. Aller chercher les infos actuelles du cheval
                Cheval leCheval = DaoCheval.getLeCheval(cnx, idCheval);

                if (leCheval != null) {
                    // 3. Envoyer le cheval à la vue
                    request.setAttribute("pLeCheval", leCheval);

                    // 4. Envoyer aussi la liste des races pour le menu déroulant
                    ArrayList<Race> lesRaces = DaoRace.getLesRaces(cnx);
                    request.setAttribute("pLesRaces", lesRaces);

                    this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/update.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/cheval-servlet/list");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/cheval-servlet/list");
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if ("/add".equals(path)) {
            try {
                // Récupération des données du formulaire
                String nom = request.getParameter("nom");
                String sire = request.getParameter("sire");
                String sexe = request.getParameter("sexe");
                String dateNaissanceStr = request.getParameter("dateNaissance");
                int raceId = Integer.parseInt(request.getParameter("race"));

                // Création d'un nouveau cheval
                Cheval nouveauCheval = new Cheval();
                nouveauCheval.setNom(nom);
                nouveauCheval.setSire(sire);
                nouveauCheval.setSexe(sexe);

                // Gestion de la date de naissance
                if (dateNaissanceStr != null && !dateNaissanceStr.isEmpty()) {
                    LocalDate dateNaissance = LocalDate.parse(dateNaissanceStr);
                    nouveauCheval.setDateNaissance(dateNaissance);
                }

                // Récupération et attribution de la race
                Race race = DaoRace.getRaceById(cnx, raceId);
                if (race != null) {
                    nouveauCheval.setRace(race);
                } else {
                    throw new Exception("La race sélectionnée n'existe pas");
                }

                // Tentative d'ajout en base de données
                if (DaoCheval.ajouterCheval(cnx, nouveauCheval)) {
                    // Redirection vers la page de consultation du cheval nouvellement créé
                    response.sendRedirect(request.getContextPath() + "/cheval-servlet/show?idCheval=" + nouveauCheval.getId());
                } else {
                    throw new Exception("Erreur lors de l'enregistrement du cheval");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("message", "Erreur : la race sélectionnée n'est pas valide");
                request.setAttribute("pLesRaces", DaoRace.getLesRaces(cnx));
                this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/add.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("message", "Erreur : " + e.getMessage());
                request.setAttribute("pLesRaces", DaoRace.getLesRaces(cnx));
                this.getServletContext().getRequestDispatcher("/WEB-INF/views/cheval/add.jsp").forward(request, response);
            }
        }

        if ("/update".equals(path)) {
            try {
                // Récupération de TOUTES les données (y compris l'ID caché)
                int idCheval = Integer.parseInt(request.getParameter("id"));
                String nom = request.getParameter("nom");
                String sire = request.getParameter("sire");
                String sexe = request.getParameter("sexe");
                String dateNaissanceStr = request.getParameter("dateNaissance");
                int raceId = Integer.parseInt(request.getParameter("race"));

                // Création de l'objet contenant les nouvelles infos
                Cheval chevalModifie = new Cheval();
                chevalModifie.setId(idCheval); // TRÈS IMPORTANT
                chevalModifie.setNom(nom);
                chevalModifie.setSire(sire);
                chevalModifie.setSexe(sexe);

                if (dateNaissanceStr != null && !dateNaissanceStr.isEmpty()) {
                    chevalModifie.setDateNaissance(LocalDate.parse(dateNaissanceStr));
                }

                Race race = DaoRace.getRaceById(cnx, raceId);
                if (race != null) {
                    chevalModifie.setRace(race);
                } else {
                    throw new Exception("La race sélectionnée n'existe pas");
                }

                // Exécution de la modification
                if (DaoCheval.modifierCheval(cnx, chevalModifie)) {
                    response.sendRedirect(request.getContextPath() + "/cheval-servlet/show?idCheval=" + idCheval);
                } else {
                    throw new Exception("Erreur lors de la modification en base");
                }

            } catch (Exception e) {
                // En cas d'erreur, on redirige vers la liste (ou on pourrait réafficher le form d'erreur)
                System.out.println("Erreur modification : " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/cheval-servlet/list");
            }
        }
    }

    public void destroy() {
    }
}