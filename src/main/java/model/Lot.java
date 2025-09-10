/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author sio2
 */
public class Lot {
    private int id;
    private int prixDepart;
    private Vente vente;

    private ArrayList<Enchere> lesEncheres ;
    
    public Lot() {
    }

    public int getId() {
        return id;
    }

    public int getPrixDepart() {
        return prixDepart;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPrixDepart(int prixDepart) {
        this.prixDepart = prixDepart;
    }
    
    public Vente getVente() {
        return vente;
    }
    public void setVente(Vente vente) {
        this.vente = vente;
    }
        
    public ArrayList<Enchere> getLesEncheres() {
        return lesEncheres;
    }

    public void setLesEncheres(ArrayList<Enchere> lesEncheres) {
        this.lesEncheres = lesEncheres;
    }
    public void addEnchere(Enchere unEnchere){
        if (lesEncheres ==null ){
            lesEncheres = new ArrayList<Enchere>();
        }
        lesEncheres.add(unEnchere);
    }
    
    
}
