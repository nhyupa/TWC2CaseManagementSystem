/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import src.*;

/**
 *
 * @author nhyupa.2010
 */
public class Test {
    public static void main(String [] args){
        DBConnect.connectDB();
       DBConnect.insertEmployerDetails("Yupa", "Clementi", "90439566", "Jo12", "G0909493N");
        //ArrayList<Worker> contactNums = DBConnect.retrieveSgPhoneNumberSearchResults("42%");
        //System.out.println(contactNums.size());
    }
}
