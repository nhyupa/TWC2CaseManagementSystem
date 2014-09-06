/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
 * @author lee
 */
@WebServlet(name = "AssociateMakeR2RServlet", urlPatterns = {"/AssociateMakeR2RServlet"})
public class AssociateMakeR2RServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            
            
            DBConnect.connectDB();
               String FIN_Num = (String)request.getSession().getAttribute("FIN");
            
               DBConnect.getR2RRecords(FIN_Num);
               
               String RegisterDate = request.getParameter("registerdate");
               String AppointmentTime = request.getParameter("appttime");
               String AppointmentHospital = request.getParameter("hospitalappt");
               String AppointmentDoctor = request.getParameter("doctorappt");
               String FirstVolunteer = request.getParameter("r2r1stvolunteer");
               String SecondVolunteer = request.getParameter("r2r2stvolunteer");
               String AppointmentPurpose = request.getParameter("apptpurpose");
               String PreAppointmentNotes = request.getParameter("note");
               String PostAppointmentNotes = "";
               String Feedback = "";
 
               
                
              String JobKey = (String)request.getSession().getAttribute("JobKey");
              String ProbKey = (String)request.getSession().getAttribute("ProbKey");
              
               
               DBConnect.InsertR2RRecord(RegisterDate, AppointmentTime, AppointmentHospital,AppointmentDoctor, FirstVolunteer,SecondVolunteer, AppointmentPurpose ,PreAppointmentNotes, PostAppointmentNotes, Feedback,FIN_Num,JobKey,ProbKey );
               
            String url = "/TWC2-CaseManagementSystem/AssociateMenu.jsp";
                response.sendRedirect(url);
            
            
        }catch(Exception err) {
           err.printStackTrace();
        }
    }

   

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
