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
import src.ChiefProblem;
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "SpecialistAddProblemProfileServlet", urlPatterns = {"/SpecialistAddProblemProfileServlet"})
public class SpecialistAddProblemProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            String problemRegistrationDate = request.getParameter("problemRegistrationDate");
            String chiefProblem = request.getParameter("chiefProblem");
            String otherProblem = request.getParameter("otherProblem");
            String problemRemarks = request.getParameter("problemRemarks");
            
            String jobKey = (String)request.getSession().getAttribute("jobKey");
            String FIN = (String)request.getSession().getAttribute("FIN");
            
            ChiefProblem problem = new ChiefProblem(jobKey,problemRegistrationDate,chiefProblem,otherProblem,problemRemarks,FIN);
            
            DBConnect.connectDB();
            DBConnect.createProblem(problem);
            
            String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
            request.getSession().setAttribute("problemMsg","New Problem has been added.");
            response.sendRedirect(url);
            response.getWriter().println("FIN_Number ; " + FIN);
            response.getWriter().println("Job Key : " + jobKey);
            response.getWriter().println(problemRegistrationDate);
            response.getWriter().println(chiefProblem);
            response.getWriter().println(otherProblem);
            response.getWriter().println(problemRemarks);
            
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
