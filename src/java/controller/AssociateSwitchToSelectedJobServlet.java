/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import src.JobProfile;
/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateSwitchToSelectedJobServlet", urlPatterns = {"/AssociateSwitchToSelectedJobServlet"})
public class AssociateSwitchToSelectedJobServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doGet (HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    
    }  
    @Override
      public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            DBConnect.connectDB();
                String FIN = (String)request.getSession().getAttribute("FIN");
               String employerName = request.getParameter("radJob");
               String JobKey = null;
                ArrayList<JobProfile> jobs = DBConnect.retrieveJobKeys(FIN);
                for(int i=0; i<jobs.size(); i++){
                    if(jobs.get(i).getEmployerName().equals(employerName)){
                        JobKey=jobs.get(i).getJobKey();
                    }
                }
                
                
               request.getSession().setAttribute("employerName", employerName);
			   request.getSession().setAttribute("JobKey", JobKey);
                           System.out.println(JobKey);
              String url = "/TWC2-CaseManagementSystem/AssociatePreMenu.jsp";
                response.sendRedirect(url);
                
        }catch(Exception err) {
           err.printStackTrace();
        }
      }
}
     



