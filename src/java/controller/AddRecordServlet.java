/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import src.DBConnect;

/**
 *
 * @author nhyupa.2010
 */
@WebServlet(name = "AddRecordServlet", urlPatterns = {"/AddRecordServlet"})
public class AddRecordServlet extends HttpServlet {
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        String jobKey = (String)request.getSession().getAttribute("jobKey");
        String probKey = (String)request.getSession().getAttribute("probKey");
        String FIN = (String)request.getSession().getAttribute("FIN");
        /** NickName **/
        String nickName = null;
        /**Passport Details **/
        String passportCountry = null;
        String passportNumber = null;
        String passportIssueDate = null;
        String passportExpiryDate = null;
        
        /**Sg Phone Number **/
        String phoneNumber = null;
        String phoneObsoleteDate = null;
        
        /** Home Country Phone Number */
        String homePhoneNumber = null;
        String homePhoneOwner = null;
        String homeNumObsoleteDate = null;
        
        /** SG Address */
        String workerSgAddr = null;
        String workerSgAddrObsoleteDate = null;
        
        /** Home Country Address */
        String homeCountryAddress = null; 
        String homeCountryAddrObsoleteDate = null; 
        
        /** Digital Contact Details **/
        String digitalContactType = null;
        String emailAddress = null;
        String electronicContactOwner = null;
        String electronicContactObsoleteDate =null;
        
        /**Kin Details **/
        String kinName = null;
        String kinRelationship = null;
        String kinPhoneNum = null;
        String kinPhoneNumObsoleteDate = null;
        
        /** Family Member Details **/
        String familyMemberName = null;
        String familyMemberRelationship = null;
        String familyMemberPhoneNumber = null;
        String familyMemberDateObsolete = null;
        
        /** Friend Details **/
        String friendName = null;
        String friendPhone = null;
        String workerRelationship = null;
        String friendObsoleteDate = null;
        
        /** Worker's Language **/
        String workerMainLanguage = null;
        String otherLanguage = null;
        String spokenEnglishStandard = null;
        
        /** Face Picture **/
        String itemName = null;
        String dateStamp = null;
        
        /** Bank Account Details **/
        String bankAccountName = null;
        String bankAccountNumber = null;
        String bankName = null;
        String bankObsoleteDate = null;
        
        /**
         * =============================
         * End Of Worker Complement
         * =============================
         */
            
        /**
         * =======================
         * Job Complement
         * =======================
         */
        /** Pass Details **/
        String passType = null;
        String passNumber = null;
        String passIssueDate = null;
        String passObsoleteDate = null;
        
        /**IPA Details **/
        String workpassSpecified = null;
        String ipaEmployerName = null;
        String ipaBasicMonthlySalary = null;
        String ipaTotalDeductions = null;
        
        /** Verbal Assurance **/
        String giverName = null;
        String giverRelationship = null;
        String givenDate = null;
        String givenPlace = null;
        
        /** Employment Contract **/
        String contractDate  = null;
        String contractSigned = null;
        String contractRelationship = null;
        String contractBasicSalary = null;
        
        /** Agent **/
        String agentCompanyName = null;
        String agentLocation = null;
        String agentAmountPaid = null;
        String agentMoneyOwed = null;
        
        /**Employer **/
        String employerName = null;
        String employerAddress = null;
        String employerContacts = null;
        String employerKey = null;
        
        /**Workplace **/
        String workplaceType = null;
        String workplaceWhose = null;
        String workplaceDirect = null;
        String workplaceStart = null;
        
        /**Work History**/
        String getWorkHow = null;
        String singaporeArrivalDate = null;
        String firstJobWhether = null;
        String firstJobArrival = null;
        
        /**Accomodation Details **/
        String accomodationProvided = null;
        String accomodationType = null;
        String employerMonthlyCost = null;
        String selfPaidCost = null;
        
        /** End of Job Complement **/
        
        /**
         * ==================
         * Problem Complement
         * ==================
         */
        
        /** Start of Problem Complement **/
        String aggravatingIssue = null;
        String aggravatingIssueOther = null;
        String monetaryloss = null;
        String aggravatingIssueRemarks = null;
        
        /** Lead Caseworker **/
        String leadCaseWorker = null;
        String startDate = null;
        String endDate = null;
        
        /**Auxillary CaseWorker**/
        String auxCaseWorkerName = null;
        String auxStartDate = null;
        String auxEndDate = null;
        
        /**Salary and Related Problem**/
        String basicSalaryComplaint = null;
        String salaryPaymentMode = null;
        String estimatedClaim = null;
        String estimated12monthsClaim = null;
        
        /**Injury Details**/
        String injuryDate = null;
        String incidentLocation = null;
        String bodyPartInjured = null;
        String locationTreated = null;
        
        /** Illness Details**/
        String illnessBegan = null;
        String diagnosedIllness = null;
        String illnessNature = null;
        String workRelatedIllness = null;
        
        /** Other Problems**/
        String otherProblems = null;
        String estimatedValueClaim = null;
        
        /** Trafficking Indicators **/
        String assessmentDate = null;
        String assessmentPerson = null;
        String traffickingComplaint = null;
        String otherTrafficking = null;
        
        /**Salary Claim Lodged **/
        String claimLodgedDate = null;
        String initialValueOfClaim = null;
        String amountClaimedDesc = null;
        
        /** Police Report Details **/
        String policeReportDate = null;
        String policeStation = null;
        String accompaniedPerson = null;
        String policeReportDetails = null;
        
        /** Hospital Details**/
        String updateDate = null;
        String currentHospital = null;
        String otherHospital = null;
        String doctor = null;
        
        
        /** MC status **/
        String MCUpdateDate = null;
        String currentMCStatus = null;
        String latestMCExpirydate = null;
        String cumulativeMCDays = null;
        
        /** Lawyer Status **/
        String lawyerUpdate = null;
        String haveLawyer = null;
        String lawFirmName = null;
        String lawyerStatusRemarks = null;
        
        /** Mile Stone **/
        String dateMilestoneReached = null;
        String milestoneReached = null;
        String milestoneOther = null;
        String milestoneRemarks = null;
        /**Benefaction **/
        String benefitGivenDate = null;
        String benefitType = null;
        String benefitPurpose = null;
        String benefitValue = null;
        
        /** TTR Status **/
        String ttrUpdateDate = null;
        String ttrStatus = null;
        String departureDate = null;
        String newEmployerName = null;
        
        try{
           
            DBConnect.connectDB();
           
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
                        if("nickName".equalsIgnoreCase(fieldName)){
                            nickName = value;
                        }
                        else if("country".equalsIgnoreCase(fieldName)){
                            passportCountry = value;
                        }
                        else if("passport_number".equalsIgnoreCase(fieldName)){
                            passportNumber = value;
                        }
                        else if("passport_issue".equalsIgnoreCase(fieldName)){
                            passportIssueDate = value;
                        }
                        else if("passport_expiry_date".equalsIgnoreCase(fieldName)){
                            passportExpiryDate = value;
                        }
                        else if("sgPhoneNumber".equalsIgnoreCase(fieldName)){
                            phoneNumber = value;
                        }
                        else if("phoneObsoleteDate".equalsIgnoreCase(fieldName)){
                            phoneObsoleteDate = value;
                        }
                        else if("homeCountryPhoneNum".equalsIgnoreCase(fieldName)){
                            homePhoneNumber =value;
                        }
                        else if("homePhoneNumOwner".equalsIgnoreCase(fieldName)){
                            homePhoneOwner = value;
                        }
                        else if("homeNumObsoleteDate".equalsIgnoreCase(fieldName)){
                            homeNumObsoleteDate = value;
                        }
                        else if("workerSgAddr".equalsIgnoreCase(fieldName)){
                            workerSgAddr = value;
                        }
                        else if("workerSgAddrObsoleteDate".equalsIgnoreCase(fieldName)){
                            workerSgAddrObsoleteDate = value;
                        }
                        else if("homeCountryAddress".equalsIgnoreCase(fieldName)){
                            homeCountryAddress = value;
                        }
                        else if("homeCountryAddrObsoleteDate".equalsIgnoreCase(fieldName)){
                            homeCountryAddrObsoleteDate =value;
                        }
                        else if("digitalContactType".equalsIgnoreCase(fieldName)){
                            digitalContactType = value;
                        }
                        else if("emailAddress".equalsIgnoreCase(fieldName)){
                            emailAddress = value;
                        }
                        else if("electronicContactOwner".equalsIgnoreCase(fieldName)){
                            electronicContactOwner = value;
                        }
                        else if("electronicContactObsoleteDate".equalsIgnoreCase(fieldName)){
                            electronicContactObsoleteDate = value;
                        }
                        else if("kinName".equalsIgnoreCase(fieldName)){
                            kinName = value;
                        }
                        else if("kinRelationship".equalsIgnoreCase(fieldName)){
                            kinRelationship = value;
                        }
                        else if("kinPhoneNum".equalsIgnoreCase(fieldName)){
                            kinPhoneNum = value;
                        }
                        else if("obsoleteDate".equalsIgnoreCase(fieldName)){
                            kinPhoneNumObsoleteDate = value;
                        }
                        else if("familyMemberName".equalsIgnoreCase(fieldName)){
                            familyMemberName = value;
                        }
                        else if("familyMemberRelationship".equalsIgnoreCase(fieldName)){
                            familyMemberRelationship = value;
                        }
                        else if("familyMemberPhoneNumber".equalsIgnoreCase(fieldName)){
                            familyMemberPhoneNumber = value;
                        }
                        else if("FamilyMemberDateObsolete".equalsIgnoreCase(fieldName)){
                            familyMemberDateObsolete = value;
                        }
                        else if("friendName".equalsIgnoreCase(fieldName)){
                            friendName = value;
                        }
                        else if("friendPhone".equalsIgnoreCase(fieldName)){
                            friendPhone = value;
                        }
                        else if("workerRelationship".equalsIgnoreCase(fieldName)){
                            workerRelationship = value;
                        }
                        else if("friendobsoleteDate".equalsIgnoreCase(fieldName)){
                            friendObsoleteDate = value;
                        }
                        else if("workerMainLanguage".equalsIgnoreCase(fieldName)){
                            workerMainLanguage  = value;
                        }
                        else if("otherLanaguage".equalsIgnoreCase(fieldName)){
                            otherLanguage = value;
                        }
                        else if("spokenEnglishStandard".equalsIgnoreCase(fieldName)){
                            spokenEnglishStandard = value;
                        }
                        else if("bankAccName".equalsIgnoreCase(fieldName)){
                            bankAccountName = value;
                        }
                        else if("bankAccNumber".equalsIgnoreCase(fieldName)){
                            bankAccountNumber = value;
                        }
                        else if("bankName".equalsIgnoreCase(fieldName)){
                            bankName = value;
                        }
                        else if("bankObsoleteDate".equalsIgnoreCase(fieldName)){
                            bankObsoleteDate = value;
                        }
                        else if("dateStamp".equalsIgnoreCase(fieldName)){
                            dateStamp = value;
                            response.getWriter().println("Date Stamp (assigning value) : " + dateStamp);
                        }
                        
                        /**
                         * =========================
                         * End Of Worker Complement
                         * =========================
                         */
                        else if("passType".equalsIgnoreCase(fieldName)){
                            
                            passType = value;
                        }
                        else if("passNumber".equalsIgnoreCase(fieldName)){
                            passNumber = value;
                        }
                        else if("passIssueDate".equalsIgnoreCase(fieldName)){
                            passIssueDate = value;
                        }
                        else if("passObsolete".equalsIgnoreCase(fieldName)){
                            passObsoleteDate = value;
                        }
                        else if("workpassSpecified".equalsIgnoreCase(fieldName)){
                            workpassSpecified = value;
                        }
                        else if("ipaEmployerName".equalsIgnoreCase(fieldName)){
                            ipaEmployerName = value;
                        }
                        else if("ipaBasicMonthlySalary".equalsIgnoreCase(fieldName)){
                            ipaBasicMonthlySalary = value;
                        }
                        else if("ipaTotalDeductions".equalsIgnoreCase(fieldName)){
                            ipaTotalDeductions = value;
                        }
                        else if("giverName".equalsIgnoreCase(fieldName)){
                            giverName = value;
                        }
                        else if("giverRelationship".equalsIgnoreCase(fieldName)){
                            giverRelationship = value;
                        }
                        
                        else if("givenDate".equalsIgnoreCase(fieldName)){
                            givenDate = value;
                        }
                        else if("givenPlace".equalsIgnoreCase(fieldName)){
                            givenPlace = value;
                        }
                        else if("contractDate".equalsIgnoreCase(fieldName)){
                            contractDate = value;
                        }
                        else if("contractSigned".equalsIgnoreCase(fieldName)){
                            contractSigned = value;
                        }
                        else if("contractRelationship".equalsIgnoreCase(fieldName)){
                            contractRelationship = value;
                        }
                        else if("contractBasicSalary".equalsIgnoreCase(fieldName)){
                            response.getWriter().println("inside iter.");
                            contractBasicSalary = value;
                            response.getWriter().println(value);
                        }
                        else if("agentCompanyName".equalsIgnoreCase(fieldName)){
                            agentCompanyName = value;
                        }
                        else if("agentLocation".equalsIgnoreCase(fieldName)){
                            agentLocation = value;
                        }
                        else if("agentAmountPaid".equalsIgnoreCase(fieldName)){
                            agentAmountPaid = value;
                        }
                        else if("agentMoneyOwed".equalsIgnoreCase(fieldName)){
                            agentMoneyOwed = value;
                        }
                        else if("employerName".equalsIgnoreCase(fieldName)){
                            employerName = value;
                        }
                        else if("employerAddress".equalsIgnoreCase(fieldName)){
                            employerAddress = value;
                        }
                        else if("employerContacts".equalsIgnoreCase(fieldName)){
                            employerContacts = value;
                        }
                        else if("employerKey".equalsIgnoreCase(fieldName)){
                            employerKey = value;
                        }
                        else if("workplaceType".equalsIgnoreCase(fieldName)){
                            workplaceType = value;
                            response.getWriter().println(workplaceType);
                        }
                        else if("workplaceWhose".equalsIgnoreCase(fieldName)){
                            workplaceWhose = value;
                        }
                        else if("workplaceDirect".equalsIgnoreCase(fieldName)){
                            workplaceDirect = value;
                        }
                        else if("workplaceStart".equalsIgnoreCase(fieldName)){
                            workplaceStart = value;
                        }
                        else if("getWorkHow".equalsIgnoreCase(fieldName)){
                            getWorkHow = value;
                        }
                        else if("singaporeArrivalDate".equalsIgnoreCase(fieldName)){
                            singaporeArrivalDate = value;
                        }
                        else if("firstJobWhether".equalsIgnoreCase(fieldName)){
                            firstJobWhether = value;
                        }
                        else if("firstJobArrival".equalsIgnoreCase(fieldName)){
                            firstJobArrival = value;
                        }
                        else if("accomodationProvided".equalsIgnoreCase(fieldName)){
                            accomodationProvided = value;
                        }
                        else if("accomodationType".equalsIgnoreCase(fieldName)){
                            accomodationType = value;
                        }
                        else if("employerMonthlyCost".equalsIgnoreCase(fieldName)){
                            employerMonthlyCost = value;
                        }
                        else if("selfPaidCost".equalsIgnoreCase(fieldName)){
                            selfPaidCost = value;
                        }
                        
                        /* Start of Problem Complement */
                        else if("aggravatingIssue".equalsIgnoreCase(fieldName)){
                            aggravatingIssue = value;
                        }
                        else if("aggravatingIssueOther".equalsIgnoreCase(fieldName)){
                            aggravatingIssueOther = value;
                        }
                        else if("monetaryloss".equalsIgnoreCase(fieldName)){
                            monetaryloss = value;
                        }
                        else if("aggravatingIssueRemarks".equalsIgnoreCase(fieldName)){
                            aggravatingIssueRemarks = value;
                        }
                        else if("leadCaseWorker".equalsIgnoreCase(fieldName)){
                            leadCaseWorker = value;
                        }
                        else if("caseWorkerStartDate".equalsIgnoreCase(fieldName)){
                            startDate = value;
                        }
                        else if("caseWorkerEndDate".equalsIgnoreCase(fieldName)){
                            endDate = value;
                        }
                        else if("auxCaseWorkerName".equalsIgnoreCase(fieldName)){
                            auxCaseWorkerName = value;
                        }
                        else if("auxStartDate".equalsIgnoreCase(fieldName)){
                            auxStartDate = value;
                        }
                        else if("auxEndDate".equalsIgnoreCase(fieldName)){
                            auxEndDate = value;
                        }
                        else if("basicSalaryComplaint".equalsIgnoreCase(fieldName)){
                            basicSalaryComplaint = value;
                        }
                        else if("salaryPaymentMode".equalsIgnoreCase(fieldName)){
                            salaryPaymentMode = value;
                        }
                        else if("estimatedClaim".equalsIgnoreCase(fieldName)){
                            estimatedClaim = value;
                        }
                        else if("estimated12monthsClaim".equalsIgnoreCase(fieldName)){
                            estimated12monthsClaim = value;
                        }
                        else if("injuryDate".equalsIgnoreCase(fieldName)){
                            injuryDate = value;
                        }
                        else if("incidentLocation".equalsIgnoreCase(fieldName)){
                            incidentLocation = value;
                        }
                        else if("bodyPartInjured".equalsIgnoreCase(fieldName)){
                            bodyPartInjured = value;
                        }
                        else if("locationTreated".equalsIgnoreCase(fieldName)){
                            locationTreated = value;
                        }
                        else if("illnessBegan".equalsIgnoreCase(fieldName)){
                            illnessBegan = value;
                        }
                        else if("diagnosedIllness".equalsIgnoreCase(fieldName)){
                            diagnosedIllness = value;
                        }
                        else if("illnessNature".equalsIgnoreCase(fieldName)){
                            illnessNature = value;
                        }
                        else if("workRelatedIllness".equalsIgnoreCase(fieldName)){
                            workRelatedIllness = value;
                        }
                        else if("assessmentDate".equalsIgnoreCase(fieldName)){
                            assessmentDate = value;
                        }
                        else if("assessmentPerson".equalsIgnoreCase(fieldName)){
                            assessmentPerson = value;
                        }
                        else if("traffickingComplaint".equalsIgnoreCase(fieldName)){
                            traffickingComplaint = value;
                        }
                        else if("otherTrafficking".equalsIgnoreCase(fieldName)){
                            otherTrafficking = value;
                        }
                        else if("otherProblems".equalsIgnoreCase(fieldName)){
                            otherProblems = value;
                        }
                        else if("estimatedValueClaim".equalsIgnoreCase(fieldName)){
                            estimatedValueClaim = value;
                        }
                        else if("claimLodgedDate".equalsIgnoreCase(fieldName)){
                            claimLodgedDate = value;
                        }
                        else if("initialValueOfClaim".equalsIgnoreCase(fieldName)){
                            initialValueOfClaim = value;
                        }
                        else if("amountClaimedDesc".equalsIgnoreCase(fieldName)){
                            amountClaimedDesc = value;
                        }
                        else if("updateDate".equalsIgnoreCase(fieldName)){
                            updateDate = value;
                        }
                        else if("currentHospital".equalsIgnoreCase(fieldName)){
                            currentHospital = value;
                        }
                        else if("otherHospital".equalsIgnoreCase(fieldName)){
                            otherHospital = value;
                        }
                        else if("doctor".equalsIgnoreCase(fieldName)){
                            doctor = value;
                        }
                        else if("MCUpdateDate".equalsIgnoreCase(fieldName)){
                            MCUpdateDate = value;
                        }
                        else if("currentMCStatus".equalsIgnoreCase(fieldName)){
                            currentMCStatus = value;
                        }
                        else if("latestMCExpirydate".equalsIgnoreCase(fieldName)){
                            latestMCExpirydate  = value;
                        }
                        else if("cumulativeMCDays".equalsIgnoreCase(fieldName)){
                            cumulativeMCDays = value;
                        }
                        else if("lawyerUpdate".equalsIgnoreCase(fieldName)){
                            lawyerUpdate = value;
                        }
                        else if("haveLawyer".equalsIgnoreCase(fieldName)){
                            haveLawyer = value;
                        }
                        else if("lawFirmName".equalsIgnoreCase(fieldName)){
                            lawFirmName = value;
                        }
                        else if("lawyerStatusRemarks".equalsIgnoreCase(fieldName)){
                            lawyerStatusRemarks = value;
                        }
                        else if("ttrUpdateDate".equalsIgnoreCase(fieldName)){
                            ttrUpdateDate = value;
                        }
                        else if("ttrStatus".equalsIgnoreCase(fieldName)){
                            ttrStatus = value;
                        }
                        else if("departureDate".equalsIgnoreCase(fieldName)){
                            departureDate = value;
                        }
                        else if("newEmployerName".equalsIgnoreCase(fieldName)){
                            newEmployerName = value;
                        }
                        else if("policeReportDate".equalsIgnoreCase(fieldName)){
                            policeReportDate = value;
                        }
                        else if("policeStation".equalsIgnoreCase(fieldName)){
                            policeStation = value;
                        }
                        else if("accompaniedPerson".equalsIgnoreCase(fieldName)){
                            accompaniedPerson = value;
                        }
                        else if("policeReportDetails".equalsIgnoreCase(fieldName)){
                            policeReportDetails = value;
                        }
                        else if("benefitGivenDate".equalsIgnoreCase(fieldName)){
                            benefitGivenDate = value;
                        }
                        else if("benefitType".equalsIgnoreCase(fieldName)){
                            benefitType = value;
                        }
                        else if("benefitPurpose".equalsIgnoreCase(fieldName)){
                            benefitPurpose = value;
                        }
                        else if("benefitValue".equalsIgnoreCase(fieldName)){
                            benefitValue = value;
                        }
                        else if("dateMilestoneReached".equalsIgnoreCase(fieldName)){
                            dateMilestoneReached = value;
                        }
                        else if("milestoneReached".equalsIgnoreCase(fieldName)){
                            milestoneReached = value;
                        }
                        else if("milestoneOther".equalsIgnoreCase(fieldName)){
                            milestoneOther = value;
                        }
                        else if("milestoneRemarks".equalsIgnoreCase(fieldName)){
                            milestoneRemarks = value;
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
                            response.getWriter().println("Item Name : " + itemName);
                            
                            
                        }
                    }
                }
            }   
            
            
            String url = "/TWC2-CaseManagementSystem/ListRecords.jsp";
            response.getWriter().println("assessmentDate " + updateDate);
            response.getWriter().println(currentHospital);
            response.getWriter().println(otherHospital);
            response.getWriter().println(doctor);
            
            if(dateMilestoneReached != null){
                response.getWriter().println("Inside Date Milestone Reached");
                DBConnect.insertMilestoneNonCriminalDetails(dateMilestoneReached, milestoneReached, milestoneOther,milestoneRemarks, FIN);
                request.getSession().setAttribute("milestoneReachedMsg","New record has been added.");
                response.sendRedirect(url); 
            }
            if(benefitGivenDate !=null){
                response.getWriter().println("Inside Benefit Given loop");
                DBConnect.insertBenefitDetails(benefitGivenDate, benefitType, benefitPurpose, benefitValue, FIN);
                request.getSession().setAttribute("benefitMsg","New record has been added.");
                response.sendRedirect(url); 
            }
            if(policeReportDate != null){
                response.getWriter().println("Inside police report loop");
                DBConnect.insertPoliceReportDetails(policeReportDate, policeStation, accompaniedPerson, policeReportDetails, FIN);
                request.getSession().setAttribute("policeReportMsg","New record has been added.");
                response.sendRedirect(url); 
            }
            if(ttrUpdateDate != null){
                response.getWriter().println("Inside Ttr loop");
                DBConnect.insertTtrDetails(ttrUpdateDate, ttrStatus, departureDate, newEmployerName, FIN);
                request.getSession().setAttribute("ttrMsg","New record has been added.");
                response.sendRedirect(url); 
            }
            if(lawyerUpdate != null){
               response.getWriter().println("Inside Lawyer Loop");
               DBConnect.insertLawyerDetails(lawyerUpdate, haveLawyer, lawFirmName, lawyerStatusRemarks, FIN);
               request.getSession().setAttribute("lawyerMsg","New record has been added.");
               response.sendRedirect(url); 
            }
            if(MCUpdateDate != null){
               response.getWriter().println("Inside MC Loop");
               DBConnect.insertMCDetails(MCUpdateDate, currentMCStatus, latestMCExpirydate, cumulativeMCDays, FIN);
               request.getSession().setAttribute("MCmsg","New record has been added.");
               response.sendRedirect(url); 
            }
            if(updateDate != null){
               response.getWriter().println("Inside Hospital Loop");
               DBConnect.insertHospitalDetails(updateDate, currentHospital, otherHospital, doctor, FIN);
               request.getSession().setAttribute("hospitalMsg","New record has been added.");
               response.sendRedirect(url); 
            }
            if(claimLodgedDate != null){
               response.getWriter().println("Inside Claim Lodged Loop");
               DBConnect.insertSalaryClaimLodgedDetails(claimLodgedDate, initialValueOfClaim,amountClaimedDesc, FIN);
               request.getSession().setAttribute("salaryClaimLodgeMsg","New record has been added.");
               response.sendRedirect(url); 
            }
            if(otherProblems != null) {
               response.getWriter().println("Inside Other Problems Loop");
               DBConnect.insertOtherProblemDetails(otherProblems, estimatedValueClaim, FIN);
               request.getSession().setAttribute("otherProblemsMsg","New record has been added.");
               response.sendRedirect(url); 
            }
            if(assessmentDate != null){
               response.getWriter().println("Inside Assessment Loop");
               DBConnect.insertTraffickingIndicatorsDetails(assessmentDate, assessmentPerson, traffickingComplaint, otherTrafficking, FIN);
               request.getSession().setAttribute("assessmentMsg","New record has been added.");
               response.sendRedirect(url);
            }
            if(illnessBegan != null) {
               response.getWriter().println("Inside Illness Loop");
               DBConnect.insertIllnessDetails(illnessBegan, diagnosedIllness, illnessNature, workRelatedIllness, FIN);
               request.getSession().setAttribute("illnessMsg","New record has been added.");
               response.sendRedirect(url);
            }
            if(incidentLocation != null){
               response.getWriter().println("Inside injury Loop");
               DBConnect.insertInjuryDetails(injuryDate, incidentLocation, bodyPartInjured, locationTreated, FIN);
               request.getSession().setAttribute("injuryMsg","New record has been added.");
               response.sendRedirect(url);
            }
            if(basicSalaryComplaint != null){
                response.getWriter().println("Inside Aux Case Worker Loop");
                DBConnect.insertBasicSalaryComplaintDetails(basicSalaryComplaint, salaryPaymentMode, estimatedClaim,estimated12monthsClaim, FIN, jobKey, probKey);
                request.getSession().setAttribute("basicSalaryComplaintMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(auxCaseWorkerName != null){
                response.getWriter().println("Inside Aux Case Worker Loop");
                DBConnect.insertAuxillaryCaseWorkerDetails(auxCaseWorkerName, auxStartDate, auxEndDate, FIN, jobKey, probKey);
                request.getSession().setAttribute("auxCaseWorkerName","New record has been added.");
                response.sendRedirect(url);
            }
            if(leadCaseWorker != null){
                response.getWriter().println("Inside Lead Case Worker Loop");
                DBConnect.insertLeadCaseWorkerDetails(leadCaseWorker, startDate, endDate, FIN, jobKey, probKey);
                request.getSession().setAttribute("leadCaseWorkerMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(aggravatingIssue != null){
                response.getWriter().println("Inside Aggravating Issue Loop");
                DBConnect.insertAggravatingIssueDetails(aggravatingIssue, aggravatingIssueOther, monetaryloss, aggravatingIssueRemarks, FIN, jobKey, probKey);
                request.getSession().setAttribute("aggravatingIssueMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            
            if(itemName != null){
                response.getWriter().println("Inside Picture Loop");
                response.getWriter().println(itemName);
                response.getWriter().println(dateStamp);
                DBConnect.insertWorkerImage(itemName, dateStamp, FIN);
                request.getSession().setAttribute("pictureMsg","New photo has been added.");
                response.sendRedirect(url);
                
            }
            if(accomodationProvided != null){
                response.getWriter().println("Inside WorkHistory Loop");
                DBConnect.insertAccomodationDetails(accomodationProvided, accomodationType, employerMonthlyCost, selfPaidCost, FIN, jobKey);
                request.getSession().setAttribute("accomodationMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(getWorkHow !=null){
                response.getWriter().println("Inside WorkHistory Loop");
                
                DBConnect.insertWorkHistoryDetails(getWorkHow, singaporeArrivalDate, firstJobWhether,firstJobArrival, FIN, jobKey);
                request.getSession().setAttribute("workHistoryMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(workplaceType !=null){
                response.getWriter().println(FIN.length());
                FIN = FIN.trim();
                FIN = FIN.replaceAll("\\s", "");
                response.getWriter().println(FIN);
                response.getWriter().println("Inside Workplace Loop");
                DBConnect.insertWorkplaceDetails(workplaceType, workplaceWhose, workplaceDirect,workplaceStart, FIN, jobKey);
                request.getSession().setAttribute("workplaceMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(employerName != null){
                response.getWriter().println("Inside Employer Loop");
                
                DBConnect.insertEmployerDetails(employerName, employerAddress, employerContacts,employerKey, FIN, jobKey);
                request.getSession().setAttribute("employerMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(agentCompanyName != null){
                response.getWriter().println("Inside Agent Company Loop");
                double formattedAgentAmtPaid = Double.parseDouble(agentAmountPaid);
                double formattedAgentAmtOwed = Double.parseDouble(agentMoneyOwed);
                DBConnect.insertAgentDetails(agentCompanyName, agentLocation, formattedAgentAmtPaid,formattedAgentAmtOwed, FIN, jobKey);
                request.getSession().setAttribute("agentMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(contractBasicSalary !=null){
                response.getWriter().println("Inside employment contract Loop");
               
                DBConnect.insertEmploymentContractDetails(contractDate, contractSigned, contractRelationship,contractBasicSalary, FIN, jobKey);
                request.getSession().setAttribute("employmentContractMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(giverName !=null){
                response.getWriter().println("Inside Giver Loop");
                response.getWriter().println(giverName);
                DBConnect.insertVerbalAssuranceDetails(giverName, giverRelationship, givenDate,givenPlace, FIN, jobKey);
                request.getSession().setAttribute("verbalMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(workpassSpecified!=null){
                response.getWriter().println("Inside IPA Loop");
                double formattedIPADeductions = Double.parseDouble(ipaTotalDeductions);
                DBConnect.insertIPADetails(workpassSpecified,ipaEmployerName, ipaBasicMonthlySalary, formattedIPADeductions, FIN,jobKey);
                request.getSession().setAttribute("ipaMsg","New record has been added.");
                response.sendRedirect(url);
            }
           
            if(passType != null){
                response.getWriter().println("Inside Pass Loop");
                
                DBConnect.insertPassDetails(passType, passNumber, passIssueDate,passObsoleteDate, FIN, jobKey);
                request.getSession().setAttribute("passMsg","New record has been added.");
                response.sendRedirect(url);
            }
            /**
             * ============================
             * Start of Worker Complement
             * ============================
             */
            if(bankAccountName != null){
                response.getWriter().println("Inside Bank Account Loop");
                DBConnect.insertBankAccDetails(bankAccountName,bankAccountNumber,bankName,bankObsoleteDate,FIN);
                request.getSession().setAttribute("bankAccMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(workerMainLanguage != null){
                response.getWriter().println("Inside Language Loop");
                DBConnect.insertLanguageDetails(workerMainLanguage,spokenEnglishStandard,otherLanguage, FIN);
                request.getSession().setAttribute("languageMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(friendName != null){
                response.getWriter().println("Inside Friend Loop");
                DBConnect.insertFriendDetails(friendName,friendPhone, workerRelationship, friendObsoleteDate, FIN);
                request.getSession().setAttribute("friendMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(familyMemberName != null){
                response.getWriter().println("Inside Family Loop");
                DBConnect.insertFamilyDetails(familyMemberName,familyMemberRelationship,familyMemberPhoneNumber,familyMemberDateObsolete, FIN );
                request.getSession().setAttribute("familyMemberMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(kinName != null){
                response.getWriter().println("Inside Kin Details Loop");
                DBConnect.insertKinDetails(kinName,kinRelationship,kinPhoneNum,kinPhoneNumObsoleteDate, FIN );
                request.getSession().setAttribute("kinMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(digitalContactType != null){
                response.getWriter().println("Inside Digital Contact Type Loop");
                DBConnect.insertDigitalContact(digitalContactType,emailAddress,electronicContactOwner,electronicContactObsoleteDate, FIN );
                request.getSession().setAttribute("digitalContactTypeMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(homeCountryAddress !=null){
                response.getWriter().println("Inside Home Country Address Loop");
                DBConnect.insertHomeCountryAddress(homeCountryAddress, homeCountryAddrObsoleteDate, FIN);
                request.getSession().setAttribute("homeCountryAddressMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(workerSgAddr != null){
                response.getWriter().println("Inside SG Address Loop");
                response.getWriter().println(workerSgAddr);
                response.getWriter().println(workerSgAddrObsoleteDate);
                response.getWriter().println(FIN);
                DBConnect.insertSgAddress(workerSgAddr, workerSgAddrObsoleteDate, FIN);
                request.getSession().setAttribute("SGAddressMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(homePhoneNumber != null){
                response.getWriter().println("Inside homePhoneNumber Loop");
                DBConnect.insertHomeCountryContactDetails(homePhoneNumber, homePhoneOwner, FIN, homeNumObsoleteDate);
                request.getSession().setAttribute("homeCountryPhoneMsg","New record has been added.");
                response.sendRedirect(url);
            }
            if(passportCountry != null){
                response.getWriter().println("Inside Passport Loop");
                DBConnect.insertPassportDetails(passportCountry, passportNumber, FIN, passportIssueDate, passportExpiryDate);
                request.getSession().setAttribute("passportMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(phoneNumber != null){
                DBConnect.InsertWorkerPhoneDetails(FIN, phoneNumber, phoneObsoleteDate);
                request.getSession().setAttribute("sgPhoneMsg","New record has been added.");
                response.sendRedirect(url);
            }
            
            if(nickName != null){
                DBConnect.insertNickName(nickName, FIN);
                request.getSession().setAttribute("nickNameMsg","New record has been added.");
                response.sendRedirect(url);
            }
      
        }catch(Exception err){
            System.out.println("Error: " +  err);
        }
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
