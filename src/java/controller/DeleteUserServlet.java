/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import src.SendMailSSL;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/DeleteUserServlet"})
public class DeleteUserServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        
        try{
            DBConnect.connectDB();
            
            String username = (String) request.getSession().getAttribute("currentUsername");
            String emailAddress = (String) request.getSession().getAttribute("currentUserEmailAddress");
            String nric_num = (String) request.getSession().getAttribute("currentUserFIN");
            String value = "";
            SendMailSSL sendMail = new SendMailSSL();
            
            String userRole = "None";
            String encryptedPassword = sendMail.generateEncryptedPassword();
            DBConnect.updateRole(userRole, nric_num);
            sendMail.sendMail(username, emailAddress, nric_num,value);
            request.getSession().setAttribute("deleteNotificationMsg","This user role has been terminated.");
            
            DBConnect.updateRole(userRole, nric_num);
            
            String url = "/TWC2-CaseManagementSystem/ViewOtherUser.jsp";
            response.sendRedirect(url);
           
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
