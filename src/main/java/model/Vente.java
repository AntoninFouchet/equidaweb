package model;

import java.util.Date;

public class Vente {

    private int id;
    private String nom;
    private String dateDebutVente;

    public Vente() {
    }
    
    public Vente(String dateDebutVente) {
        this.dateDebutVente = dateDebutVente;
    }

    public Vente(int id, String nom, String dateDebutVente) {
        this.id = id;
        this.nom = nom;
        this.dateDebutVente = dateDebutVente;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDateDebutVente() {
        return dateDebutVente;
    }

    public void setDateDebutVente(String dateDebutVente) {
        this.dateDebutVente = dateDebutVente;
    }
 
}
