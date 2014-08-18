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
import src.ChiefProblem;
import src.DBConnect;
import src.JobProfile;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "SpecialistAddJobAndProblemServlet", urlPatterns = {"/SpecialistAddJobAndProblemServlet"})
public class SpecialistAddJobAndProblemServlet extends HttpServlet {

    
     public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            
            String FIN = (String)request.getSession().getAttribute("FIN");
            /** Job **/
            String employerName = request.getParameter("employerName");
            String workpass = request.getParameter("workpass");
            String otherWorkpass = request.getParameter("otherWorkpass");
            String jobsector = request.getParameter("jobsector");
            String otherJobSector = request.getParameter("otherJobSector");
            String occupation = request.getParameter("occupation");
            String jobCommenced = request.getParameter("jobCommenced");
            String jobEnded = request.getParameter("jobEnded");
            String tjsJob = request.getParameter("TJSJob");
            String jobRemarks = request.getParameter("jobRemarks");
            
            
            /** Problem **/
            String problemRegDate = request.getParameter("problemRegDate");
            String chiefProblem = request.getParameter("chiefProblem");
            String otherProblem = request.getParameter("otherProblem");
            String problemRemarks = request.getParameter("problemRemarks");
            
           
            JobProfile job = new JobProfile(FIN,employerName,
                    workpass, otherWorkpass,jobsector, otherJobSector,occupation,jobCommenced,jobEnded,tjsJob,jobRemarks);
            
            DBConnect.createJob(job);
            
            ChiefProblem problem = new ChiefProblem(problemRegDate,chiefProblem,otherProblem,problemRemarks,FIN);
            DBConnect.createProblem(problem);
            
            String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
            response.sendRedirect(url);
            
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
