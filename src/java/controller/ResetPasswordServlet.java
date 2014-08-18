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
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        
        try{
            DBConnect.connectDB();
            
            String username = (String) request.getSession().getAttribute("currentUsername");
            String emailAddress = (String) request.getSession().getAttribute("currentUserEmailAddress");
            String nric_num = (String) request.getSession().getAttribute("currentUserFIN");
            SendMailSSL sendMail = new SendMailSSL();
            
            String encryptedPassword = sendMail.generateEncryptedPassword();
            sendMail.sendMail(username, emailAddress, nric_num);
            request.getSession().setAttribute("lockedNotificationMsg","This user has been locked.");
            
            DBConnect.updatePassword(username, encryptedPassword);
            
            
            request.getSession().setAttribute("resetSuccessMsg","User's password has been reset.");
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
