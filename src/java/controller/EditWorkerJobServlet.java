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
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "EditWorkerJobServlet", urlPatterns = {"/EditWorkerJobServlet"})
public class EditWorkerJobServlet extends HttpServlet {

    

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
             String employerName = request.getParameter("employerName");
             String workPassType = request.getParameter("workPassType");
             String otherWorkpass = request.getParameter("other");
             String jobSector = request.getParameter("jobSector");
             String otherJobSector = request.getParameter("otherJobSector");
             String occupation = request.getParameter("occupation");
             String jobCommencedDate =request.getParameter("jobcommencement");
             String jobEndDate = request.getParameter("jobended");
             String tjs =  request.getParameter("TJS");
             String jobRemarks = request.getParameter("jobremarks");
             
             String FIN  = (String)request.getSession().getAttribute("FIN");
             
             response.getWriter().println("Employer Name " + employerName);
             response.getWriter().println("Work Pass Type " + workPassType);
             response.getWriter().println("Other work pass type : "+ otherWorkpass);
            
             response.getWriter().println("jobSecotr " + jobSector);
             response.getWriter().println("Other jobSector : " + otherJobSector);
             response.getWriter().println("Occupation " + occupation);
             response.getWriter().println("Job Comeenced date " + jobCommencedDate);
             response.getWriter().println("Job End Date " + jobEndDate);
             response.getWriter().println("TJS " + tjs);
             response.getWriter().println("Job Remarks " + jobRemarks);
             response.getWriter().println("FIN : "  + FIN);
             
             
             DBConnect.connectDB();
             if(employerName.length()!=0){
                 DBConnect.updateEmployerName(FIN, employerName);
             }
             if(workPassType.length() !=0){
                DBConnect.updateWorkpassType(FIN, workPassType);
             }
             if(jobSector.length() !=0){
                DBConnect.updateJobSector(FIN, jobSector);
             }
             if(occupation.length() !=0){
                DBConnect.updateOccupation(FIN, occupation);
             }
             if(jobCommencedDate.length() !=0){
                 DBConnect.updatejobCommencedDate(FIN,jobCommencedDate);
             }
             if(jobEndDate.length() !=0){
                 DBConnect.updatejobEndDate(FIN, jobEndDate);
             }
             if(tjs.length() !=0){
                 DBConnect.updateTJS(FIN, tjs);
             }
             if(jobRemarks.length() !=0){
                 DBConnect.updateJobRemarks(FIN,jobRemarks);
             }
             
             
            String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
            request.getSession().setAttribute("editWorkerJobSuccessMsg","Worker's Job Profile has been edited.");
            response.sendRedirect(url);
             
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
