package test;

import java.util.ArrayList;
import model.Cheval;
import model.Race;

public class TestCheval {

    public static void main (String args[]){

        Cheval c = new Cheval();
        c.setId(2);
        c.setNom("Houri");

        Race r = new Race();
        r.setId(1);
        r.setNom("pur-sang");
        
                
        Race r2 = new Race();
        r2.setId(2);
        r2.setNom("pur-sang");
                
        Race r3 = new Race();
        r3.setId(3);
        r3.setNom("pur-sang");
        
        Cheval pere = new Cheval();
        pere.setId(3);
        pere.setNom("Soleil");

        Cheval mere = new Cheval();
        mere.setId(4);
        mere.setNom("Lune");
        
        
        c.addParent(pere);
        c.addParent(mere);
        

        c.setRace(r);
        pere.setRace(r2);
        mere.setRace(r3);
        
        

        System.out.println("Cheval : " + c.getId() + " " + c.getNom()
                + " | Race : " + c.getRace().getId() + " " + c.getRace().getNom());

        System.out.println("Parents de " + c.getNom() + " :");
        for (Cheval parent : c.getParents()) {
            System.out.println("- " + parent.getId() + " " + parent.getNom() + " " + parent.getRace().getNom());
        }
    }
}
