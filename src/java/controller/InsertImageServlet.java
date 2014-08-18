/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import src.DBConnect;


/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "InsertImageServlet", urlPatterns = {"/InsertImageServlet"})
public class InsertImageServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        //ServletFileUpload upload = null;
        response.setContentType("text/html");
        String FIN = (String)request.getSession().getAttribute("NRIC_No"); 
        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        if(isMultiPart) {
            ServletFileUpload upload = new ServletFileUpload();
 
            try{
               
                FileItemIterator itr = upload.getItemIterator(request);
                
                
                while(itr.hasNext()) {
                   
                    FileItemStream item = itr.next();
                    
           
                    if(item.isFormField()){
                        // do field specific process
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b =  new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        response.getWriter().println(fieldName + ";" + value + "<br/>");
                    }
                    else {
                        //do File Upload process
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();
                        
                        String filePath =getServletContext().getInitParameter("file-upload"); 
                        
                        //response.getWriter().println("File Path 11111 : " + filePath);
                        //String finalPath = getServletContext().getInitParameter("");
//                        finalPath = "<img src='" + finalPath + "' />";
                        //response.getWriter().println("Final Path: " + finalPath);
       
                       // File savedFile = FileUpload.retrieveFile(path,item);
                        String itemName = FileUpload.retrieveItemName(path,item);
                  
                       // response.getWriter().println("<br/>" + itemName + " <br/>");
                       // response.getWriter().println("<br/>" + savedFile.toString() + "   <br/>");
                       // response.getWriter().println("The actual path : " + path + "<br/>");
                       // response.getWriter().println("FIN: " + FIN + "<br/>");
                        //response.getWriter().println("FIN length: " + FIN.length() + "<br/>");
                       // response.getWriter().println("File size  " +  savedFile.length() + "<br/>");
                        //Call a method to Upload File
                        //Change Path to Final path
                        if(FileUpload.processFile(filePath,item)){
                            DBConnect dbConnect = new DBConnect();
                            dbConnect.connectDB();
                            DBConnect.insertImage(itemName,FIN);
                            response.getWriter().println("File Uploaded Successfully");
                            
                        }
                        else {
                           
                            response.getWriter().println("File Upload Failed");
                        }
                    }
                }
                
            }catch(Exception err) {
                err.printStackTrace();
                System.out.println("Error : " + err);
            }
        }
        
        
        
    }
}
