/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Lieu {
    private int id;
    private String ville;
    private int nbBoxes;
    private String commentaires;

    public Lieu() {
    }

    
    public Lieu(int id, String ville, int nbBoxes, String commentaires) {
        this.id = id;
        this.ville = ville;
        this.nbBoxes = nbBoxes;
        this.commentaires = commentaires;
    }

    public String getCommentaires() {
        return commentaires;
    }

    public int getId() {
        return id;
    }

    public int getNbBoxes() {
        return nbBoxes;
    }

    public String getVille() {
        return ville;
    }

    public void setCommentaires(String commentaires) {
        this.commentaires = commentaires;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNbBoxes(int nbBoxes) {
        this.nbBoxes = nbBoxes;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }
            
    public ArrayList<CategVente> getLesCategVentes() {
        return lesCategVentes;
    }

    public void setLesCategVentes(ArrayList<CategVente> lesCategVentes) {
        this.lesCategVentes = lesCategVentes;
    }
    public void addCategVente(CategVente uneCategVente){
        if (lesCategVentes ==null ){
            lesCategVentes = new ArrayList<CategVente>();
        }
        lesCategVentes.add(uneCategVente);
    }


}
