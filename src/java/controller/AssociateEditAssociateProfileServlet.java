/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "AssociateEditAssociateProfileServlet", urlPatterns = {"/AssociateEditAssociateProfileServlet"})
public class AssociateEditAssociateProfileServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            
           String FIN = (String)request.getSession().getAttribute("NRIC");
           
           
           String realName = null;
           String realAlias = null;
           String realGender = null;
           String realContactNumber = null;
           String itemName = null;

           ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iter = upload.getItemIterator(request);
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if(isMultiPart) {
                while(iter.hasNext()) {
                    FileItemStream item = iter.next();
                    
                    if(item.isFormField()){
                        // do field specific process
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b =  new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        if("realname".equalsIgnoreCase(fieldName)){
                            realName = value;
                        }
                        else if("alias".equalsIgnoreCase(fieldName)){
                            realAlias = value;
                        }
                        else if("gender".equalsIgnoreCase(fieldName)){
                            realGender =value;
                        }
                        else if("contactnumber".equalsIgnoreCase(fieldName)){
                            realContactNumber = value;
                        }
                        else {
                            
                        }
                    }
                    else{
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();
                        
                        String filePath =getServletContext().getInitParameter("file-upload");
                        
                        itemName = FileUpload.retrieveItemName(path,item);
                        
                         if(itemName.length()!=0){
                            FileUpload.processFile(filePath,item);
                    
                        }
                    }
                }
            }
            
           if(realContactNumber.length()!=0 && realContactNumber != null){
                DBConnect.updateContactNumber(realContactNumber, FIN);
           }
           if(realName.length()!=0 && realName != null){
                DBConnect.updateRealname(realName, FIN);
           }
           if(realAlias.length() !=0 && realAlias != null){
                DBConnect.updateAlias(realAlias, FIN);
           }
           if(realGender.length() !=0 && realGender !=null){
                DBConnect.updateGenderForUser(FIN, realGender);
           }
           if(itemName.length() !=0){
                DBConnect.updatePhoto(itemName, FIN);
            }
         
           
            String url  = "/TWC2-CaseManagementSystem/AssociateEditAssociateProfile.jsp";
            request.getSession().setAttribute("notificationMsg", "Your profile has been edited.");
            response.sendRedirect(url);
           
        }catch(Exception err) {
            System.out.println("Error :" + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
