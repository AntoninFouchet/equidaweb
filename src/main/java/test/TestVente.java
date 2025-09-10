/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;


import model.CategVente;
import model.Lieu;
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

        Vente v = new Vente();
        v.setId(2);
        v.setNom("testVente");
        v.setDateDebutVente("2024-06-18");

        System.out.println("Lieux : " + l.getId() + " " + l.getVille() +  " " + l.getNbBoxes() + " " + l.getCommentaires() +", "
                +"CategVente : " + c.getCode() + " " + c.getLibelle() + ", " 
                        + "Vente : " + v.getId() + " " + v.getNom() + " "+ v.getDateDebutVente());
    }
}
