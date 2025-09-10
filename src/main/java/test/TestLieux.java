/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import model.Lieu;
import model.Vente;

/**
 *
 * @author sio2
 */
public class TestLieux {

    public static void main (String args[]){
        
        Lieu l = new Lieu();
        l.setId(1);
        l.setVille("Caen");
        l.setNbBoxes(100);
        l.setCommentaires("commentaire");
        
        Vente v = new Vente();
        v.setId(2);
        v.setNom("nom");
        v.setDateDebutVente("2020-12-6");       
        
        
        l.addVente(v);
        
         System.out.println("Lieu n° : " + l.getId() + " Ville : " + l.getVille() 
                + " Nb boxes : " + l.getNbBoxes() + " Commentaires : " + l.getCommentaires());
        
        
        for (Vente vente : l.getLesVentes()) {
                System.out.println("Vente n° : " + vente.getId() + " nom : " + vente.getNom() 
                + " le : " + vente.getDateDebutVente());
        }
    }    
}