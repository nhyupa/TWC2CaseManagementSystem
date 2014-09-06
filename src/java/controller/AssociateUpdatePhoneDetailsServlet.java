/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import src.DBConnect;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author keemin.chew.2010
 */
@WebServlet(name = "AssociateUpdatePhoneDetailsServlet", urlPatterns = {"/AssociateUpdatePhoneDetailsServlet"})
public class AssociateUpdatePhoneDetailsServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            DBConnect.connectDB();
            String FIN = (String) request.getSession().getAttribute("FIN");
            String SgPhoneNumber = request.getParameter("contactnumber");
            String SgPhoneNumberObsoleteDate = request.getParameter("registerdate");
            SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            
            response.getWriter().println("FIN : " + FIN);
            response.getWriter().println("Sg Phone Number : " + SgPhoneNumber);
            response.getWriter().println("Sg phone Number obsolete Date : " + SgPhoneNumberObsoleteDate);
            
            boolean checkFINNumber = DBConnect.checkFINNumFromWorkerContactDetails(FIN);
            response.getWriter().println(checkFINNumber + "hahah");
            if(checkFINNumber == false){
                DBConnect.InsertWorkerPhoneDetails(FIN,SgPhoneNumber,SgPhoneNumberObsoleteDate);
            }
            else{
                DBConnect.updatePhoneNumber(SgPhoneNumber,SgPhoneNumberObsoleteDate, FIN);
            }
           
            String url = "AssociateMenu.jsp";
            request.getSession().setAttribute("msg", "Phone Number has been updated.");
            response.sendRedirect(url);
            
            

        } catch (Exception err) {
            System.out.println("Error: " + err);
        }

    }
}
