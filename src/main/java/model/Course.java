/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Course {
             
    private int id;
    private String nom;
    private String lieu;
    private String date;

    public Course() {
    }
    
    
    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getLieu() {
        return lieu;
    }

    public String getNom() {
        return nom;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
}
