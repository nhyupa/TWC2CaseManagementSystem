/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.DBConnect;
/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateChangePasswordServlet", urlPatterns = {"/AssociateChangePasswordServlet"})
public class AssociateChangePasswordServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        
        doPost(request,response);
        
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        
        DBConnect.connectDB();
        
        String oldPassword = request.getParameter("inputOldPassword");
        String username = (String)request.getSession().getAttribute("username");
        String existingPassword = DBConnect.retrievePassword(username);
        String confirmPassword = request.getParameter("inputConfirmPassword");
        
        
        try{
            response.getWriter().println(confirmPassword);
            
            
            String url = "/TWC2-CaseManagementSystem/AssociateChangeAssociatePassword.jsp";
            
            if(!oldPassword.equals(existingPassword)){
                request.getSession().setAttribute("errMsg", "Your old password is wrong. Please check again.");
                response.sendRedirect(url);
            }
            if(!confirmPassword.equalsIgnoreCase(existingPassword) && oldPassword.equals(existingPassword)) {
                request.getSession().setAttribute("successMsg", "Your password has been changed.");
                DBConnect.updatePassword(username, confirmPassword);
                try{
                    response.sendRedirect(url);
                    //RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
                    //requestDispatcher.forward(request, response);
                }catch(Exception err) {
                    System.out.println("Error: " + err);
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


