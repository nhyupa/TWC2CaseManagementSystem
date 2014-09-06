/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.Benefaction;
import src.DBConnect;
import src.Pass;
import src.R2R;
import src.Worker;

/**
 *
 * @author junyeol
 */
@WebServlet(name = "AssociateOverviewR2RServlet", urlPatterns = {"/AssociateOverviewR2RServlet"})
public class AssociateOverviewR2RServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        
        
        try{
                  
                    DBConnect.connectDB();
            
            String StartDate = request.getParameter("fromDate");
           String EndDate = request.getParameter("toDate");
           
           
           ArrayList<R2R> r2r = DBConnect.getR2RRecords();
           ArrayList<R2R> selected = new ArrayList<R2R>();
         
           
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            
      
            
            
             Date Startdate ;
             Startdate = (Date)df.parse(StartDate);
             Date Enddate ;
             Enddate = (Date)df.parse(EndDate);
             System.out.println(StartDate);
           System.out.println(Startdate);       
           
            for (R2R r2r1 : r2r) {
                Date date1 = r2r1.getR2RDate();
                
                if (date1.before(Enddate)&& date1.after(Startdate) || date1.equals(Enddate)|| date1.equals(Startdate)){
                    
                    selected.add(r2r1);
                System.out.println(date1);
                System.out.println("oh");
                   }
            }
           System.out.println("home");
            request.getSession().setAttribute("selectedR2R", selected);
            
                    String url = "/TWC2-CaseManagementSystem/AssociateListR2R.jsp";
                    response.sendRedirect(url);
                   
                      
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
 
}
