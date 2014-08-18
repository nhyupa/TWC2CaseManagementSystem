/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.ArrayList;

/**
 *
 * @author nhyupa.2010
 */
public class BasicSearch {
    public static void main(String [] args) {
        
        String FIN_Num = "G0909493N";
        
        DBConnect database= new DBConnect();
        DBConnect.connectDB();
        ArrayList<Worker> workers = database.getWorkers();
        for(int i = 0 ; i < workers.size(); i++) {
            Worker worker = workers.get(i);
            if(worker.getFIN_Num().equalsIgnoreCase(FIN_Num)){
                String workerName = worker.getWorkerName();
                System.out.println(workerName);
            }
        }
        
        
        
        
    }
}
