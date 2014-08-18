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

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "FindFINServlet", urlPatterns = {"/FindFINServlet"})
public class FindFINServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
       try{
            
            String jobTitle = (String)request.getSession().getAttribute("jobTitle");
           
           
            String FIN = request.getParameter("FIN");
            String specialPassNumber = request.getParameter("specialPass");
        
            
            DBConnect database = new DBConnect();
            DBConnect.connectDB();
            
            ArrayList<Worker> workers = database.getWorkers();
            
            for(int i = 0 ; i < workers.size(); i++) {
                Worker worker = workers.get(i);
                if(worker.getFIN_Num().equalsIgnoreCase(FIN)){
                    request.getSession().setAttribute("FIN", FIN);
                    request.getSession().setAttribute("workerName", worker.getWorkerName());
                    
                    String employerName = DBConnect.getEmployer(FIN);
                    request.getSession().setAttribute("employerName", employerName);
                    String url = "/TWC2-CaseManagementSystem/AssociatePreMenu.jsp";
                    response.sendRedirect(url);
                    break;
                }
            }
            response.getWriter().println(jobTitle);
            request.getSession().setAttribute("errMsg", "FIN number doesn't exist in database.");
            
            
            if(jobTitle!= null){
                String url = "/TWC2-CaseManagementSystem/AssociateHomePage.jsp";
                response.sendRedirect(url);
            }
            else{
                response.getWriter().println("Testing");
                String associateUrl = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
                response.sendRedirect(associateUrl);
            }
            //request.getSession().setAttribute("errMsg", "FIN number doesn't exist in database.");
             //String url = "/TWC2-CaseManagementSystem/AssociateWelcome.jsp";
             //response.sendRedirect(url);
           
            //response.getWriter().println(jobTitle);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
