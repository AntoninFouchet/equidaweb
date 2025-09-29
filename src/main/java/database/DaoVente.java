/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Vente;
import model.Lieu;

/**
 *
 * @author sio2
 */
public class DaoVente {
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    /**
     * Récupère tous les chevaux présents dans la base de données avec leurs races associées
     * @param cnx La connexion active à la base de données
     * @return ArrayList<Vente> La liste de tous les chevaux trouvés
     */
    public static ArrayList<Vente> getLesVentes(Connection cnx) {
        ArrayList<Vente> lesVentes = new ArrayList<Vente>();
        try {
           requeteSql = cnx.prepareStatement(
                "SELECT v.id as v_id, v.nom as v_nom, v.dateDebutVente as v_dateDebutVente, " +
                "l.id as l_id, l.ville as l_ville, l.nbBoxes as l_nbBoxes, l.commentaires as l_commentaires " +
                "FROM vente v " +
                "INNER JOIN Lieu l ON v.lieu_id = l.id"
);



            resultatRequete = requeteSql.executeQuery();
            while (resultatRequete.next()) {
                Vente v = new Vente();
                v.setId(resultatRequete.getInt("v_id"));
                v.setNom(resultatRequete.getString("v_nom"));
                v.setDateDebutVente(resultatRequete.getString("v_dateDebutVente"));
                
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
                "INNER JOIN Lieu l ON v.lieu_id = l.id " +
                "WHERE v.id = ?" 
);
            


            requeteSql.setInt(1, idVente);
            
            System.out.println(requeteSql);
            resultatRequete = requeteSql.executeQuery();
            if (resultatRequete.next()) {
                v = new Vente();
                v.setId(resultatRequete.getInt("v_id"));
                v.setNom(resultatRequete.getString("v_nom"));
                v.setDateDebutVente(resultatRequete.getString("v_dateDebutVente"));
                
                System.out.println("NOM VENTE " + v.getNom());
                
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
     * Ajoute un nouveau vente dans la base de données
     * @param cnx La connexion active à la base de données
     * @param vente Le vente à ajouter
     * @return boolean true si l'ajout a réussi, false sinon
     */
    public static boolean ajouterVente(Connection cnx, Vente vente) {
    try {
        requeteSql = cnx.prepareStatement(
            "NSERT INTO Vente (nom, dateDebutVente, categvente_code, lieu_id) VALUES (? ,? ,? ,? )",
            PreparedStatement.RETURN_GENERATED_KEYS
        );
        requeteSql.setString(1, vente.getNom());
        /*
        // Gestion de la date de naissance
        if (vente.getDateDebutVente() != null) {
            requeteSql.setDate(2, java.sql.Date.valueOf(vente.getDateDebutVente()));
        } else {
            requeteSql.setNull(2, java.sql.Types.DATE);
        }
        */
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
        System.out.println("Erreur lors de l'ajout du vente");
        return false;
    }
}
}
    