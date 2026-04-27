package model;

import java.util.ArrayList;

public class CategVente {

    private String code;
    private String libelle;

    private ArrayList<Vente> lesVentes;

    public CategVente(){
    }

    public String getCode() {return code;}

    public String getLibelle() {return libelle;}

    public void setCode(String code) {this.code = code;}

    public void setLibelle(String libelle) {this.libelle = libelle;}

    public ArrayList<Vente> getLesVentes() {return lesVentes;}

    public void setLesVentes(ArrayList<Vente> lesVentes) {this.lesVentes = lesVentes;}

    public void addVente(Vente uneVente){
        if (lesVentes == null){
            lesVentes = new ArrayList<Vente>();
        }
        lesVentes.add(uneVente);
    }
}