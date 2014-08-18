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
            String NRIC_Num = (String)request.getSession().getAttribute("FIN");
            String alias = request.getParameter("alias");
            String contactNumber = request.getParameter("contactnumber");
            
            DBConnect.connectDB();
            DBConnect.updateAlias(alias, NRIC_Num);
            DBConnect.updateContactNumber(contactNumber,NRIC_Num);
  
           String url  = "/TWC2-CaseManagementSystem/EditUserProfile.jsp";
           request.getSession().setAttribute("notificationMsg", "Your profile has been edited.");
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
