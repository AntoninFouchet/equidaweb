/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Enchere {
    private int numero;
    private int montant;
    private Lot lot;

    public int getMontant() {
        return montant;
    }

    public int getNumero() {
        return numero;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public Lot getLot() {
        return lot;
    }
    
    public void setLot(Lot lot) {
        this.lot = lot;
    }
    
}
