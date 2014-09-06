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
@WebServlet(name = "AssociateViewnUpdateMilestoneServlet", urlPatterns = {"/AssociateViewnUpdateMilestoneServlet"})
public class AssociateViewnUpdateMilestoneServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String DateOfUpdate = request.getParameter("registerdate");
            String Milestone = request.getParameter("milestonestatus");
            String MilestoneOther = request.getParameter("othermilestonestatus");
            String Remarks = request.getParameter("milestoneremarks");
             String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");

            response.getWriter().println(FIN);
            response.getWriter().println(DateOfUpdate);
            response.getWriter().println(Milestone);
            response.getWriter().println(MilestoneOther);
            response.getWriter().println(Remarks);
            
            DBConnect.connectDB();

     //        boolean checkFINNumber = DBConnect.checkFINNumFromMilestoneDetails(FIN);
     //       if(checkFINNumber == false){
                if(Milestone.equals("Other")){
                DBConnect.insertMilestoneDetails(JobKey,ProbKey,DateOfUpdate,Milestone,MilestoneOther,Remarks,FIN);
                
                } else{
                     DBConnect.insertMilestoneDetails(JobKey,ProbKey,DateOfUpdate,Milestone,"",Remarks,FIN);
              
                }
          //  }
      //      else{
      //          if(Milestone.equals("Other")){
       //         DBConnect.updateMilestoneDetails(DateOfUpdate,Milestone,MilestoneOther,Remarks,FIN);
             
       //         } else{
     //            DBConnect.updateMilestoneDetails(DateOfUpdate,Milestone,"",Remarks,FIN);
                 
      //          }
      //      }
            
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "Milestone has been updated.");
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
