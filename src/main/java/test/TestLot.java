/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import model.Lot;
import model.Vente;
import model.Enchere;

/**
 *
 * @author sio2
 */
public class TestLot {    

    public static void main (String args[]){
        
                Vente v = new Vente();
        v.setId(2);
        v.setNom("testVente");
        v.setDateDebutVente("2024-06-18");
              
        Enchere e = new Enchere();
        e.setNumero(3);
        e.setMontant(5000);          
    
        Lot l = new Lot();
        l.setId(1);
        l.setPrixDepart(2000);
        
        l.addEnchere(e);
 
        
        System.out.println("Lot n° : " + l.getId() + " Prix de départ : " + l.getPrixDepart() 
                + "vente n° : " + v.getId() + " nom : " +  v.getNom()+" le : " + v.getDateDebutVente() );
        
         System.out.println("Liste des enchaires : ");
         for (Enchere enchere : l.getLesEncheres()) {
                System.out.println("Enchère n° : " + enchere.getNumero() + " Montant : " + enchere.getMontant());
         }
    }
}