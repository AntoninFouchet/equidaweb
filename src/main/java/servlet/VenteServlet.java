package servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.DaoVente;
import database.DaoLieu;
import database.DaoLot;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Vente;
import model.Lieu;
import java.time.LocalDate;
import model.Lot;

@WebServlet(name = "venteServlet", value = "/vente-servlet/*")
public class VenteServlet extends HttpServlet {

    Connection cnx;
    
    @Override
    public void init() {
        ServletContext servletContext = getServletContext();
        cnx = (Connection)servletContext.getAttribute("connection");
        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(VenteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = request.getPathInfo();
        System.out.println("PathInfo: " + path);

        if ("/list".equals(path)) {
            ArrayList<Vente> lesChevaux = DaoVente.getLesVentes(cnx);
            request.setAttribute("pLesVentes", lesChevaux);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/list.jsp").forward(request, response);
        }
        if ("/show".equals(path)) {
            try {
                int idVente = Integer.parseInt(request.getParameter("idVente"));
                Vente laVente = DaoVente.getLaVente(cnx, idVente);

                if (laVente != null) {
                    ArrayList<Lot> lesLots = DaoLot.getLesLotsParVente(cnx, idVente);
                    laVente.setLesLots(lesLots);
                    request.setAttribute("pLaVente", laVente);
                    this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/show.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/vente-servlet/lister");
                }
            } catch (NumberFormatException e) {
                System.out.println("Erreur : l'id du vente n'est pas un nombre valide");
                response.sendRedirect(request.getContextPath() + "/vente-servlet/lister");
            }

        }

        if ("/add".equals(path)) {
            ArrayList<Lieu> lesLieux = DaoLieu.getLesLieux(cnx);
            request.setAttribute("pLesLieux", lesLieux);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/add.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if ("/add".equals(path)) {
            try {
                // Récupération des données du formulaire
                String nom = request.getParameter("nom");
                String dateDebutVenteStr = request.getParameter("dateDebutVente");
                int raceId = Integer.parseInt(request.getParameter("lieu"));

                // Création d'un nouveau vente
                Vente nouvelleVente = new Vente();
                nouvelleVente.setNom(nom);

                // Gestion de la date de debut de vente
                // Gestion de la date de debut de vente (en String)

                if (dateDebutVenteStr != null && !dateDebutVenteStr.isEmpty()) {
                nouvelleVente.setDateDebutVente(dateDebutVenteStr);
                }

                // Récupération et attribution du lieu
                Lieu lieu = DaoLieu.getLieuById(cnx, raceId);
                if (lieu != null) {
                    nouvelleVente.setLieu(lieu);
                } else {
                    throw new Exception("Le lieu sélectionné n'existe pas");
                }

                // Tentative d'ajout en base de données
                if (DaoVente.ajouterVente(cnx, nouvelleVente)) {
                    // Redirection vers la page de consultation du vente nouvellement créé
                    response.sendRedirect(request.getContextPath() + "/vente-servlet/show?idVente=" + nouvelleVente.getId());
                } else {
                    throw new Exception("Erreur lors de l'enregistrement du vente");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("message", "Erreur : le lieu sélectionnée n'est pas valide");
                request.setAttribute("pLesLieux", DaoLieu.getLesLieux(cnx));
                this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/add.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("message", "Erreur : " + e.getMessage());
                request.setAttribute("pLesLieux", DaoLieu.getLesLieux(cnx));
                this.getServletContext().getRequestDispatcher("/WEB-INF/views/vente/add.jsp").forward(request, response);
            }
        }
    }
}