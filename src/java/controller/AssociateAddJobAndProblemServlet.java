/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import src.JobProfile;
import src.Worker;
import src.WorkerPassDetails;
/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateAddJobAndProblemServlet", urlPatterns = {"/AssociateAddJobAndProblemServlet"})
public class AssociateAddJobAndProblemServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
      public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            
            DBConnect.connectDB();
          String FIN_Num =(String)request.getSession().getAttribute("FIN");
              
     
           
           
       SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat fromUser = new SimpleDateFormat("dd/MM/yyyy");
               String datePattern = "\\d{4}-\\d{1,2}-\\d{1,2}";
             
            //tbl_job
           String employer = request.getParameter("employerName");
	   String passTypeJob= request.getParameter("passTypeWithJob");
	   String passOtherTypeJob = request.getParameter("otherPassExplanation");
           String jobsector= request.getParameter("jobsector");
           String jobothersector= request.getParameter("jobothersector");
	   String occupation= request.getParameter("occupation");
	   String startDate = request.getParameter("commencement");
           String tjs=request.getParameter("tjs");
           String remarks=request.getParameter("remarks");
         
        
                Random random = new Random();
                
            String JobKey=(String)request.getSession().getAttribute("JobKey");
                String ProbKey = (String)request.getSession().getAttribute("ProbKey");
                
                System.out.println("start");
                
                while(DBConnect.checkJobKey(JobKey)){
                String one = Integer.toString(random.nextInt(10));
                String two = Integer.toString(random.nextInt(10));
                String three = Integer.toString(random.nextInt(10));
                String four = Integer.toString(random.nextInt(10));
                String five = Integer.toString(random.nextInt(10));
                String six = Integer.toString(random.nextInt(10));
                String seven = Integer.toString(random.nextInt(10));
                String eight = Integer.toString(random.nextInt(10));
                String nine = Integer.toString(random.nextInt(10));
                String ten = Integer.toString(random.nextInt(10));
                
                JobKey= one+two+three+four+five+six+seven+eight+nine+ten;
                System.out.println(JobKey);
                System.out.println("JobKey");
                if(!DBConnect.checkJobKey(JobKey)){
                    break;
                }
                }
                
         
              if(passTypeJob.equals("Other")){
                  if(jobsector.equals("Other")){
                          DBConnect.InsertJobDetails(JobKey,employer,passTypeJob,passOtherTypeJob,jobsector,jobothersector,occupation,startDate, tjs,remarks,FIN_Num);
                      System.out.println("0101");
                      }else{
                          DBConnect.InsertJobDetails(JobKey,employer, passTypeJob,passOtherTypeJob, jobsector,"", occupation, startDate, tjs, remarks, FIN_Num);
                          System.out.println("019998");
                      }
              }else{
                  if(jobsector.equals("Other")){
                           DBConnect.InsertJobDetails(JobKey,employer, passTypeJob,"", jobsector,jobothersector, occupation,startDate, tjs, remarks, FIN_Num);
                       System.out.println("01988787");
                      }else{
                         DBConnect.InsertJobDetails(JobKey,employer, passTypeJob,"", jobsector,"", occupation,startDate, tjs, remarks, FIN_Num);
                      System.out.println("019767967"); 
                      } 
                   } 
    
                //tbl_pass_details
                String passTypeInput= request.getParameter("currentPassType");
		String passOtherTypeInput = request.getParameter("passExplain");
		String workerPassNumber = request.getParameter("passnumber");
                String workerPassIssueDate=request.getParameter("passIssueDate");
                
                
                while(DBConnect.checkProbKey(ProbKey)){
                String onez = Integer.toString(random.nextInt(10));
                String twoz = Integer.toString(random.nextInt(10));
                String threez = Integer.toString(random.nextInt(10));
                String fourz = Integer.toString(random.nextInt(10));
                String fivez = Integer.toString(random.nextInt(10));
                String sixz = Integer.toString(random.nextInt(10));
                String sevenz = Integer.toString(random.nextInt(10));
                String eightz = Integer.toString(random.nextInt(10));
                String ninez = Integer.toString(random.nextInt(10));
                String tenz = Integer.toString(random.nextInt(10));
                
                 ProbKey= onez+twoz+threez+fourz+fivez+sixz+sevenz+eightz+ninez+tenz;
                  System.out.println(ProbKey);
                  System.out.println("ProbKey");
                if(!DBConnect.checkProbKey(ProbKey)){
                    break;
                }
                }
                
                 System.out.println(ProbKey);
                    
                datePattern = "\\d{4}-\\d{1,2}-\\d{1,2}";
               // if date=yyyy-MM-dd
                if(workerPassIssueDate.matches(datePattern))  {
                        if(passTypeInput.equals("Other")){
                           DBConnect.InsertWorkerPassDetails(FIN_Num ,JobKey, passTypeInput,passOtherTypeInput,workerPassNumber,workerPassIssueDate);
                           System.out.println("3");
              }else{
                         DBConnect.InsertWorkerPassDetails(FIN_Num,JobKey, passTypeInput,"",workerPassNumber,workerPassIssueDate);
                         System.out.println("4");
                        } 

                }  else{
                     fromUser = new SimpleDateFormat("dd/MM/yyyy");
                    String reformattedStr = myFormat.format(fromUser.parse(workerPassIssueDate));
                     if(passTypeInput.equals("Other")){
                             DBConnect.InsertWorkerPassDetails(FIN_Num ,JobKey, passTypeInput,passOtherTypeInput,workerPassNumber,reformattedStr);
                             System.out.println("11");
              }else{
                DBConnect.InsertWorkerPassDetails(FIN_Num,JobKey, passTypeInput,"",workerPassNumber,reformattedStr);
                System.out.println("12");
                        } 
                }
       
               //tbl_problem
                String chiefProblem = request.getParameter("chiefProb");
                String chiefProblemOthers = request.getParameter("chiefProbOthers");
                String chiefProbRemarks = request.getParameter("chiefProbRemarks");
        
                
              if(chiefProblem.equals("Other")){
                DBConnect.InsertChiefProblem(FIN_Num ,JobKey,ProbKey, chiefProblem, chiefProblemOthers, chiefProbRemarks);
                System.out.println("111");
              }else{
                DBConnect.InsertChiefProblem(FIN_Num, JobKey,ProbKey, chiefProblem,"", chiefProbRemarks);
                System.out.println("112");
              }
                //tbl_injury
                String InjuryDate = request.getParameter("InjuryDate");
                String InjuredBodyParts = request.getParameter("InjuredBodyParts");
                //tbl_hospital
                String Hospital = request.getParameter("hospital");
                String HospitalOther = request.getParameter("hospitalOther");
                //tbl_lawyer
                String Lawyer = request.getParameter("Lawyer");
                String LawFirm = request.getParameter("LawFirm");
          
              
                   if(Hospital.equals("Other")){
                    DBConnect.InsertHospital(JobKey,ProbKey,Hospital,HospitalOther,FIN_Num); 
                    System.out.println("113");
                }else{
                    DBConnect.InsertHospital(JobKey,ProbKey,Hospital,"",FIN_Num);
                    System.out.println("114");
                }
                
                   DBConnect.InsertLawyer(JobKey,ProbKey,Lawyer,LawFirm,FIN_Num);
                   System.out.println("11111");
                 
                  
                   System.out.println("122222");
                   
                if(InjuryDate==null || InjuryDate.equals("")){
              DBConnect.InsertInjury2(FIN_Num,JobKey,ProbKey, InjuredBodyParts );
              } else{
                datePattern = "\\d{4}-\\d{1,2}-\\d{1,2}";
               // if date=yyyy-MM-dd
                if(InjuryDate.matches(datePattern))  {
                        DBConnect.InsertInjury(FIN_Num,JobKey,ProbKey, InjuryDate, InjuredBodyParts);
                        System.out.println("166666");

                }  else{
                     fromUser = new SimpleDateFormat("dd/MM/yyyy");
                    String reformattedStr = myFormat.format(fromUser.parse(InjuryDate));
                     DBConnect.InsertInjury(FIN_Num,JobKey,ProbKey, reformattedStr, InjuredBodyParts);
                     System.out.println("19999");
                }
          }   
                String FIN =FIN_Num; 
               request.getSession().setAttribute("FIN",FIN);
               request.getSession().setAttribute("JobKey",JobKey);
               request.getSession().setAttribute("ProbKey",ProbKey);
              String url = "/TWC2-CaseManagementSystem/AssociateMenu.jsp";
                response.sendRedirect(url);
                
                System.out.println("123");
                
        }catch(Exception err) {
           err.printStackTrace();
        }
      }
}
     
