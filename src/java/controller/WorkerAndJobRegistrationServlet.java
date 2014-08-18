/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import src.ChiefProblem;
import src.DBConnect;
import src.JobProfile;
import src.Worker;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "WorkerAndJobRegistrationServlet", urlPatterns = {"/WorkerAndJobRegistrationServlet"})
public class WorkerAndJobRegistrationServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
            
            /*Worker Attributes */
            String FIN_Num = null;
            String workerRegistrationDate = null;
            String createdFor  = null;
            String socialWorkerName = (String)request.getSession().getAttribute("createdBy");
            String workerName = null;
            String gender = null;
            String nationality = null;
            String otherNationality = null;
            String dateOfBirth = null;
            String itemName = null;
            String fileName = null;
            
            /*Job Attributes */
            String employerName = null;
            String workPass = null;
            String otherWorkpass = null;
            String jobSector = null;
            String otherJobSector = null;
            String occupation = null;
            String jobCommenced = null;
            String jobEnd = null;
            String TJS = null;
            String remarks = null;
            
            /** Problem Attributes **/
            String problemRegDate = null;
            String chiefProblem = null;
            String otherProblem = null;
            String problemRemarks = null;
            
            /**FileName**/
           
            ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iter = upload.getItemIterator(request);
            boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
            if(isMultiPart) {
                while(iter.hasNext()) {
                    FileItemStream item = iter.next();
                    if(item.isFormField()){
                        // do field specific process
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b =  new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        if("FIN".equalsIgnoreCase(fieldName)){
                            FIN_Num = value;
                        }
                        else if("workerRegDate".equalsIgnoreCase(fieldName)){
                            workerRegistrationDate = value;
                            
                        }
                        
                        else if("createdFor".equalsIgnoreCase(fieldName)){
                            createdFor = value;
                        }
                        
                        else if("workerName".equalsIgnoreCase(fieldName)){
                            workerName = value;
                            
                        }
                        else if("gender".equalsIgnoreCase(fieldName)){
                            gender = value;
                            
                        }
                        else if("nationality".equalsIgnoreCase(fieldName)){
                            nationality = value;
                            
                        }
                        else if("otherNationality".equalsIgnoreCase(fieldName)){
                            otherNationality = value;
                        }
                        
                        else if("dateOfBirth".equalsIgnoreCase(fieldName)){
                            dateOfBirth = value;
                        }
                        
                        else if("employerName".equalsIgnoreCase(fieldName)){
                            employerName = value;
                        }
                        
                        else if("workpass".equalsIgnoreCase(fieldName)){
                            workPass = value;
                        }
                        
                        else if("otherWorkpass".equalsIgnoreCase(fieldName)){
                            otherWorkpass =  value;
                        }
                        
                        else if("job sector".equalsIgnoreCase(fieldName)){
                            jobSector = value;
                        }
                        
                        else if("otherJobSector".equalsIgnoreCase(fieldName)){
                            otherJobSector = value;
                        }
                        
                        else if("occupation".equalsIgnoreCase(fieldName)){
                            occupation = value;
                        }
                        
                        else if("jobCommenced".equalsIgnoreCase(fieldName)){
                            jobCommenced = value;
                        }
                        
                        else if("jobEnded".equalsIgnoreCase(fieldName)){
                            jobEnd = value;
                        }
                        
                        else if("TJSJob".equalsIgnoreCase(fieldName)){
                            TJS = value;
                        }
                        
                        else if("jobRemarks".equalsIgnoreCase(fieldName)){
                            remarks = value;
                        }
                        
                        else if("fileName".equalsIgnoreCase(fieldName)){
                            fileName = value;
                        }
                        else if("problemRegDate".equalsIgnoreCase(fieldName)){
                            problemRegDate = value;
                        }
                        else if("chiefProblem".equalsIgnoreCase(fieldName)){
                            chiefProblem = value;
                        }
                        
                        else if("otherProblem".equalsIgnoreCase(fieldName)){
                            otherProblem = value;
                        }
                        else if("problemRemarks".equalsIgnoreCase(fieldName)){
                            problemRemarks = value;
                        }
                        
                        else{
                            
                        }
                    }
                    
                    else{
                        String path = getServletContext().getRealPath("/");
                        String finalPath = getServletContext().getContextPath();
                        String filePath =getServletContext().getInitParameter("WorkerImage-Upload");
                        
                        itemName = FileUpload.retrieveItemName(path,item);
                        if(FileUpload.processFile(filePath,item)){      
                        }
                    }   
                }
            }
           
            
            String dateFormatString = "T00:00:00";
            String formattedWorkerRegistrationDate  = workerRegistrationDate + dateFormatString;
            String formattedDateOfBirth = dateOfBirth + dateFormatString;
            response.getWriter().println("WorkerRegistration Date : " + workerRegistrationDate);
            response.getWriter().println("File Name : " + itemName);
            
           
            Worker worker  = new Worker(FIN_Num,formattedWorkerRegistrationDate,createdFor,socialWorkerName,workerName,gender,nationality,otherNationality,formattedDateOfBirth);
            
            response.getWriter().println("Worker FIN_Num : " + FIN_Num);
            response.getWriter().println("Registration Date : " + formattedWorkerRegistrationDate);
            response.getWriter().println("Created For : " + createdFor);
            response.getWriter().println("Social worker name : " +  socialWorkerName);
            response.getWriter().println("Worker name ; " + workerName);
            response.getWriter().println("Gender : " + gender);
            response.getWriter().println("Nationality : " + nationality);
            response.getWriter().println("Other Nationality : " + otherNationality);
            response.getWriter().println("Date of Birth : " + formattedDateOfBirth);
            
            try{
                
                DBConnect.connectDB();
                //Insert Worker details into tbl_worker
                DBConnect.createWorker(worker);
                //Insert photo into tbl_worker_complement
                response.getWriter().println("Item Name length : " + itemName.length());
                if(itemName.length() != 0){
                    DBConnect.insertPhoto(itemName, FIN_Num);
                }
            }catch(Exception err) {
                response.getWriter().println("Error : " + err);
            }
            
             Random random = new Random();
        int randomInt =  random.nextInt();
        
        String firstInteger = Integer.toString(random.nextInt(10));
        String secondInteger = Integer.toString(random.nextInt(10));
        String thirdInteger = Integer.toString(random.nextInt(10));
        String fourthInteger = Integer.toString(random.nextInt(10));
        String fifthInteger = Integer.toString(random.nextInt(10));
        
        String jobKey = firstInteger + secondInteger + thirdInteger + fourthInteger + fifthInteger;
        
            JobProfile job = new JobProfile(FIN_Num, jobKey,employerName,
                    workPass, otherWorkpass,jobSector, otherJobSector,occupation,jobCommenced,jobEnd,TJS,remarks);
            
            
            response.getWriter().println(employerName);
            response.getWriter().println(workPass);
            response.getWriter().println(otherWorkpass);
            response.getWriter().println(jobSector);
            response.getWriter().println(otherJobSector);
            response.getWriter().println(occupation);
            response.getWriter().println(jobCommenced);
            response.getWriter().println(jobEnd);
            response.getWriter().println(TJS);
            response.getWriter().println(remarks);
            
            try{
                DBConnect.createJob(job);
            }catch(Exception err){
                System.out.println("Error : " + err);
            }
            
            
            /** Chief Problem **/
            ChiefProblem problem = new ChiefProblem(jobKey,problemRegDate,chiefProblem,otherProblem,problemRemarks,FIN_Num);
            DBConnect.createProblem(problem);
            
            request.getSession().setAttribute("workerRegSuccessMsg","Worker has been created.");
            String url = "/TWC2-CaseManagementSystem/CreateProfiles.jsp";
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
