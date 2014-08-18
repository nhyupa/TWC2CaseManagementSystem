/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import src.DBConnect;
import src.SendMailSSL;
import src.User;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/RegistrationServlet"})
public class RegistrationServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            
            String username = null;
            String realName = null;
            String alias = null;
            String NRIC_No = null;
            String gender = null;
            String contactNumber = null;
            String email = null;
            String position = null;
            String itemName = null;
            
            
            DBConnect.connectDB();
            ArrayList<String> userFINs = DBConnect.retrieveUserFins();
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
                        if("username".equalsIgnoreCase(fieldName)){
                            username = value;
                        }
                        else if("realname".equalsIgnoreCase(fieldName)){
                            realName = value;
                        }
                        else if("alias".equalsIgnoreCase(fieldName)){
                            alias = value;
                        }
                        else if("NRIC_No".equalsIgnoreCase(fieldName)){
                            NRIC_No = value;
                        }
                        else if("gender".equalsIgnoreCase(fieldName)){
                            gender = value;
                            
                        }
                        else if("contactnumber".equalsIgnoreCase(fieldName)){
                            contactNumber = value;
                            
                        }
                        else if("email".equalsIgnoreCase(fieldName)){
                            email = value;
                            
                        }
                        else if("position".equalsIgnoreCase(fieldName)){
                            position = value;
                            //response.getWriter().println(fieldName + ":" + position + "this is my username");
                        }
                        else{
                            
                        }
                        //do File Upload process
                        
                    }
                    else{
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();
                        
                        String filePath =getServletContext().getInitParameter("file-upload");
 
                        itemName = FileUpload.retrieveItemName(path,item);
                        
                        if(FileUpload.processFile(filePath,item)){
  
                        }
                    }
                }
                
                SendMailSSL sendMailSSL = new SendMailSSL();
                String password = sendMailSSL.generateEncryptedPassword();
                
           
                
                User newUser = new User(NRIC_No,realName,alias,username,password,email, contactNumber, gender,position,itemName);
                String url = "/TWC2-CaseManagementSystem/CreateNewUser.jsp";
                
                for(int i = 0 ; i < userFINs.size(); i++){
                    String fin = userFINs.get(i);
                    if(NRIC_No.equals(fin)){
                        request.getSession().setAttribute("finExists", "NRIC_No/FIN exists in database.");
                        response.sendRedirect(url);
                    }
                }
                
                DBConnect.connectDB();
                int existingNumOfUsers = DBConnect.countUsers();
                
                DBConnect.createUser(newUser);
                
                
                sendMailSSL.sendMail(username,password);
                int afterCreatingNewUser = DBConnect.countUsers();
                
               
                if(afterCreatingNewUser > existingNumOfUsers) {
                    request.getSession().setAttribute("regMsg", "The User has been created successfully.");
                    response.sendRedirect(url);
                    
                }
            }
        }catch(Exception err) {
            err.printStackTrace();
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
