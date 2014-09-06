/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import src.InjuryDetail;
import src.JobProfile;
import src.Pass;
import src.Problem;
import src.Worker;

/**
 *
 * @author junyeol
 */
@WebServlet(name = "AssociateFindFINServlet", urlPatterns = {"/AssociateFindFINServlet"})
public class AssociateFindFINServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        
        
        try{
            String FIN = request.getParameter("FIN");
            String specialPassNumber = request.getParameter("specialPass");
            
            
         response.getWriter().println(FIN);
//            response.getWriter().println(specialPassNumber);
            DBConnect database = new DBConnect();
            DBConnect.connectDB();
            
            ArrayList<Worker> workers = database.getWorkers();
            String JobKey = null;
            String ProbKey = null;
            
            ArrayList<JobProfile> jobs = DBConnect.retrieveJobKeys(FIN);
            if(jobs.size()>=1){
            JobKey = jobs.get(jobs.size()-1).getJobKey();
            }
            response.getWriter().println(JobKey);
            System.out.println(JobKey);
            
            request.getSession().setAttribute("JobKey",JobKey);
            if(JobKey!=null){
                 response.getWriter().println(JobKey);
            ArrayList<String> problems = DBConnect.retrieveProblems2(FIN, JobKey);
            ProbKey = problems.get(0);
            response.getWriter().println("gha" + JobKey);
            }
            System.out.println(ProbKey);
            
            request.getSession().setAttribute("ProbKey",ProbKey);
            
            if(FIN.length()>1){
                if(JobKey!=null){
                for(int i = 0 ; i < workers.size(); i++) {
                    Worker worker = workers.get(i);
                    if(worker.getFIN_Num().equalsIgnoreCase(FIN)){
                        request.getSession().setAttribute("FIN", FIN);
                        request.getSession().setAttribute("workerName", worker.getWorkerName());
                        
                        String employerName = DBConnect.getEmployer(FIN);
                        request.getSession().setAttribute("employerName", employerName);
                        
                        
                        String Problem = (String)request.getSession().getAttribute("problemName");
                        if(Problem==null){
                            Problem = DBConnect.getChiefProblem(FIN,JobKey);
                        }
                        System.out.println(Problem);
                        request.getSession().setAttribute("problemNameShow", Problem);
                        
                        InjuryDetail injury = DBConnect.getAssociateInjuryDetails(FIN);
                        request.getSession().setAttribute("injury", injury);
                        
                        
                        String url = "/TWC2-CaseManagementSystem/AssociatePreMenu.jsp";
                        response.sendRedirect(url);
                        break;
                    }
                }
                }
                request.getSession().setAttribute("errMsg", " Correct FIN? Try again");
                String url = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
                
                
                response.sendRedirect(url);
            }else if(specialPassNumber.length()>1){
                
                Pass pass = database.getPassDetails2(specialPassNumber);
                //tbl_job add field PassNumber
                if(pass != null){
                    if(pass.getPassNumber().length()>1){
                        request.getSession().setAttribute("specialPassNumber", specialPassNumber);
                        String employerName = DBConnect.getEmployer2(specialPassNumber);
                        request.getSession().setAttribute("employerName", employerName);
                        String url = "/TWC2-CaseManagementSystem/AssociatePreMenu.jsp";
                        response.sendRedirect(url);
                        
                    } else if(pass.getPassNumber().length()<1){
                        
                        request.getSession().setAttribute("specialErrMsg", " Correct SpecialPassNumber? Try again.");
                        String url = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
                        response.sendRedirect(url);
                    }
                }
                else {
                    request.getSession().setAttribute("specialErrMsg", " Correct SpecialPassNumber? Try again.");
                    String url = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
                    response.sendRedirect(url);
                }
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
