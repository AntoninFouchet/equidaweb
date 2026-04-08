package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Vente;
import model.Lieu;

public class DaoVente {
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    /**
     * Récupère toutes les ventes présentes dans la base de données avec leurs lieux associés
     * @param cnx La connexion active à la base de données
     * @return ArrayList<Vente> La liste de toutes les ventes trouvées
     */
    public static ArrayList<Vente> getLesVentes(Connection cnx) {
        ArrayList<Vente> lesVentes = new ArrayList<Vente>();
        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                            "l.id as l_id, l.ville as l_ville, l.nbBoxes as l_nbBoxes, l.commentaires as l_commentaires " +
                            "FROM vente v " +
                            "INNER JOIN lieu l ON v.lieu_id = l.id"
            );

            resultatRequete = requeteSql.executeQuery();
            while (resultatRequete.next()) {
                Vente v = new Vente();
                v.setId(resultatRequete.getInt("v_id"));
                v.setNom(resultatRequete.getString("v_nom"));

                java.sql.Date dateSQL = resultatRequete.getDate("v_dateDebutVente");
                if (dateSQL != null) {
                    v.setDateDebutVente(dateSQL.toLocalDate());
                }

                Lieu l = new Lieu();
                l.setId(resultatRequete.getInt("l_id"));
                l.setVille(resultatRequete.getString("l_ville"));
                l.setNbBoxes(resultatRequete.getInt("l_nbBoxes"));
                l.setCommentaires(resultatRequete.getString("l_commentaires"));

                v.setLieu(l);
                lesVentes.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLesVentes a généré une exception SQL");
        }
        return lesVentes;
    }

    public static Vente getLaVente(Connection cnx, int idVente) {
        Vente v = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                            "l.id as l_id, l.ville as l_ville, l.nbBoxes as l_nbBoxes, l.commentaires as l_commentaires " +
                            "FROM vente v " +
                            "INNER JOIN lieu l ON v.lieu_id = l.id " +
                            "WHERE v.id = ?"
            );

            requeteSql.setInt(1, idVente);

            resultatRequete = requeteSql.executeQuery();
            if (resultatRequete.next()) {
                v = new Vente();
                v.setId(resultatRequete.getInt("v_id"));
                v.setNom(resultatRequete.getString("v_nom"));

                java.sql.Date dateSQL = resultatRequete.getDate("v_dateDebutVente");
                if (dateSQL != null) {
                    v.setDateDebutVente(dateSQL.toLocalDate());
                }

                Lieu l = new Lieu();
                l.setId(resultatRequete.getInt("l_id"));
                l.setVille(resultatRequete.getString("l_ville"));
                l.setNbBoxes(resultatRequete.getInt("l_nbBoxes"));
                l.setCommentaires(resultatRequete.getString("l_commentaires"));

                v.setLieu(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLaVente a généré une exception SQL");
        }
        return v;
    }

    /**
     * Ajoute une nouvelle vente dans la base de données
     * @param cnx La connexion active à la base de données
     * @param vente La vente à ajouter
     * @return boolean true si l'ajout a réussi, false sinon
     */
    public static boolean ajouterVente(Connection cnx, Vente vente) {
        try {
            requeteSql = cnx.prepareStatement(
                    "INSERT INTO vente (nom, dateDebutVente, lieu_id) VALUES (?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            requeteSql.setString(1, vente.getNom());
            if (vente.getDateDebutVente() != null) {
                requeteSql.setDate(2, java.sql.Date.valueOf(vente.getDateDebutVente()));
            } else {
                requeteSql.setNull(2, java.sql.Types.DATE);
            }

            requeteSql.setInt(3, vente.getLieu().getId());

            int result = requeteSql.executeUpdate();

            if (result == 1) {
                // Récupération de l'id auto-généré
                ResultSet rs = requeteSql.getGeneratedKeys();
                if (rs.next()) {
                    vente.setId(rs.getInt(1));
                }
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur lors de l'ajout de la vente");
            return false;
        }
    }
}