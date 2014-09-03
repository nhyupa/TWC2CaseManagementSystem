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
import src.Worker;
import src.WorkerContactDetails;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "SpecialistFindFINServlet", urlPatterns = {"/SpecialistFindFINServlet"})
public class SpecialistFindFINServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            
            
            /** Catching Values From JSP Page **/
            String workerName = request.getParameter("Name");
            String FIN = request.getParameter("FIN");
            String gender = request.getParameter("Gender");
            String nationality = request.getParameter("Nationality");
            String sgPhoneNumber = request.getParameter("SingaporePhoneNumber");
            String homeCountryPhoneNumber = request.getParameter("HomeCountryPhoneNumber");
            String employerName = request.getParameter("EmployerName");
            String occupation = request.getParameter("Occupation");
            String workpass = request.getParameter("Workpass");
            String chiefProblem = request.getParameter("ChiefProblem");
            String aggravatingIssue = request.getParameter("AggravatingIssue");
            String leadCaseWorker = request.getParameter("LeadCaseworker");
            String auxillaryCaseWorker = request.getParameter("AuxiliaryCaseworker");
            String hospitalName = request.getParameter("Hospital");
            String problemRegisteredDateFrom = request.getParameter("ProblemRegisteredDateFrom");
            String problemRegisteredDateTo = request.getParameter("ProblemRegisteredDateTo");
            String betweenDateFrom = request.getParameter("BetweenDateFrom");
            String betweenDateTo = request.getParameter("BetweenDateTo");
            /** Catching Values From JSP Page **/
            
            response.getWriter().println("Worker Name : " + workerName);
            response.getWriter().println("Worker Name Length : " + workerName.length());
            response.getWriter().println("FIN Number : " + FIN);
            response.getWriter().println("FIN Number Length : " + FIN.length());
            
            
            
            String formattedGender = null;
            if(gender.length() != 0 ){
                formattedGender = gender.substring(0,1);
            }
           
            DBConnect database = new DBConnect();
            DBConnect.connectDB();   
            String url = "/TWC2-CaseManagementSystem/SpecialistHomePageSearchResult.jsp";
            
            response.getWriter().println("Before: " + sgPhoneNumber);
               
            ArrayList<Worker> workers = database.getWorkers();
            
            for(int i =0 ; i< workers.size(); i++) {
                Worker worker = workers.get(i);
                String existedWorkername = worker.getWorkerName();
                String existedFINNum  = worker.getFIN_Num();
                String existedGender = worker.getGender();
                String existedNationality = worker.getNationality();
                response.getWriter().println("After: " + sgPhoneNumber);
                
                if(workerName.length()!= 0 && workerName != null){
                    ArrayList<Worker> workerNames = DBConnect.retrieveByWorkerNames(workerName);
                    
                    if(workerNames != null && workerNames.size() !=0){
                        response.getWriter().println("inside workerName Loop");
                        request.getSession().setAttribute("FIN",existedFINNum);
                        request.getSession().setAttribute("workerName", existedWorkername);
                        request.getSession().setAttribute("workerNameSearchResults","Records have been found.");
                        request.getSession().setAttribute("workerObjs",workerNames);
                        response.sendRedirect(url);
                        break;
                    }
                    else{
                        if(workers.size()-i ==1){
                            response.getWriter().println("After: " + sgPhoneNumber);
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            String homepage = "/TWC2-CaseManagementSystem/SpecialistHomePage.jsp";
                            response.sendRedirect(homepage);
                        }
                        continue;   
                    }
                }
                 response.getWriter().println("After: " + sgPhoneNumber);
                if(FIN.length() !=0 && FIN != null) {
                    ArrayList<Worker> workerFins = DBConnect.retrieveByFIN(FIN);
                    if(workerFins!=null){
                        response.getWriter().println("inside workerName Loop");
                        request.getSession().setAttribute("FIN",existedFINNum);
                        request.getSession().setAttribute("workerName", existedWorkername);
                        request.getSession().setAttribute("workerFINSearchResults","Records have been found.");
                        request.getSession().setAttribute("workerFINObjs",workerFins);
                        response.sendRedirect(url);
                        break;
                    }
                    else{
                        if(workers.size()-i ==1){
                            response.getWriter().println("After: " + sgPhoneNumber);
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            response.sendRedirect(url);
                        }
                        continue;   
                    }
                }
                 
                if(nationality.length() !=0 && nationality!=null){
                    ArrayList<Worker>nationalitySearchResults = DBConnect.retrieveNationalitySearchResults(nationality);
                        if(nationalitySearchResults!= null){
                            response.getWriter().println("After: " + sgPhoneNumber);
                            response.getWriter().println("Testing "  + nationalitySearchResults.size());
                            request.getSession().setAttribute("nationalitySearchResults",nationalitySearchResults);
                            request.getSession().setAttribute("nationalitySearchResultsMsg", "Records have been found.");
                            response.sendRedirect(url);
                        break;
                        }
                     else{
                        if(workers.size()-i ==1){
                            response.getWriter().println("After: " + sgPhoneNumber);
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            response.sendRedirect(url);
                        }
                        continue;   
                    }
                   
                }  
                 response.getWriter().println("daf: " + sgPhoneNumber);
                /** Needs to record whether the user's choose the value or default value **/
                 
                if(sgPhoneNumber.length()!=0 && sgPhoneNumber != null){
                    
                    ArrayList<Worker> sgPhoneNumResults = DBConnect.retrieveSgPhoneNumberSearchResults(sgPhoneNumber);
                    if(sgPhoneNumResults != null){
                        request.getSession().setAttribute("contactDetailsSearchResults",sgPhoneNumResults);
                        request.getSession().setAttribute("contactDetailsSearchResultsMsg", "Records have been found.");
                        response.sendRedirect(url);
                        break;
                    }
                    else{
                        if(sgPhoneNumResults.size() - i ==1){
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            response.sendRedirect(url);
                        }
                        continue;
                    }
                }
                
                /** Gender problem still needs to be resolved **/
                if(formattedGender.length() !=0 && formattedGender != null){
                    ArrayList<Worker> genderSearchResults = DBConnect.retrieveGenderSearchResults(formattedGender.toUpperCase());
                    if(genderSearchResults!= null){
                        request.getSession().setAttribute("FIN",existedFINNum);
                        request.getSession().setAttribute("workerName", existedWorkername);
                        request.getSession().setAttribute("workerGenderSearchResults","Records have been found.");
                        request.getSession().setAttribute("workerGenderObjs",genderSearchResults);
                        response.sendRedirect(url);
                        break;
                    }
                    else{
                       if(workers.size()-i ==1){
                           response.getWriter().println("After: " + sgPhoneNumber);
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            response.sendRedirect(url);
                            
                        }
                       
                        continue;   
                    }
                    
                }
                 
                
                
                    response.getWriter().println("Inside Loop:" );
                  
                
                
                 
                         
                    
            }
          
            
            /**
            ArrayList<Worker> workers = database.getWorkers();
            
            for(int i = 0 ; i < workers.size(); i++) {
                Worker worker = workers.get(i);
                if(worker.getFIN_Num().equalsIgnoreCase(FIN)){
                    request.getSession().setAttribute("FIN", FIN);
                    request.getSession().setAttribute("workerName", worker.getWorkerName());
                    
                    String employerName = DBConnect.getEmployer(FIN);
                    request.getSession().setAttribute("employerName", employerName);
                    String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
                    response.sendRedirect(url);
                    break;
                }
            }
            
            request.getSession().setAttribute("errMsg", "FIN number doesn't exist in database.");
            String url = "/TWC2-CaseManagementSystem/SpecialistHomePage.jsp";
            response.sendRedirect(url);**/
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
