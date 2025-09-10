/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import model.Lot;
import model.Vente;

/**
 *
 * @author sio2
 */
public class TestLot {    

    public static void main (String args[]){

        Lot l = new Lot();
        l.setId(1);
        l.setPrixDepart(2000);
        
        Vente v = new Vente();
        v.setId(2);
        v.setNom("testVente");
        v.setDateDebutVente("2024-06-18");
    

        System.out.println("Lot n° : " + l.getId() + " Prix de départ : " + l.getPrixDepart() 
                + "vente n° : " + v.getId() + " nom : " +  v.getNom()+" le : " + v.getDateDebutVente() );
    }
}