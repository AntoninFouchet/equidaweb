package database;

import java.sql.*;
import java.util.ArrayList;
import model.Cheval;
import model.Lot;
import model.Race;
import model.Vente;

public class DaoLot {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    // Récupérer tous les lots d'une vente
    public static ArrayList<Lot> getLesLotsParVente(Connection cnx, int idVente) {
        ArrayList<Lot> lesLots = new ArrayList<Lot>();
        try {
            requeteSql = cnx.prepareStatement(
                "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                "l.id as lot_id, l.prixDepart as lot_prix, " +
                "c.id as cheval_id, c.nom as cheval_nom, c.dateNaissance as cheval_dateNaissance, " +
                "r.nom as race_nom " +
                "FROM lot l " +
                "JOIN vente v ON l.vente_id = v.id " +
                "JOIN cheval c ON l.cheval_id = c.id " +
                "JOIN race r ON  c.race_id = r.id " +
                "WHERE v.id = ?"
            );

            requeteSql.setInt(1, idVente);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()) {
                Vente v = new Vente();
                v.setId(resultatRequete.getInt("v_id"));
                v.setNom(resultatRequete.getString("v_nom"));
                v.setDateDebutVente(resultatRequete.getString("v_dateDebutVente"));

                Lot lot = new Lot();
                lot.setId(resultatRequete.getInt("lot_id"));
                lot.setPrixDepart(resultatRequete.getInt("lot_prix"));

                Cheval c = new Cheval();
                c.setId(resultatRequete.getInt("cheval_id"));
                c.setNom(resultatRequete.getString("cheval_nom"));
                
                Race r = new Race();
                r.setNom(resultatRequete.getString("race_nom"));
                
                
                c.setRace(r);
                lot.setCheval(c);
                lot.setVente(v);

                lesLots.add(lot);
                v.addLot(lot);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLesLotsParVente a généré une exception SQL");
        }
        return lesLots;
    }
}
