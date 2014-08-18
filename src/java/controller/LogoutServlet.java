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
import javax.servlet.http.HttpSession;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
       
        try{
            String url="/index.jsp";
            HttpSession session = request.getSession(false);
            
            if(session != null) {
                session.invalidate();
                request.setAttribute("logoutMsg","You have been logged out.");
                
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
                requestDispatcher.forward(request, response);
            }
        }catch(Exception err) {
            System.out.println("Error :" + err);
        }
    }

    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
