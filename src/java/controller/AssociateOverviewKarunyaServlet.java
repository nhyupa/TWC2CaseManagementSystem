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
import src.Worker;

/**
 *
 * @author junyeol
 */
@WebServlet(name = "AssociateOverviewKarunyaServlet", urlPatterns = {"/AssociateOverviewKarunyaServlet"})
public class AssociateOverviewKarunyaServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        
        
        try{
           
            DBConnect.connectDB();
            
            String StartDate = request.getParameter("fromDate");
           String EndDate = request.getParameter("todate");
         
           
           ArrayList<Benefaction> benefaction = DBConnect.getBenefactionRecordsKarunya();
           ArrayList<Benefaction> selected = new ArrayList<Benefaction>();
         
           
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            
          
            
            
            
             Date Startdate ;
             Startdate = (Date)df.parse(StartDate);
             Date Enddate ;
             Enddate = (Date)df.parse(EndDate);
             System.out.println(StartDate);
           System.out.println(Startdate);       
           
            for (Benefaction benefaction1 : benefaction) {
                Date date1 = benefaction1.getBeneDate();
                
               if (date1.before(Enddate)&& date1.after(Startdate) || date1.equals(Enddate)|| date1.equals(Startdate)){
                    
                    selected.add(benefaction1);
                System.out.println(date1);
                System.out.println("oh");
                   }
            }
           System.out.println("home");
            request.getSession().setAttribute("selectedBenefaction", selected);
            
                    String url = "/TWC2-CaseManagementSystem/AssociateListKarunya.jsp";
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
