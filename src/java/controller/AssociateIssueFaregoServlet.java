/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.Benefaction;
import src.DBConnect;

/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateIssueFaregoServlet", urlPatterns = {"/AssociateIssueFaregoServlet"})
public class AssociateIssueFaregoServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            
            
            DBConnect.connectDB();
               String FIN_Num = (String) request.getSession().getAttribute("FIN");
            
              ArrayList<Benefaction> benefaction = DBConnect.getBenefactionRecordsFareGo(FIN_Num);
              request.getSession().setAttribute("benefaction", benefaction);
             System.out.println("q");
              String RegisterDate = request.getParameter("registerdate");
               String Benefit = request.getParameter("benefitoption");
               String SerialNum = request.getParameter("serialnumber");
               String Value = request.getParameter("value");    
               
              String JobKey = (String)request.getSession().getAttribute("JobKey");
              String ProbKey = (String)request.getSession().getAttribute("ProbKey");
              
             
               
               System.out.println(RegisterDate);
               if(Value.equals("")){
                   if(SerialNum.equals("")){
                       DBConnect.InsertFarego2(RegisterDate,JobKey,ProbKey, Benefit,"", FIN_Num);
                   } else{
                       DBConnect.InsertFarego2(RegisterDate,JobKey,ProbKey, Benefit, SerialNum, FIN_Num);
                   }
               
               }else{
                   if(SerialNum.equals("")){
                       DBConnect.InsertFarego(RegisterDate,JobKey,ProbKey, Benefit,"", Value, FIN_Num);
                   }else{
                       DBConnect.InsertFarego(RegisterDate,JobKey,ProbKey, Benefit, SerialNum, Value, FIN_Num);
                   }
                    
               }
               System.out.println("q");
            String url = "/TWC2-CaseManagementSystem/AssociateMenu.jsp";
                response.sendRedirect(url);
            
            
        } catch(Exception err) {
           err.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
