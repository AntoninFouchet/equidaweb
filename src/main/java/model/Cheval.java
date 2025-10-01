package model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Cheval {

    private int id;
    private String nom;
    private LocalDate dateNaissance;

    private Race race;
    
    private ArrayList<Cheval> parents;
    
    private Cheval chevalpere;
    private Cheval chevalmere;
    
    
    public Cheval() {
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

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(LocalDate dateNaissance) {
        this.dateNaissance = dateNaissance;
    }
    public Race getRace() {
        return race;
    }
    public void setRace(Race race) {
        this.race = race;
    }

    public ArrayList<Cheval> getParents() {
        return parents;
    }

    public void setParents(ArrayList<Cheval> parents) {
        this.parents = parents;
    }
    
       public void addParent (Cheval unParent){
        if (parents ==null ){
            parents = new ArrayList<Cheval>();
        }
        parents.add(unParent);
    
    }

    public Cheval getChevalpere() {
        return chevalpere;
    }

    public Cheval getChevalmere() {
        return chevalmere;
    }

    public void setChevalpere(Cheval chevalpere) {
        this.chevalpere = chevalpere;
    }

    public void setChevalmere(Cheval chevalmere) {
        this.chevalmere = chevalmere;
    }
    
}
