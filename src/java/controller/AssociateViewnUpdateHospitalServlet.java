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
@WebServlet(name = "AssociateViewnUpdateHospitalServlet", urlPatterns = {"/AssociateViewnUpdateHospitalServlet"})
public class AssociateViewnUpdateHospitalServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            String RegisterDate = request.getParameter("registerdate");
            String CurrentHospitalName = request.getParameter("currenthospitalname");
            String OtherHospitalName = request.getParameter("otherhospitalname");
            String AdditionalDetails = request.getParameter("additionalhospitaldetails");
            
            String JobKey = (String)request.getSession().getAttribute("JobKey");
            String ProbKey = (String)request.getSession().getAttribute("ProbKey");
            
            
            response.getWriter().println(FIN);
            response.getWriter().println(RegisterDate);
            response.getWriter().println(CurrentHospitalName);
            response.getWriter().println(OtherHospitalName);
            response.getWriter().println(AdditionalDetails);
           
            DBConnect.connectDB();

          // boolean checkFINNumber = DBConnect.checkFINNumFromHospitalDetails(FIN);
           // if(checkFINNumber == false){
                if(CurrentHospitalName.equals("Other")){
                DBConnect.insertHospitalDetails(JobKey,ProbKey,RegisterDate,CurrentHospitalName,OtherHospitalName,AdditionalDetails,FIN);
                } else{
                     DBConnect.insertHospitalDetails(JobKey,ProbKey,RegisterDate,CurrentHospitalName,"",AdditionalDetails,FIN);
                }
          //  }
         //   else{
          //      if(CurrentHospitalName.equals("Other")){
          //      DBConnect.updateHospitalDetails(RegisterDate,CurrentHospitalName,OtherHospitalName,AdditionalDetails,FIN);
           //     } else{
           //          DBConnect.updateHospitalDetails(RegisterDate,CurrentHospitalName,"",AdditionalDetails,FIN);
          //      }
         //   }
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("passMsg", "Hospital has been updated.");
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
