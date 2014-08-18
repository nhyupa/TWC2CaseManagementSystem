/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import src.User;


/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"}, initParams = {
    @WebInitParam(name = "Name", value = "Value")})
public class LoginServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        String userName = request.getParameter("username");
        String password = request.getParameter("pass");
        
        String jobPosition = null;
        userName = userName.trim();
        password = password.trim();
        try{
            response.getWriter().println(userName);
            response.getWriter().println(password);
        }catch(Exception err){
            
        }
        String adminPage = "/TWC2-CaseManagementSystem/AdminHomePage.jsp";
        String associatePage = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
        String managerPage = "/TWC2-CaseManagementSystem/ManagerHomePage.jsp";
        String specialistPage = "/TWC2-CaseManagementSystem/SpecialistHomePage.jsp";
        
        try{
            LoginController loginCtrl = new LoginController();
            boolean authenticatedUser = loginCtrl.checkAuthentication(userName, password);
            response.getWriter().println(authenticatedUser);
            if(authenticatedUser == true) {
                
                jobPosition = loginCtrl.getPosition(userName);
                
                if(jobPosition.equalsIgnoreCase("Administrator")){
                     request.getSession().setAttribute("username", userName);
                     request.getSession().setAttribute("jobPosition",jobPosition);
                     response.sendRedirect(adminPage);
                }
                
                else if(jobPosition.equalsIgnoreCase("Management")){
                    request.getSession().setAttribute("username", userName);
                    request.getSession().setAttribute("jobPosition", jobPosition);
                    response.sendRedirect(managerPage);
                }
                else if(jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Restricted Specialist")){
                    request.getSession().setAttribute("username",userName);
                    request.getSession().setAttribute("jobPosition",jobPosition);
                    response.sendRedirect(specialistPage);
                }
                else if(jobPosition.equalsIgnoreCase("Associate")) {
                    request.getSession().setAttribute("username",userName);
                    request.getSession().setAttribute("jobPosition",jobPosition);
                    response.sendRedirect(associatePage);
                }
                else if(jobPosition.equalsIgnoreCase("None")){
                    request.getSession().setAttribute("msgAuth","You don't have access to TWC2 Case Management System.");
                    String url="/TWC2-CaseManagementSystem/index.jsp";
                    response.sendRedirect(url);
                     
                }
            }
            else {
                request.getSession().setAttribute("msgAuthFailed","Authentication failed.");
                String url="/TWC2-CaseManagementSystem/index.jsp";
                response.sendRedirect(url);
               
            }
        }catch(Exception err){
            System.out.println("Error: " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
