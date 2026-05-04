package database;

import model.Cheval;
import model.Race;
import model.ChevalCourse;
import model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoCheval {

    /**
     * Récupère tous les chevaux présents dans la base de données avec leurs races associées
     * @param cnx La connexion active à la base de données
     * @return ArrayList<Cheval> La liste de tous les chevaux trouvés
     */
    public static ArrayList<Cheval> getLesChevaux(Connection cnx) {
        ArrayList<Cheval> lesChevaux = new ArrayList<Cheval>();
        // On déclare les objets SQL localement pour éviter les conflits entre utilisateurs
        PreparedStatement requeteSql = null;
        ResultSet resultatRequete = null;

        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT c.id as c_id, c.nom as c_nom, " +
                            "r.id as r_id, r.libelle as r_libelle " +
                            "FROM cheval c " +
                            "INNER JOIN race r ON c.race_id = r.id"
            );

            resultatRequete = requeteSql.executeQuery();
            while (resultatRequete.next()) {
                Cheval c = new Cheval();
                c.setId(resultatRequete.getInt("c_id"));
                c.setNom(resultatRequete.getString("c_nom"));
                Race r = new Race();
                r.setId(resultatRequete.getInt("r_id"));
                r.setNom(resultatRequete.getString("r_libelle"));
                c.setRace(r);
                lesChevaux.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLesChevaux a généré une exception SQL");
        } finally {
            // fermer les ressources après utilisation
            try { if (resultatRequete != null) resultatRequete.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
        return lesChevaux;
    }

    /**
     * Récupère un cheval spécifique par son identifiant
     * @param cnx La connexion active à la base de données
     * @param idCheval L'identifiant du cheval recherché
     * @return Cheval Le cheval trouvé ou null si non trouvé
     */
    public static Cheval getLeCheval(Connection cnx, int idCheval) {
        Cheval cheval = null;
        PreparedStatement requeteSql = null;
        ResultSet resultatRequete = null;

        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT c.id AS c_id, c.nom AS c_nom, c.dateNaissance AS c_dateNaissance, " +
                            "c.sire AS c_sire, c.sexe AS c_sexe, " +
                            "r.id AS r_id, r.libelle AS r_libelle, " +
                            "cpere.id AS pere_id, cpere.nom AS pere_nom, " +
                            "cmere.id AS mere_id, cmere.nom AS mere_nom " +
                            "FROM cheval c " +
                            "INNER JOIN race r ON c.race_id = r.id " +
                            "LEFT JOIN cheval cpere ON c.pere_id = cpere.id " +
                            "LEFT JOIN cheval cmere ON c.mere_id = cmere.id " +
                            "WHERE c.id = ?"
            );

            requeteSql.setInt(1, idCheval);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()) {
                cheval = new Cheval();
                cheval.setId(resultatRequete.getInt("c_id"));
                cheval.setNom(resultatRequete.getString("c_nom"));

                // NOUVEAU : On récupère le sire et le sexe
                cheval.setSire(resultatRequete.getString("c_sire"));
                cheval.setSexe(resultatRequete.getString("c_sexe"));

                java.sql.Date dateN = resultatRequete.getDate("c_dateNaissance");
                if (dateN != null) {
                    cheval.setDateNaissance(dateN.toLocalDate());
                }

                Race race = new Race();
                race.setId(resultatRequete.getInt("r_id"));
                race.setNom(resultatRequete.getString("r_libelle"));
                cheval.setRace(race);

                int pereId = resultatRequete.getInt("pere_id");
                if (!resultatRequete.wasNull()) {
                    Cheval pere = new Cheval();
                    pere.setId(pereId);
                    pere.setNom(resultatRequete.getString("pere_nom"));
                    cheval.setChevalpere(pere);
                }

                int mereId = resultatRequete.getInt("mere_id");
                if (!resultatRequete.wasNull()) {
                    Cheval mere = new Cheval();
                    mere.setId(mereId);
                    mere.setNom(resultatRequete.getString("mere_nom"));
                    cheval.setChevalmere(mere);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLeCheval a généré une exception SQL");
        } finally {
            try { if (resultatRequete != null) resultatRequete.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }

        return cheval;
    }

    public static ArrayList<ChevalCourse> getLesCoursesByCheval(Connection cnx, int idCheval) {
        ArrayList<ChevalCourse> lesChevauxCourses = new ArrayList<>();
        PreparedStatement requeteSql = null;
        ResultSet resultatRequete = null;

        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT co.id as co_id, co.nom as co_nom, co.lieu as co_lieu, co.date as co_date, " +
                            "cc.resultat as cc_resultat " +
                            "FROM course co " +
                            "JOIN cheval_course cc ON co.id = cc.course_id " +
                            "JOIN cheval c ON cc.cheval_id = c.id " +
                            "WHERE c.id = ?"
            );
            requeteSql.setInt(1, idCheval);

            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()) {
                Course course = new Course();
                course.setId(resultatRequete.getInt("co_id"));
                course.setNom(resultatRequete.getString("co_nom"));
                course.setLieu(resultatRequete.getString("co_lieu"));
                course.setDate(resultatRequete.getString("co_date"));

                ChevalCourse chevalcourse = new ChevalCourse();
                chevalcourse.setCourse(course);
                chevalcourse.setPosition(resultatRequete.getInt("cc_resultat"));

                lesChevauxCourses.add(chevalcourse);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("La requête de getLesCoursesByCheval a généré une exception SQL");
        } finally {
            try { if (resultatRequete != null) resultatRequete.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
        return lesChevauxCourses;
    }

    /**
     * Ajoute un nouveau cheval dans la base de données
     * @param cnx La connexion active à la base de données
     * @param cheval Le cheval à ajouter
     * @return boolean true si l'ajout a réussi, false sinon
     */
    public static boolean ajouterCheval(Connection cnx, Cheval cheval) {
        PreparedStatement requeteSql = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "INSERT INTO cheval (nom, dateNaissance, race_id, sire, sexe) VALUES (?, ?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            requeteSql.setString(1, cheval.getNom());

            // Gestion de la date de naissance
            if (cheval.getDateNaissance() != null) {
                requeteSql.setDate(2, java.sql.Date.valueOf(cheval.getDateNaissance()));
            } else {
                requeteSql.setNull(2, java.sql.Types.DATE);
            }

            requeteSql.setInt(3, cheval.getRace().getId());

            requeteSql.setString(4, cheval.getSire());

            requeteSql.setString(5, cheval.getSexe());

            int result = requeteSql.executeUpdate();

            if (result == 1) {
                // Récupération de l'id auto-généré
                ResultSet rs = requeteSql.getGeneratedKeys();
                if (rs.next()) {
                    cheval.setId(rs.getInt(1));
                }
                return true;
            }
            return false;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur lors de l'ajout du cheval"+ e.getMessage());
            return false;
        } finally {
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
    }

    /**
     * Modifie un cheval existant dans la base de données
     * @param cnx La connexion active à la base de données
     * @param cheval Le cheval avec ses nouvelles données (doit avoir un ID)
     * @return boolean true si la modification a réussi, false sinon
     */
    public static boolean modifierCheval(Connection cnx, Cheval cheval) {
        PreparedStatement requeteSql = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "UPDATE cheval SET nom = ?, dateNaissance = ?, race_id = ?, sire = ?, sexe = ? WHERE id = ?"
            );
            requeteSql.setString(1, cheval.getNom());

            // Gestion de la date de naissance
            if (cheval.getDateNaissance() != null) {
                requeteSql.setDate(2, java.sql.Date.valueOf(cheval.getDateNaissance()));
            } else {
                requeteSql.setNull(2, java.sql.Types.DATE);
            }

            requeteSql.setInt(3, cheval.getRace().getId());
            requeteSql.setString(4, cheval.getSire());
            requeteSql.setString(5, cheval.getSexe());

            // L'ID du cheval à modifier
            requeteSql.setInt(6, cheval.getId());

            int result = requeteSql.executeUpdate();
            return (result == 1); // Retourne vrai si 1 ligne a bien été modifiée

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Erreur lors de la modification du cheval : " + e.getMessage());
            return false;
        } finally {
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
    }
}