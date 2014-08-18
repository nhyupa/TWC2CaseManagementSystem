/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "AttachmentDownloadServlet", urlPatterns = {"/AttachmentDownloadServlet"})
public class AttachmentDownloadServlet extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {
        try{
            
            /** Database Method Here **/
            String FIN = (String)request.getSession().getAttribute("FIN");
            response.getWriter().println(FIN);
            
            DBConnect.connectDB();
            ArrayList<String> documentNames = DBConnect.retrieveDocuments(FIN);
            
            response.getWriter().println(documentNames.size());
            for(int i = 0 ; i < documentNames.size(); i++){
                
                String checkedDocument = Integer.toString(i);
                String document = request.getParameter(checkedDocument);
                
                if(document!= null){
                    //response.getWriter().println(document);
                    //String filePath =getServletContext().getInitParameter("attachment-upload");
                    
                    //String finalFilePath = filePath + document;
                    //File downloadFile = new File(finalFilePath);
                    String pdfFileName = "\\attachment\\cookbook2.pdf";
                    String contextPath = getServletContext().getRealPath(File.separator);
                    
                    response.getWriter().println(contextPath);
                    File downloadFile = new File(contextPath + pdfFileName);
                    //response.getWriter().println("final File Path : "  + finalFilePath);
                   // response.getWriter().println("Document: " + document);
                    //response.getWriter().println(downloadFile.getAbsolutePath());
                    //response.setContentType("application/pdf");
                    response.addHeader("Content-Disposition", "attachment; filename=" + document);
                    FileInputStream fileInputStream = new FileInputStream(downloadFile);
                    OutputStream responseOutputStream = response.getOutputStream();
                    int bytes;
                    while((bytes = fileInputStream.read()) != -1){
                        responseOutputStream.write(bytes);
                    }
                }
            }
            
            
        }catch(Exception err) {
            
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
