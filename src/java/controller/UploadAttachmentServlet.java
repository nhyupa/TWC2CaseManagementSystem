/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "UploadAttachmentServlet", urlPatterns = {"/UploadAttachmentServlet"})
public class UploadAttachmentServlet extends HttpServlet {

     public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            String fileName = null;
            String itemName = null;
            
            String FIN_Number = (String)request.getSession().getAttribute("FIN");
            
            
            ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iter = upload.getItemIterator(request);
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            
             if(isMultiPart) {
                while(iter.hasNext()) {
                    FileItemStream item = iter.next();
                    if(item.isFormField()){
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b =  new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        if("uploadedFileName".equalsIgnoreCase(fieldName)){
                            fileName = value;
                            response.getWriter().println("File name: " + fileName);
                        }  
                    }
                    else{
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();
                        String filePath =getServletContext().getInitParameter("attachment-upload");
                        
                        itemName = FileUpload.retrieveFileName(path, item);
                        
                        
                        if(FileUpload.processFile(filePath, item)){
                            response.getWriter().println("FIN Number : " + FIN_Number);
                            DBConnect.insertDocument(FIN_Number, itemName);
                            request.getSession().setAttribute("Uploadmsg","Uploaded Successfully");
                            String url = "/TWC2-CaseManagementSystem/UploadAttachment.jsp";
                            response.sendRedirect(url);
                        }
                        
                      
                    }
                }
             }
            
                
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
