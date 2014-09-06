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
 * @author lee
 */
@WebServlet(name = "AssociateViewnUpdateLawyerServlet", urlPatterns = {"/AssociateViewnUpdateLawyerServlet"})
public class AssociateViewnUpdateLawyerServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String DateOfUpdate = request.getParameter("registerdate");
            String HaveLawyer = request.getParameter("lawyeroption");
            String LawFirmName = request.getParameter("lawfirmname");
            String Remarks = request.getParameter("lawyerstatusremarks");
             String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");
     
            response.getWriter().println(FIN);
            response.getWriter().println(DateOfUpdate);
            response.getWriter().println(HaveLawyer);
            response.getWriter().println(LawFirmName);
            response.getWriter().println(Remarks);
           
            DBConnect.connectDB();

        //    boolean checkFINNumber = DBConnect.checkFINNumFromLawyer(FIN);
         //   if(checkFINNumber == false){
                 DBConnect.insertLawyerDetails(JobKey,ProbKey,DateOfUpdate,HaveLawyer,LawFirmName,Remarks,FIN);
              //  } else{
             //    DBConnect.updateLawyerDetails(DateOfUpdate,HaveLawyer,LawFirmName,Remarks,FIN);
            //    }
            
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "Lawyer has been updated.");
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
