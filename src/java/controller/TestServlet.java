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

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "TestServlet", urlPatterns = {"/TestServlet"})
public class TestServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            String fileName = request.getParameter("uploadedFileName");
            response.getWriter().println(fileName);
            
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
