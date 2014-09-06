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
@WebServlet(name = "AssociateViewnUpdateWICAServlet", urlPatterns = {"/AssociateViewnUpdateWICAServlet"})
public class AssociateViewnUpdateWICAServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String DateOfUpdate = request.getParameter("registerdate");
            String CurrentWicaStatus = request.getParameter("currentwicastatus");
            String CurrentWicaStatusOther = request.getParameter("otherwicastatus");
            String WicaPoints = request.getParameter("wicapoints");
            String WicaCompensation = request.getParameter("wicacompensation");
            String WicaRemarks = request.getParameter("wicaremarks");
            String WicaMOMDate = request.getParameter("wicaIssueDate");
            String WicaRefNumber = request.getParameter("wicarefnum");
            String InsuranceCompany = request.getParameter("wicainsurancecompany");
            String InsurancePolicyNumber = request.getParameter("wicapolicynum");
            String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");
            

            System.out.println(WicaPoints);
            
            
            response.getWriter().println(FIN);
            response.getWriter().println(DateOfUpdate);
            response.getWriter().println(CurrentWicaStatus);
            response.getWriter().println(CurrentWicaStatusOther);
            response.getWriter().println(WicaPoints);
            response.getWriter().println(WicaCompensation);
            response.getWriter().println(WicaRemarks);
            response.getWriter().println(WicaMOMDate);
            response.getWriter().println(WicaRefNumber);
            response.getWriter().println(InsuranceCompany);
            response.getWriter().println(InsurancePolicyNumber);
            
            DBConnect.connectDB();

            
     //       boolean checkFINNumber = DBConnect.checkFINNumFromWicaDetails(FIN);
      //      if(checkFINNumber == false){
                if(CurrentWicaStatus.equals("Other")){
                    
                    DBConnect.insertWICADetails(JobKey,ProbKey,DateOfUpdate,CurrentWicaStatus,CurrentWicaStatusOther,WicaPoints,WicaCompensation,WicaRemarks,FIN);
		

                }else{
                    
                    DBConnect.insertWICADetails(JobKey,ProbKey,DateOfUpdate,CurrentWicaStatus,"", WicaPoints,WicaCompensation,WicaRemarks,FIN);
		
				 }
         //   }else{
        //        if(CurrentWicaStatus.equals("Other")){
        //        DBConnect.updateWICADetails(DateOfUpdate,CurrentWicaStatus,CurrentWicaStatusOther,WicaPoints,WicaCompensation,WicaRemarks,FIN);
	//	  }else{
       //         DBConnect.updateWICADetails(DateOfUpdate,CurrentWicaStatus,"",WicaPoints,WicaCompensation,WicaRemarks,FIN);
		
       //         }
       //     }
            
         //    boolean checkFINNumber2 = DBConnect.checkFINNumFromWicaClaimDetails(FIN);
          //  if(checkFINNumber2 == false){
                  
                     DBConnect.insertWICAClaimDetails(JobKey,ProbKey,FIN, WicaMOMDate,  WicaRefNumber, InsuranceCompany,  InsurancePolicyNumber);
		
        //    }else{
                
        //       DBConnect.updateWICAClaimDetails( FIN, WicaMOMDate,  WicaRefNumber, InsuranceCompany,  InsurancePolicyNumber);
               
         //       }
         
           
            
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "WICA has been updated.");
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
