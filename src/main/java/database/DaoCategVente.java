package database;

import model.CategVente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoCategVente {

    public static ArrayList<CategVente> getLesCategVentes(Connection cnx) {
        ArrayList<CategVente> lesCategs = new ArrayList<>();
        PreparedStatement requeteSql = null;
        ResultSet rs = null;
        try {
            requeteSql = cnx.prepareStatement("SELECT code, libelle FROM categvente");
            rs = requeteSql.executeQuery();
            while (rs.next()) {
                CategVente c = new CategVente();
                c.setCode(rs.getString("code"));
                c.setLibelle(rs.getString("libelle"));
                lesCategs.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) {}
            try { if (requeteSql != null) requeteSql.close(); } catch (SQLException e) {}
        }
        return lesCategs;
    }
}