/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

/**
 *
 * @author sio2
 */
import model.Enchere;
import model.Lot;

public class TestEnchere {
    

    public static void main (String args[]){

        Enchere e = new Enchere();
        e.setNumero(1);
        e.setMontant(10);
    
        Lot l = new Lot();
        l.setId(1);
        l.setPrixDepart(50);

        System.out.println("Enchere : " + e.getNumero() + " " + e.getMontant()
                + ", Lot : " + l.getId() + " " + l.getPrixDepart());
    }
}