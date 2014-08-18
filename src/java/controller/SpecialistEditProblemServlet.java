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
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "SpecialistEditProblemServlet", urlPatterns = {"/SpecialistEditProblemServlet"})
public class SpecialistEditProblemServlet extends HttpServlet {

   
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
            String problemRegistrationDate = request.getParameter("problemRegistrationDate");
            String chiefProblem  = request.getParameter("chiefProblem");
            String chiefProblemOther = request.getParameter("chiefProblemOther");
            String problemRemarks = request.getParameter("problemRemarks");
            String FIN = (String)request.getSession().getAttribute("FIN");
            if(problemRegistrationDate.length() !=0){
                response.getWriter().println("inside Loop");
                DBConnect.updateProblemRegistrationDate(FIN, problemRegistrationDate);
            }
            if(chiefProblem.length() != 0){
                response.getWriter().println("inside Loop");
                DBConnect.updateChiefProblem(FIN, chiefProblem);
            }
            if(chiefProblemOther.length() !=0){
                                response.getWriter().println("inside Loop");

                DBConnect.updateChiefProblemMore(FIN, chiefProblemOther);
            }
            if(problemRemarks.length() !=0){
                                response.getWriter().println("inside Loop");

                DBConnect.updateChiefProblemRemarks(FIN, problemRemarks);
            }
            
            String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
            
            response.sendRedirect(url);
            
            
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
