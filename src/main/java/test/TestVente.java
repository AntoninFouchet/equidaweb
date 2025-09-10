/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;


import model.CategVente;
import model.Lieu;
import model.Lot;
import model.Vente;

/**
 *
 * @author sio2
 */
public class TestVente {
    
    public static void main (String args[]){
        CategVente c = new CategVente();
        c.setCode(1);
        c.setLibelle("TestCategVente");
    
        Lieu l = new Lieu();
        l.setId(1);
        l.setVille("Caen");
        l.setNbBoxes(2);
        l.setCommentaires("TestComment");
        
        Lot lo = new Lot();
        lo.setId(4);
        lo.setPrixDepart(2000);
        
        Vente v1 = new Vente();
        v1.setId(2);
        v1.setNom("testVente");
        v1.setDateDebutVente("2024-06-18");
      
        v1.addLot(lo);
        
        System.out.println("Lieux : " + l.getId() + " " + l.getVille() +  " " + l.getNbBoxes() + " " + l.getCommentaires() +", "
                +"CategVente : " + c.getCode() + " " + c.getLibelle() + ", " 
                        + "Vente : " + v1.getId() + " " + v1.getNom() + " "+ v1.getDateDebutVente());
        
        System.out.println("Liste des lots : ");
        for (Lot lot : v1.getLesLots()){
            System.out.println("Lot numéro : " + lot.getId() + " " + lot.getPrixDepart());
        }
    }
}
