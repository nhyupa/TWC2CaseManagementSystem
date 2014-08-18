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
@WebServlet(name = "EditWorkerProfileServlet", urlPatterns = {"/EditWorkerProfileServlet"})
public class EditWorkerProfileServlet extends HttpServlet {
    
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost (HttpServletRequest request, HttpServletResponse response) {
        
        try{
            
            String workerRegistrationDate = request.getParameter("workerRegDate");
            String createdBy = request.getParameter("createdBy");
            String createdFor = request.getParameter("createdFor");
            String workerName = request.getParameter("workerName");
            String gender = request.getParameter("gender");
            String nationality = request.getParameter("nationality");
            String otherNationality = request.getParameter("otherNationality");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String FIN_No = (String)request.getSession().getAttribute("FIN");
            
            String format = "T00:00:00";
            if(dateOfBirth.length()!=0){
                dateOfBirth = dateOfBirth + format;
            }
            response.getWriter().println(workerRegistrationDate);
            response.getWriter().println(createdBy);
            response.getWriter().println(createdFor);
            response.getWriter().println(workerName);
            response.getWriter().println(gender);
            response.getWriter().println(nationality);
            response.getWriter().println(otherNationality);
            response.getWriter().println(dateOfBirth);
            response.getWriter().println(FIN_No);
            
            DBConnect.connectDB();
            
            if(workerRegistrationDate.length() !=0){
                DBConnect.updateWorkerRegDate(FIN_No, workerRegistrationDate);
            }
            if(createdBy.length() !=0){
                DBConnect.updateCreatedBy(FIN_No, createdBy);
            }
            if(createdFor.length() !=0){
                DBConnect.updateCreatedFor(FIN_No,createdFor);
            }
            if(workerName.length()!=0){
                DBConnect.updateWorkerName(FIN_No, workerName);
            }
            if(gender.length()!=0){
                DBConnect.updateGender(FIN_No, gender);
            
            }
            if(nationality.length()!=0){
                DBConnect.updateNationality(FIN_No, nationality);
            }
            if(dateOfBirth.length() !=0){
                DBConnect.updateDateOfBirth(FIN_No, dateOfBirth);
            }
            
            
            String url = "/TWC2-CaseManagementSystem/CaseMenu.jsp";
            request.getSession().setAttribute("editWorkerSuccessMsg","Worker Profile has been edited.");
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
