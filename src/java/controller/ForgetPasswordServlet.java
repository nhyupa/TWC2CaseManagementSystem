/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ForgetPasswordServlet", urlPatterns = {"/ForgetPasswordServlet"})
public class ForgetPasswordServlet extends HttpServlet {

   public void doPost(HttpServletRequest request, HttpServletResponse response) {
       try{
           String userName = request.getParameter("username");
           userName = userName.trim();
           String url = "/index.jsp";
           if(userName == null || userName.equals("")) {
               
               url ="/TWC2-CaseManagementSystem/index.jsp";
               request.getSession().setAttribute("errorMsg","Please fill in your username.");
               response.sendRedirect(url);
               //RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
               //requestDispatcher.forward(request, response);
           }
           else{
               LoginController loginCtrl = new LoginController();
               boolean userExists = loginCtrl.checkUsername(userName);
               if(userExists == false) {
                   
                   url="/TWC2-CaseManagementSystem/index.jsp";
                   request.getSession().setAttribute("errorMsg","Your username does not exist." +"\n\n\n" + " Please enter a valid username.");
                   response.sendRedirect(url);
                   
                   //RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
                   //requestDispatcher.forward(request,response);
               }
               else{
                   SendMailSSL sendMailSSL = new SendMailSSL();
                   String newPassword = sendMailSSL.generateEncryptedPassword();
                   sendMailSSL.forgetPasswordSendMail(userName,newPassword);
                   request.getSession().setAttribute("passwordNotificationMsg","New Password has been sent.");
                   DBConnect.updatePassword(userName, newPassword);
                   url = "/TWC2-CaseManagementSystem/index.jsp";
                   response.sendRedirect(url);
                   //RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
                   //requestDispatcher.forward(request, response);
               }
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
