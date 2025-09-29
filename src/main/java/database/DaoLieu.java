package database;

import model.Lieu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoLieu {
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    /**
     * Récupère toutes les races présentes dans la base de données
     * @param cnx La connexion active à la base de données
     * @return ArrayList<Lieu> La liste de toutes les races trouvées
     */
    public static ArrayList<Lieu> getLesLieux(Connection cnx) {
        ArrayList<Lieu> lesLieux = new ArrayList<Lieu>();
        try {
            requeteSql = cnx.prepareStatement(
                "SELECT id, nom FROM race ORDER BY nom"
            );
            resultatRequete = requeteSql.executeQuery();
            while (resultatRequete.next()) {
                Lieu lieu = new Lieu();
                lieu.setId(resultatRequete.getInt("l_id"));
                lieu.setVille(resultatRequete.getString("l_ville"));
                lieu.setNbBoxes(resultatRequete.getInt("l_nbBoxes"));
                lieu.setCommentaires(resultatRequete.getString("l_commentaires"));
                lesLieux.add(lieu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLesLieux a généré une exception SQL");
        }
        return lesLieux;
    }

    /**
     * Récupère une lieu spécifique par son identifiant
     * @param cnx La connexion active à la base de données
     * @param id L'identifiant de la lieu recherchée
     * @return Lieu La lieu trouvée ou null si non trouvée
     */
    public static Lieu getLieuById(Connection cnx, int id) {
        Lieu lieu = null;
        try {
            requeteSql = cnx.prepareStatement(
                "SELECT id, nom FROM lieu WHERE id = ?"
            );
            requeteSql.setInt(1, id);
            resultatRequete = requeteSql.executeQuery();
            if (resultatRequete.next()) {
                lieu  = new Lieu();

                lieu.setId(resultatRequete.getInt("l_id"));
                lieu.setVille(resultatRequete.getString("l_ville"));
                lieu.setNbBoxes(resultatRequete.getInt("l_nbBoxes"));
                lieu.setCommentaires(resultatRequete.getString("l_commentaires"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLieuById a généré une exception SQL");
        }
        return lieu;
    }
}