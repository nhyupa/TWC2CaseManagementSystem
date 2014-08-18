/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "GenerateFINServlet", urlPatterns = {"/GenerateFINServlet"})
public class GenerateFINServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{
            doPost(request,response);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Random random = new Random();
        int randomInt =  random.nextInt();
        
        String firstInteger = Integer.toString(random.nextInt(10));
        String secondInteger = Integer.toString(random.nextInt(10));
        String thirdInteger = Integer.toString(random.nextInt(10));
        String fourthInteger = Integer.toString(random.nextInt(10));
        String fifthInteger = Integer.toString(random.nextInt(10));
        
        String FINInitial = "TWC2";
        String finalFINNumber = FINInitial + firstInteger + secondInteger + thirdInteger + fourthInteger + 
                fifthInteger;
        
        
        
        request.getSession().setAttribute("GeneratedFINNum", finalFINNumber);
        /*
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
          /*  out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + finalFINNumber + " " +  request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
        */
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
