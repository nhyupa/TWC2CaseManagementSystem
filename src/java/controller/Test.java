/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

/**
 *
 * @author nhyupa.2010
 */
public class Test {
    public static void main(String [] args){
        String pdfFileName = "D:\\cookbook2.pdf";
        try{
        FileInputStream in = new FileInputStream(new File(pdfFileName));
        
        OutputStream out = null;
        byte[] outputByte = new byte[4096];
        while(in.read(outputByte,0,4096) != -1){
                out.write(outputByte, 0,4096);
        }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }       
    }
}
