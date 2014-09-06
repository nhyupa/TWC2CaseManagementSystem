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
@WebServlet(name = "AssociateViewnUpdateMCServlet", urlPatterns = {"/AssociateViewnUpdateMCServlet"})
public class AssociateViewnUpdateMCServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String DateOfMC = request.getParameter("registerdate");
            String CurrentMCStatus = request.getParameter("MCstatus");
            String CurrentMCStatusOther = request.getParameter("othermcstatus");
            String MCExpiryDate = request.getParameter("MCDate");
            String CumulativeMCDays = request.getParameter("MCdays");
            String MCRemarks = request.getParameter("MCremarks");
             String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");
            
            System.out.println(CumulativeMCDays);
            System.out.println(MCRemarks);
           int CumulativeMCDaysCount = Integer.parseInt(CumulativeMCDays);
            
            System.out.println(CumulativeMCDaysCount);
            
            
            DBConnect.connectDB();

     //      boolean checkFINNumber = DBConnect.checkFINNumFromMCDetails(FIN);
     //       if(checkFINNumber == false){
                if(CurrentMCStatus.equals("Other")){
                    DBConnect.associateInsertMCDetails(JobKey,ProbKey,DateOfMC,CurrentMCStatus,CurrentMCStatusOther,MCExpiryDate,CumulativeMCDaysCount,MCRemarks,FIN);
                }else{
                    DBConnect.associateInsertMCDetails(JobKey,ProbKey,DateOfMC,CurrentMCStatus,"",MCExpiryDate,CumulativeMCDaysCount,MCRemarks,FIN);
                }
         //   }else{
         //       if(CurrentMCStatus.equals("Other")){
        //        DBConnect.updateMCDetails(DateOfMC,CurrentMCStatus,CurrentMCStatusOther,MCExpiryDate,CumulativeMCDays,MCRemarks,FIN);
         //       }else{
        //        DBConnect.updateMCDetails(DateOfMC,CurrentMCStatus,"",MCExpiryDate,CumulativeMCDays,MCRemarks,FIN);
//
         //       }
        //    }
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "MC Record has been updated.");
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
