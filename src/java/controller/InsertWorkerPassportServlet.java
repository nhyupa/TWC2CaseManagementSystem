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
@WebServlet(name = "InsertWorkerPassportServlet", urlPatterns = {"/InsertWorkerPassportServlet"})
public class InsertWorkerPassportServlet extends HttpServlet {

   public void doGet(HttpServletRequest request, HttpServletResponse response) {
        
            doPost(request,response);
        
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
            try{
                
                String FIN = (String)request.getSession().getAttribute("FIN");
                DBConnect.connectDB();
                
                /** NickName **/
                String nickName = request.getParameter("nickName");
                boolean checkFINNum = DBConnect.checkFINNum(FIN);
                response.getWriter().println("FIN Num: " + checkFINNum);
                
                
                if(!checkFINNum && nickName == null ) {
                   DBConnect.insertNickName(nickName, FIN);
                }
                
                response.getWriter().println(nickName);
                if(checkFINNum == true && nickName !=null){
                    DBConnect.updateNickName(nickName,FIN);
                }
                
                /** Passport **/
                String passportCountry = request.getParameter("country");
                String passportNumber = request.getParameter("passport_number");
                String passportIssue = request.getParameter("passport_issue");
                String passportExpiryDate = request.getParameter("passport_expiry_date");
                
                DBConnect.insertPassportDetails(passportCountry, passportNumber, FIN, passportIssue, passportExpiryDate);
                
                request.getSession().setAttribute("passportCountry",passportCountry);
                request.getSession().setAttribute("passportNumber",passportNumber);
                request.getSession().setAttribute("passportIssue",passportIssue);
                request.getSession().setAttribute("passportExpiryDate",passportExpiryDate);
                //String url="ViewRecord.jsp";
                //response.sendRedirect(url);
                
                /** Friend Details **/
                String friendName = request.getParameter("friendName");
                String friendPhone = request.getParameter("friendPhone");
                String workerRelationship  = request.getParameter("workerRelationship");
                String obsoleteDate = request.getParameter("obsoleteDate");
                 
             
                   response.getWriter().println("NickName3" + nickName);
                    DBConnect.insertWorkerFriend(friendName, friendPhone, workerRelationship, obsoleteDate, FIN);
                    //String url="ViewRecord.jsp";
                    //response.sendRedirect(url);
                
                 
                /** Family Member Details **/
                String familyMemberName = request.getParameter("familyMemberName");
                String familyMemberRelationship = request.getParameter("friendMemberRelationship");
                String familyMemberPhoneNumber = request.getParameter("familyMemberPhoneNumber");
                String FamilyMemberDateObsolete = request.getParameter("FamilyMemberDateObsolete");
                
                response.getWriter().println(familyMemberName);
                response.getWriter().println(familyMemberRelationship);
                response.getWriter().println(familyMemberPhoneNumber);
                response.getWriter().println(FamilyMemberDateObsolete);
            }catch(Exception err) {
                System.out.println("Error : " + err);
            }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
