/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;


import model.Vente;

/**
 *
 * @author sio2
 */
public class TestVente {
    

    public static void main (String args[]){


        Vente v = new Vente();
        v.setId(2);
        v.setNom("testVente");
        v.setDateDebutVente("2024-06-18");

        //affectation de  la race au cheval grâce à la relation ManyToOne

        // Affichage des informations dans la console
        //voir notamment du nom de la race du cheval
        System.out.println("Vente : " + v.getId() + " " + v.getNom() + " "
                + v.getDateDebutVente());
    }
}
