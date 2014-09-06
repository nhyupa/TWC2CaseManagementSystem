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
@WebServlet(name = "AssociateViewnUpdateTransferServlet", urlPatterns = {"/AssociateViewnUpdateTransferServlet"})
public class AssociateViewnUpdateTransferServlet extends HttpServlet {
 public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String DateOfUpdate = request.getParameter("registerdate");
            String TransferStatus = request.getParameter("tjsstatus");
            String TransferOther = request.getParameter("othertjsstatus");
            String DepartureDate = request.getParameter("departuredate");
            String TJSName = request.getParameter("employername");
            String TJSDescription = request.getParameter("tjsdescription");
            String TJSRemarks = request.getParameter("tjsremarks");
             String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");
            
           
            
            response.getWriter().println(FIN);
            response.getWriter().println(DateOfUpdate);
            response.getWriter().println(TransferStatus);
            response.getWriter().println(TransferOther);
            response.getWriter().println(DepartureDate);
            response.getWriter().println(TJSName);
            response.getWriter().println(TJSDescription);
            response.getWriter().println(TJSRemarks);
           
            DBConnect.connectDB();

         //   boolean checkFINNumber = DBConnect.checkFINNumFromTJSDetails(FIN);
          //  if(checkFINNumber == false){
                if(TransferStatus.equals("Other")){
                DBConnect.insertTransferDetails(JobKey,ProbKey,DateOfUpdate,TransferStatus,TransferOther,DepartureDate,TJSName,TJSDescription,TJSRemarks,FIN);
                } else{
                     DBConnect.insertTransferDetails(JobKey,ProbKey,DateOfUpdate,TransferStatus,"",DepartureDate,TJSName,TJSDescription,TJSRemarks,FIN);
                }
         //   }
          //  else{
        //        if(TransferStatus.equals("Other")){
        //        DBConnect.updateTransferDetails(DateOfUpdate,TransferStatus,TransferOther,DepartureDate,TJSName,TJSDescription,TJSRemarks,FIN);
       //         } else{
        //         DBConnect.updateTransferDetails(DateOfUpdate,TransferStatus,"",DepartureDate,TJSName,TJSDescription,TJSRemarks,FIN);
         //       }
        //    }
            
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "Transfer has been updated.");
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
