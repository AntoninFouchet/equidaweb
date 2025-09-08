/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import model.CategVente;

/**
 *
 * @author sio2
 */
public class TestCategVente {
   
       

    public static void main (String args[]){


        CategVente c = new CategVente();
        c.setCode(2);
        c.setLibelle("testCategVente");
   
        System.out.println("CategVente : " + c.getCode() + " " + c.getLibelle());
    }
}

