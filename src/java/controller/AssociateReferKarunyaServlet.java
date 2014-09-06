/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
import src.Benefaction;
import src.DBConnect;

/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateReferKarunyaServlet", urlPatterns = {"/AssociateReferKarunyaServlet"})
public class AssociateReferKarunyaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            
            
         DBConnect.connectDB();
               String FIN_Num = (String)request.getSession().getAttribute("FIN");
             System.out.println("1");
              ArrayList<Benefaction> benefaction = DBConnect.getBenefactionRecordsKarunya(FIN_Num);
              request.getSession().setAttribute("benefaction", benefaction);
               System.out.println("1");
               String RegisterDate = request.getParameter("registerdate");
               String Benefit = request.getParameter("benefitoption");
               String SerialNum = request.getParameter("serialnum");
                System.out.println("1");
                
                
              String JobKey = (String)request.getSession().getAttribute("JobKey");
              String ProbKey = (String)request.getSession().getAttribute("ProbKey");
              
              
               DBConnect.InsertKarunyaRecord(RegisterDate,JobKey,ProbKey, Benefit, SerialNum, FIN_Num);
               
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
