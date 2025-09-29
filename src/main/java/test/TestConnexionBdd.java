package test;

import java.sql.Connection;
import java.util.ArrayList;

import database.Connexionbdd;
import database.DaoCheval;
import database.DaoVente;
import model.Vente;

public class TestConnexionBdd {

    public static void main (String args[]) {

        Connection cnx = Connexionbdd.ouvrirConnexion();
        System.out.println ("nombre de chevaux = " + DaoCheval.getLesChevaux(cnx).size());
        
        System.out.println("Le cheval numero 5 = " + DaoCheval.getLeCheval(cnx,5).getNom());
        
        System.out.println("Nombre de ventes = " + DaoVente.getLesVentes(cnx).size());
        
        System.out.println("La vente numero 5 = " + DaoVente.getLaVente(cnx,5).getNom());
        

      

            }

}
