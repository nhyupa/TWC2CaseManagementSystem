/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.ChiefProblem;
import src.DBConnect;
import src.Problem;
/**
 *
 * @author lee
 */
@WebServlet(name = "AssociateSwitchToSelectedProblemServlet", urlPatterns = {"/AssociateSwitchToSelectedProblemServlet"})
public class AssociateSwitchToSelectedProblemServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doGet (HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    
    }  
    @Override
      public void doPost (HttpServletRequest request, HttpServletResponse response) {
        try{
               String FIN = (String)request.getSession().getAttribute("FIN");
               String problemNameShow = request.getParameter("radProblem");
               
               response.getWriter().println(FIN);
               response.getWriter().println("Problem Name Show : " + problemNameShow);
              String ProbKey = null;
              ArrayList<ChiefProblem> problems = DBConnect.retrieveProbKeys(FIN);
              response.getWriter().println("Size : " + problems.size());
               for(int i=0; i<problems.size(); i++){
                   response.getWriter().println(problems.get(i).getChiefProblem());
                   if(problems.get(i).getChiefProblem().equals(problemNameShow)){
                       ProbKey = problems.get(i).getProbKey();
                       
                   }
               }
               
               
                System.out.println(problemNameShow);
			   request.getSession().setAttribute("problemNameShow", problemNameShow);
			   request.getSession().setAttribute("ProbKey", ProbKey);
                           System.out.println(ProbKey);
              String url = "/TWC2-CaseManagementSystem/AssociatePreMenu.jsp";
                response.sendRedirect(url);
                
        }catch(Exception err) {
           err.printStackTrace();
        }
      }
}
     



