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
@WebServlet(name = "EditUserProfileServlet", urlPatterns = {"/EditUserProfileServlet"})
public class EditUserProfileServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
            String NRIC_Num = (String)request.getSession().getAttribute("FIN");
            String username = null;
            String gender = null;
            String realname = null;
            
            String alias = null;
            String contactNumber = null;
            String itemName = null;
        
        try{

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
                        if("contactnumber".equalsIgnoreCase(fieldName)){
                            contactNumber = value;
                        }
                        else if("realname".equalsIgnoreCase(fieldName)){
                            realname = value;
                        }
                        else if("username".equalsIgnoreCase(fieldName)){
                            username = value;
                        }
                        else if("gender".equalsIgnoreCase(fieldName)){
                            gender = value;
                        }
                        else if("alias".equalsIgnoreCase(fieldName)){
                            alias = value;
                        }
                        else{
                            
                        }
                    }
                    else{
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();  
                        String filePath =getServletContext().getInitParameter("file-upload");
                        
                        itemName = FileUpload.retrieveItemName(path,item);
                        response.getWriter().println("Item Name : " + itemName);
                        response.getWriter().println("Item Name : " + itemName.length());
                        if(itemName.length()!=0){
                            FileUpload.processFile(filePath,item);
                    
                        }
                    }
                }
            }    
            response.getWriter().println(itemName);
            response.getWriter().println(NRIC_Num);
            response.getWriter().println(NRIC_Num.length());
            DBConnect.connectDB();
            
            if(realname != null || !realname.equalsIgnoreCase("")){
                DBConnect.updateRealname(realname, NRIC_Num);
            }
            //DBConnect.updateJobPosition(job_position, NRIC_Num);
            if(contactNumber != null || !contactNumber.equalsIgnoreCase("")){
                DBConnect.updateContactNumber(contactNumber,NRIC_Num);
            }
            if(alias != null || !alias.equalsIgnoreCase("")){
                DBConnect.updateAlias(alias,NRIC_Num);
            }
            if(itemName.length() !=0){
                
                DBConnect.updatePhoto(itemName, NRIC_Num);
            }
            
            if(gender != null){
                DBConnect.updateUserGender(gender, NRIC_Num);
            }
            if(username!=null){
                DBConnect.updateUsername(username, NRIC_Num);
            }
           String url  = "/TWC2-CaseManagementSystem/EditMyProfile.jsp";
           request.getSession().setAttribute("notificationMsg", "Your profile has been edited");
           request.getSession().setAttribute("username",username);
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
