/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

/**
 *
 * @author nhyupa.2010
 */
public class FileUpload {
    
    public static File retrieveFile(String path, FileItemStream item) {
      
        try{
            File f = new File(path + File.separator + "images");
            if(!f.exists())f.mkdir();
            File savedFile = new File(f.getAbsolutePath() + File.separator + item.getName());
            return savedFile;
        }catch(Exception err) {
            System.out.println("Error  :" + err);
        }
        return null;
    }
    
    
    public static boolean processFile(String path,FileItemStream item){
        try{
            //File f = new File(path + File.separator + "images");
            File f = new File(path);
            if(!f.exists())f.mkdir();
            File savedFile = new File(f.getAbsolutePath()+ File.separator + item.getName());
            FileOutputStream fos = new FileOutputStream(savedFile);
            InputStream is = item.openStream();
            int x = 0;
            byte[] b  = new byte[1024];
            while((x=is.read(b))!= -1){
                fos.write(b,0,x);
            }
            fos.flush();
            fos.close();
            return true;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return false;
    }
    
  
    public static String retrieveItemName(String path, FileItemStream item) {
        try{
            File f =  new File (path + File.separator + "images");
            if(!f.exists())f.mkdir();
            String fileName = item.getName();
            
            return fileName;
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return null;
    }
    
    
    public static String retrieveFileName(String path, FileItemStream item) {
        try{
            File f =  new File (path + File.separator + "attachment");
            if(!f.exists())f.mkdir();
            String fileName = item.getName();
            
            return fileName;
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return null;
    }
}
