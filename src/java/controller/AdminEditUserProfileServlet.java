/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import src.SendMailSSL;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "AdminEditUserProfileServlet", urlPatterns = {"/AdminEditUserProfileServlet"})
public class AdminEditUserProfileServlet extends HttpServlet {
    
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            String username = null;
            String realname = null;
            String alias = null;
            String gender = null;
            String contactNumber = null;
            String email = null;
            String role = null;
            String itemName = null;
            String NRIC_Num = (String)request.getSession().getAttribute("editedUserFIN");
            
            
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
                            realname = value;
                        }
                        else if("alias".equalsIgnoreCase(fieldName)){
                            alias = value;
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
                            role = value;
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
                
                
                response.getWriter().println(itemName);
                response.getWriter().println(username);
                response.getWriter().println(realname);
                response.getWriter().println(alias);
                response.getWriter().println("Gender : " + gender);
                response.getWriter().println(contactNumber);
                response.getWriter().println(email);
                response.getWriter().println(role);
                response.getWriter().println(NRIC_Num);
                DBConnect.connectDB();
                
                if(username != null && username.length()!=0){
                    DBConnect.updateUsername(username, NRIC_Num);
                }
                
                if(realname != null && realname.length()!=0){
                    DBConnect.updateRealname(realname, NRIC_Num);
                }
                
                if(alias != null && alias.length()!=0){
                    DBConnect.updateAlias(alias,NRIC_Num);
                }
                
                if(gender!= null && gender.length()!=0){
                    DBConnect.updateUserGender(gender, NRIC_Num);
                }
                //DBConnect.updateJobPosition(job_position, NRIC_Num);
                if(contactNumber != null &&contactNumber.length()!=0){
                    DBConnect.updateContactNumber(contactNumber,NRIC_Num);
                }
                
                if(email != null && email.length()!=0){
                    DBConnect.updateEmail(email, NRIC_Num);
                }
                
                if(role != null && role.length()!=0){
                    DBConnect.updateJobPosition(role, NRIC_Num);
                    if(role.equalsIgnoreCase("None")){
                        SendMailSSL sendMail = new SendMailSSL();
                        String encryptedPassword = sendMail.generateEncryptedPassword();
                        sendMail.lockMail(username, encryptedPassword);
                    }
                }
                
                if(itemName.length() !=0){
                    
                    DBConnect.updatePhoto(itemName, NRIC_Num);
                }
                //DBConnect.updateAlias(alias, NRIC_Num);
                //DBConnect.updateContactNumber(contactNumber,NRIC_Num);
          
                String url  = "/TWC2-CaseManagementSystem/EditUserProfile.jsp";
                request.getSession().setAttribute("notificationMsg", "User's profile has been edited.");
                request.getSession().setAttribute("editedUserFINNo",NRIC_Num);
                response.sendRedirect(url);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
