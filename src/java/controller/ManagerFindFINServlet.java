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
@WebServlet(name = "ManagerFindFINServlet", urlPatterns = {"/ManagerFindFINServlet"})
public class ManagerFindFINServlet extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            
            
            
            String workerName = request.getParameter("Name");
            String FIN = request.getParameter("FIN");
            String gender = request.getParameter("Gender");
            String sgPhoneNumber = request.getParameter("SingaporePhoneNumber");
            String nationality = request.getParameter("Nationality");
            String formattedGender = null;
            if(gender.length() != 0 ){
                formattedGender = gender.substring(0,1);
            }
           
            DBConnect database = new DBConnect();
            DBConnect.connectDB();   
            String url = "/TWC2-CaseManagementSystem/ManagerHomePage.jsp";
            
            response.getWriter().println("Before: " + sgPhoneNumber);
               
            ArrayList<Worker> workers = database.getWorkers();
            
            for(int i =0 ; i< workers.size(); i++) {
                Worker worker = workers.get(i);
                String existedWorkername = worker.getWorkerName();
                String existedFINNum  = worker.getFIN_Num();
                String existedGender = worker.getGender();
                String existedNationality = worker.getNationality();
                response.getWriter().println("After: " + sgPhoneNumber);
                
                if(workerName.length()!= 0){
                    if(workerName.equalsIgnoreCase(existedWorkername)){
                        response.getWriter().println("inside workerName Loop");
                        request.getSession().setAttribute("FIN",existedFINNum);
                        request.getSession().setAttribute("workerName", existedWorkername);
                        request.getSession().setAttribute("searchResults", "() Records have been found.");
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
                 response.getWriter().println("After: " + sgPhoneNumber);
                if(FIN.length() !=0) {
                    if(FIN.equalsIgnoreCase(existedFINNum)){
                        
                        response.getWriter().println("After: " + sgPhoneNumber);
                        request.getSession().setAttribute("FIN",existedFINNum);
                        request.getSession().setAttribute("workerName", existedWorkername);
                        request.getSession().setAttribute("searchResults", "() Records have been found.");
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
                 response.getWriter().println("After: " + sgPhoneNumber);
                if(nationality.length() !=0){
                    if(nationality.equalsIgnoreCase(existedNationality)){
                       response.getWriter().println("After: " + sgPhoneNumber);
                        ArrayList<Worker> nationalitySearchResults = new ArrayList<Worker>();
                        nationalitySearchResults = DBConnect.retrieveNationalitySearchResults(nationality);
                        response.getWriter().println("Testing "  + nationalitySearchResults.size());
                        request.getSession().setAttribute("nationalitySearchResults",nationalitySearchResults);
                        request.getSession().setAttribute("nationalitySearchResultsMsg", "() Records have been found.");
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
                 
                if(sgPhoneNumber.length()!=0){
                    
                    ArrayList<WorkerContactDetails> contactDetailsSearchResults = new ArrayList<WorkerContactDetails>();
                    contactDetailsSearchResults = DBConnect.retrieveSgPhoneNumberSearchResults(sgPhoneNumber);
                    if(contactDetailsSearchResults.size() != 0){
                        request.getSession().setAttribute("contactDetailsSearchResults",contactDetailsSearchResults);
                        request.getSession().setAttribute("contactDetailsSearchResultsMsg", "()Records have been found.");
                        response.sendRedirect(url);
                        break;
                    }
                    else{
                        if(contactDetailsSearchResults.size() ==0){
                            request.getSession().setAttribute("notFoundMsg","No Records have been found.");
                            response.sendRedirect(url);
                        }
                        continue;
                    }
                }
                
                /** Gender problem still needs to be resolved **/
                if(formattedGender.length() !=0 ){
                    if(formattedGender.equalsIgnoreCase(existedGender)){
                       
                        ArrayList<Worker> genderSearchResults = new ArrayList<Worker>();
                        
                        genderSearchResults = DBConnect.retrieveGenderSearchResults(formattedGender.toUpperCase());
                        request.getSession().setAttribute("genderSearchResults",genderSearchResults);
                        request.getSession().setAttribute("genderSearchResultsMsg", "() Records have been found.");
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
