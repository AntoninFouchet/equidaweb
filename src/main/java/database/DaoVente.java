package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Vente;
import model.Lieu;
import model.CategVente;

public class DaoVente {

    /**
     * Récupère toutes les ventes avec leurs lieux et catégories associés
     */
    public static ArrayList<Vente> getLesVentes(Connection cnx) {
        ArrayList<Vente> lesVentes = new ArrayList<Vente>();
        PreparedStatement requeteSql = null;
        ResultSet resultatRequete = null;

        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                            "l.id as l_id, l.ville as l_ville, l.nbBoxes as l_nbBoxes, l.commentaires as l_commentaires, " +
                            "c.code as c_code, c.libelle as c_libelle " +
                            "FROM vente v " +
                            "INNER JOIN lieu l ON v.lieu_id = l.id " +
                            "LEFT JOIN categvente c ON v.categvente_code = c.code"
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

                String codeCateg = resultatRequete.getString("c_code");
                if (codeCateg != null) {
                    CategVente cv = new CategVente();
                    cv.setCode(codeCateg);
                    cv.setLibelle(resultatRequete.getString("c_libelle"));
                    v.setCategVente(cv);
                }

                lesVentes.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur SQL dans getLesVentes : " + e.getMessage());
        } finally {
            try { if (resultatRequete != null) resultatRequete.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
        return lesVentes;
    }

    /**
     * Récupère une vente par son id
     */
    public static Vente getLaVente(Connection cnx, int idVente) {
        Vente v = null;
        PreparedStatement requeteSql = null;
        ResultSet resultatRequete = null;

        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                            "l.id as l_id, l.ville as l_ville, l.nbBoxes as l_nbBoxes, l.commentaires as l_commentaires, " +
                            "c.code as c_code, c.libelle as c_libelle " +
                            "FROM vente v " +
                            "INNER JOIN lieu l ON v.lieu_id = l.id " +
                            "LEFT JOIN categvente c ON v.categvente_code = c.code " +
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

                // NOUVEAU : Récupération correcte de la catégorie
                String codeCateg = resultatRequete.getString("c_code");
                if (codeCateg != null) {
                    CategVente cv = new CategVente();
                    cv.setCode(codeCateg);
                    cv.setLibelle(resultatRequete.getString("c_libelle"));
                    v.setCategVente(cv);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur SQL dans getLaVente : " + e.getMessage());
        } finally {
            try { if (resultatRequete != null) resultatRequete.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
        return v;
    }

    public static boolean ajouterVente(Connection cnx, Vente vente) {
        PreparedStatement requeteSql = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "INSERT INTO vente (nom, dateDebutVente, lieu_id, categvente_code) VALUES (?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            requeteSql.setString(1, vente.getNom());

            if (vente.getDateDebutVente() != null) {
                requeteSql.setDate(2, java.sql.Date.valueOf(vente.getDateDebutVente()));
            } else {
                requeteSql.setNull(2, java.sql.Types.DATE);
            }

            requeteSql.setInt(3, vente.getLieu().getId());

            if (vente.getCategVente() != null && vente.getCategVente().getCode() != null) {
                requeteSql.setString(4, vente.getCategVente().getCode());
            } else {
                requeteSql.setNull(4, java.sql.Types.VARCHAR);
            }

            int result = requeteSql.executeUpdate();

            if (result == 1) {
                ResultSet rs = requeteSql.getGeneratedKeys();
                if (rs.next()) {
                    vente.setId(rs.getInt(1));
                }
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur SQL lors de l'ajout : " + e.getMessage());
            return false;
        } finally {
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
    }

    public static boolean modifierVente(Connection cnx, Vente vente) {
        PreparedStatement requeteSql = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "UPDATE vente SET nom = ?, dateDebutVente = ?, lieu_id = ?, categvente_code = ? WHERE id = ?"
            );
            requeteSql.setString(1, vente.getNom());

            if (vente.getDateDebutVente() != null) {
                requeteSql.setDate(2, java.sql.Date.valueOf(vente.getDateDebutVente()));
            } else {
                requeteSql.setNull(2, java.sql.Types.DATE);
            }

            requeteSql.setInt(3, vente.getLieu().getId());

            if (vente.getCategVente() != null && vente.getCategVente().getCode() != null && !vente.getCategVente().getCode().isEmpty()) {
                requeteSql.setString(4, vente.getCategVente().getCode());
            } else {
                requeteSql.setNull(4, java.sql.Types.VARCHAR);
            }

            requeteSql.setInt(5, vente.getId());

            int result = requeteSql.executeUpdate();
            return (result == 1);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur SQL lors de la modification : " + e.getMessage());
            return false;
        } finally {
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
    }
}