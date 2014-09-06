/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "AssociateUpdatePassDetailsServlet", urlPatterns = {"/AssociateUpdatePassDetailsServlet"})
public class AssociateUpdatePassDetailsServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String JobKey = (String)request.getSession().getAttribute("JobKey");
            String FIN = (String)request.getSession().getAttribute("FIN");
            String passType = request.getParameter("passtype");
            String otherPass = request.getParameter("otherpass");
            String passNumber = request.getParameter("passnumber");
            String passIssueDate = request.getParameter("date");
            
            
           
            DBConnect.connectDB();
            response.getWriter().println(passType + "pass Type");
           // boolean checkFINNumber = DBConnect.checkFINNumFromWorkerPassDetails(FIN);
            //if(checkFINNumber == false){
                if(passType.equals("Other")){
                    DBConnect.associateInsertPassDetails(JobKey,passType,otherPass,passNumber,passIssueDate,FIN);
                }else{
                    DBConnect.associateInsertPassDetails(JobKey,passType,"",passNumber,passIssueDate,FIN);
                }
                
                
           // }else{
            //    if(passType.equals("Other")){
            //    DBConnect.updatePassDetails(passType,otherPass, passNumber, passIssueDate, FIN);
            //    }else{
            //    DBConnect.updatePassDetails(passType,"", passNumber, passIssueDate, FIN);
            //    }
          //  }
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "Phone Number has been updated.");
            response.sendRedirect(url);
            
            

        } catch (Exception err) {
            System.out.println("Error: " + err);
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
