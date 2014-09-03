<%-- 
    Document   : ViewRecord
    Created on : Jun 21, 2014, 12:33:17 PM
    Author     : Sion
--%>


<%@page import="src.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Beatrice.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>

        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
        <script>
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
       
            function onSubmit() {
                document.viewForm.action ="/TWC2-CaseManagementSystem/EditRecord.jsp"; //pass to view page
            }
          
           
             
        </script>
        <script src="holder.js"></script>

        <title>View Record</title>
    </head>
    <body style="font-family:arial;font-size:14px">
 <%
            // retrieve users from database    
            // ArrayList<Job> jobList = new ArrayList<Job>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();
            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            String jobKey = (String) session.getAttribute("jobKey");
            String probKey = (String) session.getAttribute("probKey");
            // get lsit of workers

            ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails((String) session.getAttribute("FIN"), jobKey);
            ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails((String) session.getAttribute("FIN"));

            CaseWorker caseWorker = null;
            InjuryDetail injuryDetail = null;
            if (caseWorkerDetails.size() != 0) {
                caseWorker = caseWorkerDetails.get(caseWorkerDetails.size() - 1);
            }
            if (injuryDetails.size() != 0) {
                injuryDetail = injuryDetails.get(injuryDetails.size() - 1);
            }

            String choice = null;
            String FIN = (String) session.getAttribute("FIN");
            
            if (request.getParameter("nickName")!=null){
            choice = (String)request.getParameter("nickName");
            } else if (request.getParameter("passportDetail")!=null){
            choice = (String)request.getParameter("passportDetail");
            } else if (request.getParameter("facePhoto")!=null){
            choice = (String)request.getParameter("facePhoto");
            } else if (request.getParameter("sgPhoneNumber")!=null){
            choice = (String)request.getParameter("sgPhoneNumber");
            } else if (request.getParameter("homeCountryPhoneNumber")!=null){
            choice = (String)request.getParameter("homeCountryPhoneNumber");
            } else if (request.getParameter("sgAddress")!=null){
            choice = (String)request.getParameter("sgAddress");
            } else if (request.getParameter("homeCountryAddress")!=null){
            choice = (String)request.getParameter("homeCountryAddress");
            } else if (request.getParameter("workersDigitalContacts")!=null){
            choice = (String)request.getParameter("workersDigitalContacts");
            } else if (request.getParameter("nextOfKin")!=null){
            choice = (String)request.getParameter("nextOfKin");
            } else if (request.getParameter("familyMember")!=null){
            choice = (String)request.getParameter("familyMember");
            } else if (request.getParameter("friendInSingapore")!=null){
            choice = (String)request.getParameter("friendInSingapore");
            } else if (request.getParameter("workersLanguage")!=null){
            choice = (String)request.getParameter("workersLanguage");
            } else if (request.getParameter("bankAccountDetails")!=null){
            choice = (String)request.getParameter("bankAccountDetails");
            } else if (request.getParameter("passDetails")!=null){
            choice = (String)request.getParameter("passDetails");
            } else if (request.getParameter("IPADetails")!=null){
            choice = (String)request.getParameter("IPADetails");
            } else if (request.getParameter("verbalAssurances")!=null){
            choice = (String)request.getParameter("verbalAssurances");
            } else if (request.getParameter("employmentContract")!=null){
            choice = (String)request.getParameter("employmentContract");
            } else if (request.getParameter("intermediaryAgent")!=null){
            choice = (String)request.getParameter("intermediaryAgent");
            } else if (request.getParameter("employerDetails")!=null){
            choice = (String)request.getParameter("employerDetails");
            } else if (request.getParameter("workplaceDetails")!=null){
            choice = (String)request.getParameter("workplaceDetails");
            } else if (request.getParameter("workHistory")!=null){
            choice = (String)request.getParameter("workHistory");
            } else if (request.getParameter("accommodationDuringWork")!=null){
            choice = (String)request.getParameter("accommodationDuringWork");
            } else if (request.getParameter("aggravatingIssue")!=null){
            choice = (String)request.getParameter("aggravatingIssue");
            } else if (request.getParameter("leadCaseworker")!=null){
            choice = (String)request.getParameter("leadCaseworker");
            } else if (request.getParameter("auxiliaryCaseworker")!=null){
            choice = (String)request.getParameter("auxiliaryCaseworker");
            } else if (request.getParameter("salaryRelatedHistory")!=null){
            choice = (String)request.getParameter("salaryRelatedHistory");
            } else if (request.getParameter("injuryHistory")!=null){
            choice = (String)request.getParameter("injuryHistory");
            } else if (request.getParameter("illnessHistory")!=null){
            choice = (String)request.getParameter("illnessHistory");
            } else if (request.getParameter("detailsHistoryOtherProblems")!=null){
            choice = (String)request.getParameter("detailsHistoryOtherProblems");
            } else if (request.getParameter("traffickingIndicators")!=null){
            choice = (String)request.getParameter("traffickingIndicators");
            } else if (request.getParameter("salaryClaimLodged")!=null){
            choice = (String)request.getParameter("salaryClaimLodged");
            } else if (request.getParameter("wicaClaimLodged")!=null){
            choice = (String)request.getParameter("wicaClaimLodged");
            } else if (request.getParameter("nonWicaMedClaim")!=null){
            choice = (String)request.getParameter("nonWicaMedClaim");
            } else if (request.getParameter("policeReport")!=null){
            choice = (String)request.getParameter("policeReport");
            } else if (request.getParameter("wicaStatus")!=null){
            choice = (String)request.getParameter("wicaStatus");
            } else if (request.getParameter("othComplaintLodged")!=null){
            choice = (String)request.getParameter("othComplaintLodged");
            } else if (request.getParameter("caseDiscussion")!=null){
            choice = (String)request.getParameter("caseDiscussion");
            } else if (request.getParameter("mcLightDutyStatus")!=null){
            choice = (String)request.getParameter("mcLightDutyStatus");
            } else if (request.getParameter("hospital")!=null){
            choice = (String)request.getParameter("hospital");
            } else if (request.getParameter("r2rAppts")!=null){
            choice = (String)request.getParameter("r2rAppts");
            } else if (request.getParameter("lawyerStatus")!=null){
            choice = (String)request.getParameter("lawyerStatus");
            } else if (request.getParameter("caseMilestoneNonCriminal")!=null){
            choice = (String)request.getParameter("caseMilestoneNonCriminal");
            } else if (request.getParameter("caseMilestoneCriminal")!=null){
            choice = (String)request.getParameter("caseMilestoneCriminal");
            } else if (request.getParameter("benefaction")!=null){
            choice = (String)request.getParameter("benefaction");
            } else if (request.getParameter("transferTJSRepatriation")!=null){
            choice = (String)request.getParameter("transferTJSRepatriation");
            } 
             
            /**
             * Start of the Worker complement *
             */
            /**
             * Get Worker Nicknames
             */
            
            ArrayList<String> workerNicknames = DBConnect.retrieveWorkerNicknames((String) session.getAttribute("FIN"));
            String nickName = null;
            if (choice != null && workerNicknames.size()!=0 && request.getParameter("nickName")!=null) {
                nickName = workerNicknames.get(Integer.parseInt(choice));
            }

            /**
             * Get Latest Photo & DateStamp of photo for Worker
             */
            ArrayList<WorkerPhoto> photos = DBConnect.retrieveWorkerPhotos(FIN);
            WorkerPhoto workerPhoto = null;
            if (choice != null&& photos.size()!=0 && request.getParameter("facePhoto")!=null) {
                workerPhoto = photos.get(Integer.parseInt(choice));
            }

            /**
             * Get Passport Details *
             */
            ArrayList<Passport> passportDetails = DBConnect.retrieveWorkerPassportDetails(FIN);
            Passport passport = null;
            if (choice != null && passportDetails.size()!=0 && request.getParameter("passportDetail")!=null) {
                passport = passportDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Contact Details *
             */
            ArrayList<WorkerSGContactDetails> contactDetails = DBConnect.retrieveWorkerContactDetails(FIN);
            WorkerSGContactDetails workerSGContactDetails = null;
            if (choice != null&& contactDetails.size()!=0 && request.getParameter("sgPhoneNumber")!=null) {
                workerSGContactDetails = contactDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Home Country Contact Details*
             */
            ArrayList<HomeCountryContactDetails> homeContactDetails = DBConnect.retrieveHomeCountryContactDetails(FIN);
            HomeCountryContactDetails homeCountryContactDetails = null;
            if (choice != null && homeContactDetails.size()!=0 && request.getParameter("homeCountryPhoneNumber")!=null) {
                homeCountryContactDetails = homeContactDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Singapore Address *
             */
            ArrayList<WorkerSgAddress> sgAddressDetail = DBConnect.retrieveSingaporeAddress(FIN);
            WorkerSgAddress workerSgAddress = null;
            if (choice != null&& sgAddressDetail.size()!=0 && request.getParameter("sgAddress")!=null) {
                workerSgAddress = sgAddressDetail.get(Integer.parseInt(choice));
            }

            /**
             * Get Home Country Address *
             */
            ArrayList<WorkerHomeCountryAddress> homeCountryAddressDetail = DBConnect.retrieveHomeCountryAddress(FIN);
            WorkerHomeCountryAddress workerHomeCountryAddress = null;
            if (choice != null&& homeCountryAddressDetail.size()!=0 && request.getParameter("homeCountryAddress")!=null) {
                workerHomeCountryAddress = homeCountryAddressDetail.get(Integer.parseInt(choice));
            }

            /**
             * Get Digital Contact Type *
             */
            ArrayList<WorkerDigitalContactType> digitalContactTypeDetails = DBConnect.retrieveDigitalContactType(FIN);
            WorkerDigitalContactType workerDigitalContactType = null;
            if (choice != null&& digitalContactTypeDetails.size()!=0 && request.getParameter("workersDigitalContacts")!=null) {
                workerDigitalContactType = digitalContactTypeDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Kin Details *
             */
            ArrayList<KinDetails> kinDetails = DBConnect.retrieveKinDetails(FIN);
            KinDetails kinDetail = null;
            if (choice != null&& kinDetails.size()!=0 && request.getParameter("nextOfKin")!=null) {
                kinDetail = kinDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Friend Details *
             */
            ArrayList<WorkerFriendDetails> workerFriendDetails = DBConnect.retrieveFriendDetails(FIN);
            WorkerFriendDetails workerFriendDetail = null;
            if (choice != null&& workerFriendDetails.size()!=0 && request.getParameter("friendInSingapore")!=null) {
                workerFriendDetail = workerFriendDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Language Details *
             */
            ArrayList<LanguageDetails> languageDetails = DBConnect.retrieveLanguageDetails(FIN);
            LanguageDetails languageDetail = null;
            if (choice != null&& languageDetails.size()!=0 && request.getParameter("workersLanguage")!=null) {
                languageDetail = languageDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Family Details *
             */
            ArrayList<FamilyDetails> familyDetails = DBConnect.retrieveFamilyWorkerDetails(FIN);
            FamilyDetails familyDetail = null;
            if (choice != null && familyDetails.size()!=0 && request.getParameter("familyMember")!=null) {
                familyDetail = familyDetails.get(Integer.parseInt(choice));
            }

            /**
             * Get Bank Account Details *
             */
            ArrayList<WorkerBankAccountDetails> bankAccountDetails = DBConnect.retrieveWorkerBankAccountDetails(FIN);
            WorkerBankAccountDetails workerBankAccountDetails = null;
            if (choice != null&& bankAccountDetails.size()!=0 && request.getParameter("bankAccountDetails")!=null) {
                workerBankAccountDetails = bankAccountDetails.get(Integer.parseInt(choice));
            }


            /**
             * End of the Worker complement *
             */
            /**
             * Start of the Job complement *
             */
            /**
             * Get Pass Details *
             */
            ArrayList<Pass> passDetail = DBConnect.getPassDetails(FIN);
            Pass pass = null;
            if (choice != null&& passDetail.size()!=0 && request.getParameter("passDetails")!=null) {
                pass = passDetail.get(Integer.parseInt(choice));
            }

            /**
             * Get IPA details *
             */
            ArrayList<IPA> ipaDetail = DBConnect.getIPADetails(FIN);
            IPA ipa = null;
            if (choice != null&& ipaDetail.size()!=0 && request.getParameter("IPADetails")!=null) {
                ipa = ipaDetail.get(Integer.parseInt(choice));
            }

            /**
             * Verbal Assurance Details *
             */
            ArrayList<VerbalAssurance> verbalAssuranceDetail = DBConnect.getVerbalAssuranceDetails(FIN);
            VerbalAssurance verbalAssurance = null;
            if (choice != null&& verbalAssuranceDetail.size()!=0 && request.getParameter("verbalAssurances")!=null) {
                verbalAssurance = verbalAssuranceDetail.get(Integer.parseInt(choice));
            }

            /**
             * Employment Contract Details *
             */
            ArrayList<EmploymentContract> employmentContractDetails = DBConnect.getEmploymentContractDetails(FIN);
            EmploymentContract employmentContract = null;
            if (choice != null&& employmentContractDetails.size()!=0 && request.getParameter("employmentContract")!=null) {
                employmentContract = employmentContractDetails.get(Integer.parseInt(choice));
            }

            /**
             * Agent Details *
             */
            ArrayList<Agent> agentDetails = DBConnect.getAgentDetails(FIN);
            Agent agent = null;
            if (choice != null&& agentDetails.size()!=0 && request.getParameter("intermediaryAgent")!=null) {
                agent = agentDetails.get(Integer.parseInt(choice));
            }

            /**
             * EmployerDetails *
             */
            ArrayList<Employer> employerDetails = DBConnect.getEmployerDetails(FIN);
            Employer employer = null;
            if (choice != null&& employerDetails.size()!=0 && request.getParameter("employerDetails")!=null) {
                employer = employerDetails.get(Integer.parseInt(choice));
            }

            /**
             * WorkplaceDetails *
             */
            ArrayList<Workplace> workplaceDetails = DBConnect.getWorkplaceDetails(FIN);
            Workplace workplace = null;
            if (choice != null&& workplaceDetails.size()!=0 && request.getParameter("workplaceDetails")!=null) {
                workplace = workplaceDetails.get(Integer.parseInt(choice));
            }

            /**
             * Work HistoryDetails*
             */
            ArrayList<WorkHistory> workHistoryDetails = DBConnect.getWorkHistoryDetails(FIN);
            WorkHistory workHistory = null;
            if (choice != null&& workHistoryDetails.size()!=0 && request.getParameter("workHistory")!=null) {
                workHistory = workHistoryDetails.get(Integer.parseInt(choice));
            }

            /**
             * Accomodation*
             */
            ArrayList<Accomodation> accomodationDetails = DBConnect.getAccomodationDetails(FIN);
            Accomodation accomodation = null;
            if (choice != null&& accomodationDetails.size()!=0 && request.getParameter("accommodationDuringWork")!=null) {
                accomodation = accomodationDetails.get(Integer.parseInt(choice));
            }


            /**
             * End of the Job complement *
             */
            /**
             * Start of the Problem complement *
             */
            /**
             * Aggravating Issue *
             */
            ArrayList<AggravatingIssue> aggraIssueDetails = DBConnect.getAggravatingIssueDetails(FIN, jobKey);
            AggravatingIssue aggravatingIssue = null;
            if (choice != null&& aggraIssueDetails.size()!=0 && request.getParameter("aggravatingIssue")!=null) {
                aggravatingIssue = aggraIssueDetails.get(Integer.parseInt(choice));
            }


            /**
             * Case Worker*
             */
            ArrayList<CaseWorker> caseWorkers = DBConnect.getCaseWorkerDetails(FIN, jobKey);
            CaseWorker thisCaseWorker = null;
            if (choice != null&& caseWorkers.size()!=0 && request.getParameter("leadCaseworker")!=null) {
                thisCaseWorker = caseWorkers.get(Integer.parseInt(choice));
            }


            /**
             * Auxillary Case Worker*
             */
            ArrayList<AuxillaryCaseWorker> auxCaseworkerDetails = DBConnect.getAuxCaseWorkerDetails(FIN, jobKey);
            AuxillaryCaseWorker auxillaryCaseWorker = null;
            if (choice != null&& auxCaseworkerDetails.size()!=0 && request.getParameter("auxiliaryCaseworker")!=null) {
                auxillaryCaseWorker = auxCaseworkerDetails.get(Integer.parseInt(choice));
            }

            /**
             * Salary Related History*
             */
            ArrayList<SalaryRelatedHistory> salRelatedHistoryDetails = DBConnect.getSalaryRelatedHistoryDetails(FIN);
            SalaryRelatedHistory salaryRelatedHistory = null;
            if (choice != null&& salRelatedHistoryDetails.size()!=0 && request.getParameter("salaryRelatedHistory")!=null) {
                salaryRelatedHistory = salRelatedHistoryDetails.get(Integer.parseInt(choice));
            }

            /**
             * Injury Details*
             */
            ArrayList<InjuryDetail> injurys = DBConnect.getInjuryDetails(FIN);
            InjuryDetail thisInjuryDetail = null;
            if (choice != null&& injurys.size()!=0 && request.getParameter("injuryHistory")!=null) {
                thisInjuryDetail = injurys.get(Integer.parseInt(choice));
            }

            /**
             * Illness Details*
             */
            ArrayList<IllnessHistory> illnessDetails = DBConnect.getIllnessDetails(FIN);
            IllnessHistory illnessHistory = null;
            if (choice != null&& illnessDetails.size()!=0 && request.getParameter("illnessHistory")!=null) {
                illnessHistory = illnessDetails.get(Integer.parseInt(choice));
            }

            /**
             * Other Problem Details *
             */
            ArrayList<OtherProblem> otherProblemDetails = DBConnect.getOtherProblemDetails(FIN);
            OtherProblem otherProblem = null;
            if (choice != null&& otherProblemDetails.size()!=0 && request.getParameter("detailsHistoryOtherProblems")!=null) {
                otherProblem = otherProblemDetails.get(Integer.parseInt(choice));
            }

            /**
             * Trafficking Indicator *
             */
            ArrayList<TraffickingIndicator> traffickingIndicators = DBConnect.getTraffickingIndicators(FIN);
            TraffickingIndicator traffickingIndicator = null;
            if (choice != null&& traffickingIndicators.size()!=0 && request.getParameter("traffickingIndicators")!=null) {
                traffickingIndicator = traffickingIndicators.get(Integer.parseInt(choice));
            }

            /**
             * Salary Claim Lodged *
             */
            ArrayList<SalaryClaimLodged> salaryClaimLodgedDetails = DBConnect.getSalaryClaimLodgedDetails(FIN);
            SalaryClaimLodged salaryClaimLodged = null;
            if (choice != null&& salaryClaimLodgedDetails.size()!=0 && request.getParameter("salaryClaimLodged")!=null) {
                salaryClaimLodged = salaryClaimLodgedDetails.get(Integer.parseInt(choice));
            }

            /**
             * Police Report Details *
             */
            ArrayList<PoliceReport> policeReportDetails = DBConnect.getPoliceReportDetails(FIN);
            PoliceReport policeReport = null;
            if (choice != null&& policeReportDetails.size()!=0 && request.getParameter("policeReport")!=null) {
                policeReport = policeReportDetails.get(Integer.parseInt(choice));
            }

            /**
             * Hospital Details *
             */
            ArrayList<Hospital> hospitalDetails = DBConnect.getHospitals(FIN);
            Hospital hospital = null;
            if (choice != null&& hospitalDetails.size()!=0 && request.getParameter("hospital")!=null) {
                hospital = hospitalDetails.get(Integer.parseInt(choice));
            }

            /**
             * MC Status *
             */
            ArrayList<MC> mcDetails = DBConnect.getMCs(FIN);
            MC mc = null;
            if (choice != null&& mcDetails.size()!=0 && request.getParameter("mcLightDutyStatus")!=null) {
                mc = mcDetails.get(Integer.parseInt(choice));
            }


            /**
             * Lawyer Status *
             */
            ArrayList<Lawyer> lawyerDetails = DBConnect.getLawyerDetails(FIN);
            Lawyer lawyer = null;
            if (choice != null&& lawyerDetails.size()!=0 && request.getParameter("lawyerStatus")!=null) {
                lawyer = lawyerDetails.get(Integer.parseInt(choice));
            }

            /**
             * Non Criminal Case Details *
             */
            ArrayList<NonCriminialCaseMilestone> nonCriminialCaseMilestoneDetails = dbConnect.getNonCriminalCaseDetails(FIN);
            NonCriminialCaseMilestone nonCriminialCaseMilestone = null;
            if (choice != null&& nonCriminialCaseMilestoneDetails.size()!=0 && request.getParameter("caseMilestoneNonCriminal")!=null) {
                nonCriminialCaseMilestone = nonCriminialCaseMilestoneDetails.get(Integer.parseInt(choice));
            }

            /**
             * Benefit Details *
             */
            ArrayList<Benefit> benefitDetails = DBConnect.getBenefitDetails(FIN);
            Benefit benefit = null;
            if (choice != null && benefitDetails.size()!=0 && request.getParameter("benefaction")!=null) {
                benefit = benefitDetails.get(Integer.parseInt(choice));
            }

            /**
             * Transfer T R *
             */
            ArrayList<TTR> ttrDetails = DBConnect.getTTRDetails(FIN);
            TTR ttr = null;
            if (choice != null && ttrDetails.size()!=0 && request.getParameter("transferTJSRepatriation")!=null) {
                ttr = ttrDetails.get(Integer.parseInt(choice));
            }

            /**
             * End of the Problem complement *
             */

        %>
        
        <%-- left side menus--%>
        <div class="leftDivision">
            <table border ="2" align="center" style="width:100%">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2" valign="center">
                        <div style="font-weight:bold; font-size:16px;margin-left:20px;">Worker Stub</div>
                        <div style="height:5px;"></div>
                        <div class="workername" style="margin-left:20px;"> 
                            <label style="margin:0">Name of worker</label>
                            <p class="form-control" style="left:25px; height:25px; width:80%;margin:0"> <%=workerName%> </p>
                        </div>
                        <div class="col-md-6" style="padding:0 0 10px 0;">
                            <div class="finnumber" style="margin-left:20px;"> 
                                <label style="margin:0"> FIN number</label>
                                <p class="form-control" style="left:25px;height:25px;margin:0"> <%=(String) session.getAttribute("FIN")%> </p>
                            </div>
                            <div class="phone" style="margin-left:20px;"> 
                                <label style="margin:0">Phone</label>
                                <p class="form-control" style="left:25px; height:25px;margin:0"> <%=DBConnect.getPhoneNumber((String)session.getAttribute("FIN"))%> </p>
                            </div>
                            <div style="height:30px;"></div>
                            <a href="ViewWorkerProfile.jsp" style="margin-left:20px">View full profile</a>
                            
                             
                        </div>

                       <%String pictureName = DBConnect.getWorkerPicture((String)session.getAttribute("FIN"));
                                 
                            %>
                        <div class="col-md-5">
                            <div style="height:5px;"></div>
                            <div class="thumbnail" style="width: 120px; height: 160px;"><img src ="WorkerFacePicture/<%=pictureName%>"></div>
                        </div>
                        
                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td class="container5">
                        <div class="headertitle"> View Record</div>
                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>

                        <div class="username-background" style="height:38%">
                            <strong class="word"> Hello <%= user%></strong>
                            </br>
                            <button type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                        </div>
                        <%
                            }
                        %>
                    </td>

                </tr>
                <%--2nd row--%>

                <tr>

                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                        <form id="viewForm" name="viewForm" role="form"  action ="#" method="post"> 

                            <!-- Start of Worker Compliment -->

                            <% String listToSee = (String) session.getAttribute("listToSee");
//request getAttribute
// request getParameter
                                if (listToSee.equalsIgnoreCase("nickName")) {%>
                                
                             
                             
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-10">

                                <label style="margin:0">Nickname of worker</label>
                                <p class="form-control" style="left:25px;width:50%;"><%=nickName%></p>
                            </div>

                            <%}%> 



                                      <!-- passport Details --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("passportDetails")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Passport details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Passport country</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=passport.getCountry()%> </p>
                                          <label>Passport number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=passport.getFIN_Number()%> </p>
                                          <label>Passport issue</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=passport.getPassportIssueDate()%> </p>
                                          <label>Passport expiry date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=passport.getPassportExpiryDate()%> </p>
                                      </div>
                                      <% }%>


                                      <!-- Face Photo --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("facePhoto")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Face photo</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">
                                          <label>Date stamp</label>
                                          <p class="form-control" style="left:25px;width:50%;"><%=workerPhoto.getDateStamp()%> </p>
                                          <label>Face pic 120 x 160 pixels</label>
                                          <div style="height:10px"> </div>
                                          <img src ="WorkerFacePicture/<%=workerPhoto.getPhotoName()%>" style="width:120px;height:160px;"/>
                                      </div> 
                                      <%}
                                      %>                    


                                      <!-- Sg phone number --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("sgPhoneNumber")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Sg phone number</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">
                                          <label>Sg phone number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerSGContactDetails.getPhoneNumber()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerSGContactDetails.getPhoneObsoleteDate()%> </p>
                                      </div>  
                                      <%}
                                      %> 


                                      <!-- Home ctry phone number --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("homeCountryPhoneNumber")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country phone number</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">
                                          <label>Home country phone number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=homeCountryContactDetails.getHomePhoneNumber()%> </p>
                                          <label>Owner of this number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=homeCountryContactDetails.getHomePhoneOwner()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=homeCountryContactDetails.getHomePhoneObsoleteDate()%> </p>   

                                      </div> 
                                      <%}%> 

                                      <!-- Worker's Sg address --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("sgAddress")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's Singapore address</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">


                                          <label>Worker address in Singapore</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerSgAddress.getSingaporeAddress()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerSgAddress.getSingaporeAddrObsoleteDate()%> </p>   

                                      </div> 

                                      <%}%> 



                                      <!-- Home ctry address --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("homeCountryAddress")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country address</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">
                                          <label>Worker address in home country</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerHomeCountryAddress.getHomeCountryAddress()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerHomeCountryAddress.getHomeCountryAddrObsolete()%> </p>   

                                      </div> 
                                      <%}%> 


                                      <!-- Worker's digital contacts --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("workersDigitalContacts")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's digital contacts</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Type of digital contact</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerDigitalContactType.getDigitalContactType()%> </p>
                                          <label>Email/QQ address or other detail</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerDigitalContactType.getDigitalRemarks()%> </p>   
                                          <label>Owner of electronic contact</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerDigitalContactType.getElectronicContactOwner()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerDigitalContactType.getObsoleteDate()%> </p>   

                                      </div>
                                      <%}%> 




                                      <!-- Next of kin --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("nextOfKin")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Next of kin</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">


                                          <label>Name of next of kin</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=kinDetail.getKinName()%> </p>
                                          <label>Relationship of next of kin to worker</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=kinDetail.getKinRelationship()%> </p>   
                                          <label>Phone number of next of kin</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=kinDetail.getKinPhone()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=kinDetail.getKinObsoleteDate()%> </p>   
                                      </div>
                                      <%}%> 





                                      <!-- Family member --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("familyMember")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Family member</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Name of family member</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=familyDetail.getFamilyMemberName()%> </p>
                                          <label>Relationship of family member to worker</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=familyDetail.getFamilyMemberRelationship()%> </p>   
                                          <label>Phone number of family member</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=familyDetail.getFamilyMemberPhoneNumber()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=familyDetail.getFamilyMemberObsolete()%> </p>   
                                      </div> 

                                      <%}%> 



                                      <!-- Friend in Singapore --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("friendInSingapore")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Friend in Singapore</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Name of friend in Singapore</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerFriendDetail.getFriendSgName()%> </p>
                                          <label>Phone number of friend</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerFriendDetail.getFriendSgPhone()%> </p>   
                                          <label>Relationship to worker</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerFriendDetail.getFriendSgRelationship()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerFriendDetail.getFriendSgObsoleteDate()%> </p>   


                                      </div> -->
                                      <%}%> 



                                      <!-- Worker's language --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("workersLanguage")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Worker's main language</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=languageDetail.getWorkerMainLanguage()%> </p>
                                          <label>Explain if above is 'Other'</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=languageDetail.getLanguageRemarks()%> </p>   
                                          <label>Spoken English standard</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=languageDetail.getSpokenEnglishStandard()%> </p>

                                      </div> 
                                      <%}%> 


                                      <!-- Bank account details --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("bankAccountDetails")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Bank account details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Bank account name</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerBankAccountDetails.getBankAccountName()%> </p>
                                          <label>Bank account number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerBankAccountDetails.getBankAccountNumber()%> </p>   
                                          <label>Bank name</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerBankAccountDetails.getBankName()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workerBankAccountDetails.getBankObsolete()%> </p>
                                      </div> 
                                      <%}%> 

                                      <!-- End of Worker Compliement -->

                                      <!----------------------------------------------------------------------------------------------------------------------->

                                      <!-- Start of Job Compliement -->


                                      <!-- Pass details --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("passDetails")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Pass details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Pass type</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=pass.getPassType()%> </p>
                                          <label>Pass number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=pass.getPassNumber()%> </p>   
                                          <label>Pass issue date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%= pass.getPassIssueDate()%> </p>
                                          <label>Date discovered to be obsolete</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%= pass.getPassObsoleteDate()%> </p>
                                      </div> 
                                      <%}%> 


                                      <!-- IPA details --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("IPADetails")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">IPA details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Workpass specified in IPA</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ipa.getWorkpassSpecified()%> </p>
                                          <label>IPA employer name</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ipa.getIpaEmployerName()%> </p>   
                                          <label>IPA basic monthly salary S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ipa.getIpaBasicMonthlySalary()%> </p>
                                          <label>IPA total deductions S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ipa.getIpaDeductions()%> </p>
                                      </div> 
                                      <%}%> 



                                      <!-- Verbal assurances pre-job --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("verbalAssurances")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Verbal assurances pre-job</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Name of giver of verbal assurances</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=verbalAssurance.getGiverName()%> </p>
                                          <label>Relationship of giver to worker or agent or employer</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=verbalAssurance.getGiverRelationship()%> </p>   
                                          <label>When verbal assurances given</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=verbalAssurance.getGivenDate()%> </p>
                                          <label>Where verbal assurances given</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=verbalAssurance.getGivenPlace()%> </p>
                                      </div> 
                                      <%}%> 


                                      <!-- Employment contract --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("employmentContract")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employment contract</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Contract date </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employmentContract.getContractDate()%> </p>
                                          <label>Where contract signed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employmentContract.getContractSignedPlace()%> </p>   
                                          <label>Relationship of opposite contracting party to job</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employmentContract.getContractRelationship()%> </p>
                                          <label>Basic salary</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employmentContract.getContractBasicSalary()%> </p>
                                      </div>
                                      <%}%>                      



                                      <!-- Intermediary agent --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("intermediaryAgent")) {
                                      %>

                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Intermediary agent</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Agent company name </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=agent.getAgentCompanyName()%> </p>
                                          <label>Location of agent</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=agent.getAgentLocation()%> </p>   
                                          <label>Amount paid to this agent S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=agent.getAgentAmountPaid()%> </p>
                                          <label>Amount owed to this agent at start of work S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=agent.getAgentAmountOwed()%> </p>

                                      </div>  
                                      <%}%>                      


                                      <!-- Employer details --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("employerDetails")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employer details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Official name of employer </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employer.getEmployerName()%> </p>
                                          <label>Employer address</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employer.getEmployerAddress()%> </p>   
                                          <label>Employer phone, email contacts</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employer.getEmployerContacts()%> </p>
                                          <label>Key persons in employer</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=employer.getEmployerKeyPersons()%> </p>


                                      </div>  
                                      <%}%>                      


                                      <!-- Workplace details  --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("workplaceDetails")) {
                                      %>

                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Workplace details</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Type of workplace </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workplace.getWorkplaceType()%> </p>
                                          <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workplace.getWorkplaceWhose()%> </p>   
                                          <label>Who directed worker to this workplace?</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workplace.getWorkplaceDirect()%> </p>
                                          <label>When start at workplace?</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workplace.getWorkplaceStart()%> </p>


                                      </div> 
                                      <%}%>          

                                      <!-- Work history  --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("workHistory")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Work history</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>How did worker get into the job defined in Job Profile?  </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workHistory.getGetWorkHow()%> </p>
                                          <label>Date arrived Singapore for this job</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workHistory.getSingaporeArrivalDate()%> </p>   
                                              <label>Is this first job in Singapore?</label>
                                              <p class="form-control" style="left:25px;width:50%;"> <%=workHistory.getFirstJobWhether()%> </p>
                                          <label>If not, year in which worker arrived in Singapore for first job</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=workHistory.getFirstJobArrival()%> </p>

                                      </div> 
                                      <%}%>           

                                      <!-- Work history  --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("accommodationDuringWork")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Accommodation During Work</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Accommodation provided by employer?  </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=accomodation.getAccomodationProvided()%> </p>
                                          <label>Type of accommodation</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=accomodation.getAccomodationType()%> </p>   
                                          <label>Cost charged by employer per month S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=accomodation.getEmployerMonthlyCost()%> </p>
                                          <label>Cost paid by self per month S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=accomodation.getSelfPaidCost()%> </p>

                                      </div> 
                                      <%}%>     


                                      <!-- End of Job Compliment -->

                                      <!-- Start of Problem Compliment -->

                                      <!-- Aggravating issue --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("aggravatingIssue")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Aggravating issue</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Aggravating issue</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=aggravatingIssue.getAggravatingIssue()%> </p>
                                          <label>Explain if at left is 'Other'</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=aggravatingIssue.getAggravatingIssueMore()%> </p>   
                                          <label>Monetary loss/value of this aggravating issue S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=aggravatingIssue.getMonetaryLoss()%> </p>
                                          <label>Remarks about aggravating issue</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=aggravatingIssue.getAggravatingIssueRemarks()%> </p>   

                                      </div>
                                      <% }%> 


                                      <!-- Lead caseworker --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("leadCaseworker")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Lead caseworker</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Lead caseworker</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisCaseWorker.getLeadCaseWorker()%> </p>
                                          <label>Start date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisCaseWorker.getCaseWorkerStartDate()%> </p>   
                                          <label>End date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisCaseWorker.getCaseWorkerEndDate()%> </p>

                                      </div>
                                      <%}%> 

                                      <!-- Auxiliary caseworker --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("auxiliaryCaseworker")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Auxiliary caseworker</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Auxiliary caseworker</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=auxillaryCaseWorker.getAuxCaseWorkerName()%> </p>
                                          <label>Start date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=auxillaryCaseWorker.getAuxStartDate()%> </p>   
                                          <label>End date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=auxillaryCaseWorker.getAuxEndDate()%> </p>

                                      </div>
                                      <%}%> 

                                      <!-- Salary & related history --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("salaryRelatedHistory")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Salary & related history</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Describe complaint about basic salary incorrect or not paid</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryRelatedHistory.getSalaryComplaint()%> </p>
                                          <label>Mode of salary payment</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryRelatedHistory.getSalaryPaymentMode()%> </p>   
                                          <label>Estimated total value of claim S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryRelatedHistory.getEstimatedTotalValueOfClaim()%> </p>
                                          <label>Estimated 12 months' value of claim S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryRelatedHistory.getEstimated12MonthsValueOfClaim()%> </p>
                                      </div>
                                      <%}%> 


                                      <!-- Injury history --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("injuryHistory")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Injury history</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of injury</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisInjuryDetail.getInjuryDate()%> </p>
                                          <label>Location where incident occurred</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisInjuryDetail.getInjuryLocation()%> </p>   
                                          <label>Body part(s) injured</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisInjuryDetail.getBodyPartsInjured()%> </p>
                                          <label>Where (clinic/hospital) initially treated</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=thisInjuryDetail.getLocationTreated()%> </p>
                                      </div>
                                      <%}%> 


                                      <!-- Illness history --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("illnessHistory")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Illness history</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>When illness began</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=illnessHistory.getIllnessBegan()%> </p>
                                          <label>When illness diagnosed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=illnessHistory.getDiagnosedIllness()%> </p>   
                                          <label>Nature of illness</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=illnessHistory.getIllnessNature()%> </p>
                                          <label>Does worker consider illness work-related?</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=illnessHistory.getWorkRelatedIllness()%> </p>
                                      </div>
                                      <%}%>


                                      <!-- Details/history other problems --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("detailsHistoryOtherProblems")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Details/history other problems</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Decribe details of problem if it's not salary/injury/illness</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=otherProblem.getOtherProblem()%> </p>
                                          <label>Estimated value of claim S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=otherProblem.getEstimatedValue()%> </p>   

                                      </div>
                                      <%}%>


                                      <!-- Trafficking indicators --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("traffickingIndicators")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Trafficking indicators</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date this assessment made</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=traffickingIndicator.getAssessmentDate()%> </p>
                                          <label>Name of TWC2 person making this assessment</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=traffickingIndicator.getAssessmentPerson()%> </p>   
                                          <label>Describe other indicators of trafficking complained of</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=traffickingIndicator.getTraffickingComplaint()%> </p>
                                          <label>Describe other indicators of trafficking observed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=traffickingIndicator.getOtherTrafficking()%> </p>
                                      </div>
                                      <%}%>      


                                      <!-- Salary claim lodged --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("salaryClaimLodged")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Salary claim lodged</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date claim lodged at MOM</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryClaimLodged.getSalClaimDate()%> </p>
                                          <label>Initial value of claim S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryClaimLodged.getSalClaimLoss()%> </p>   
                                          <label>Describe basis for amount claimed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=salaryClaimLodged.getSalClaimBasis()%> </p>

                                      </div>
                                      <%}%>      


                                      <!-- Wica claim lodged --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("wicaClaimLodged")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Wica claim lodged</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date claim lodged at MOM</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Wica ref number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>Wica insurance company</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Wica insurance policy number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>      


                                      <!-- Non-Wica med claim --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("nonWicaMedClaim")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Non-Wica med claim</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date MOM notified</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Initial value of claim S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>Insurance company</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Insurance policy number</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>      

                                      <!-- Police report --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("policeReport")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Police report</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date police report made</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=policeReport.getPoliceReportDate()%> </p>
                                          <label>Police station where report lodged</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=policeReport.getPoliceStation()%> </p>   
                                          <label>Accompanying TWC2 persons</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=policeReport.getAccompaniedPersons()%> </p>
                                          <label>Details of police report</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=policeReport.getPoliceReportDetails()%> </p>
                                      </div>
                                      <%}%>      


                                      <!-- Oth complaint lodged --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("othComplaintLodged")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Oth complaint lodged</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date other complaint lodged</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Agency/authority to whom complaint addressed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>This complaint lodged by</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>If TWC2 or third party, name of person lodging complaint?</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>      


                                      <!-- Case discussion --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("caseDiscussion")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Case discussion</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of discussion, assistance or information-receipt</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Mode/location of discussion, assistance or information-receipt</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>TWC2 person consulted, assisting or informed</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Topic of discussion or information received</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>      



                                      <!-- Hospital --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("hospital")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Hospital</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of update</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=hospital.getHopitalUpdateDate()%> </p>
                                          <label>Current hospital</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=hospital.getHospitalName()%> </p>   
                                          <label>Explain if at left is 'Other'</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=hospital.getHospitalMore()%> </p>
                                          <label>Department/doctor within hospital if known</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=hospital.getHospitalDoctor()%> </p>
                                      </div>
                                      <%}%>      


                                      <!-- MC/Light Duty status --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("mcLightDutyStatus")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;"> MC/Light Duty status</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of update</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=mc.getMCUpdate()%> </p>
                                          <label>Current MC or Light Duty status </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=mc.getMCStatus()%> </p>   
                                          <label>Latest known MC expiry date</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=mc.getMCExpDate()%> </p>
                                          <label>Cumulative MC days so far</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=mc.getMCDaysCulmul()%> </p>
                                      </div>
                                      <%}%>      

                                      <!-- R2R appts --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("r2rAppts")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">R2R appts</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of appointment</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>R2R first volunteer </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>R2R second volunteer</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Purpose of appointment</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>      

                                      <!-- Wica status --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("wicaStatus")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Wica status</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of update</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Wica status </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>Wica points</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Wica S$ compensation</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>    

                                      <!-- Lawyer status --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("lawyerStatus")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Lawyer status</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of update</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=lawyer.getLawyerUpdate()%> </p>
                                          <label>With this update, does worker have lawyer for this problem? </label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=lawyer.getLawyerUpdate()%> </p>   
                                          <label>Name of law firm</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=lawyer.getLawyerFirm()%> </p>
                                          <label>Remarks re his lawyer status</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=lawyer.getLawyerRemarks()%> </p>
                                      </div>
                                      <%}%>    


                                      <!-- Case milestone (non-criminal) --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("caseMilestoneNonCriminal")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (non-criminal)</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date milestone reached</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=nonCriminialCaseMilestone.getDateMilestoneReached()%> </p>
                                          <label>Milestone reached</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=nonCriminialCaseMilestone.getMilestoneReached()%> </p>   
                                          <label>Explain if at left is 'Other'</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=nonCriminialCaseMilestone.getMilestoneOther()%> </p>
                                          <label>Remarks re milestone reached</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=nonCriminialCaseMilestone.getMilestoneRemarks()%> </p>
                                      </div>
                                      <%}%>    


                                      <!-- Case milestone (criminal) --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("caseMilestoneCriminal")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (criminal)</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date milestone reached</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Milestone reached</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>   
                                          <label>Details of charges</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                          <label>Details of sentence</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <% %> </p>
                                      </div>
                                      <%}%>    

                                      <!-- Transfer, TJS, repatriation --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("transferTJSRepatriation")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Transfer, TJS, repatriation</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date of update</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ttr.getTtrUpdateDate()%> </p>
                                          <label>Transfer, TJS or repatriation status</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ttr.getTtrStatus()%> </p>   
                                          <label>Date of departure from Singapore</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ttr.getDepartureDate()%> </p>
                                          <label>Name of TJS or new employer</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=ttr.getNewEmployerName()%> </p>
                                      </div>
                                      <%}%>    


                                      <!-- Benefaction --> 
                                      <%
                                          if (listToSee.equalsIgnoreCase("benefaction")) {
                                      %>
                                      <div style="font-weight:bold;font-size:16px; margin-left:10px;">Benefaction</div>
                                      <div style="height:10px;"></div>
                                      <div class="row1 col-md-10">

                                          <label>Date benefit given</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=benefit.getBenefitGivenDate()%> </p>
                                          <label>Type of benefit</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=benefit.getBenefitType()%> </p>   
                                          <label>Purpose of or reason for benefit/refund</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=benefit.getBenefitPurpose()%> </p>
                                          <label>Value of benefit/refund S$</label>
                                          <p class="form-control" style="left:25px;width:50%;"> <%=benefit.getBenefitValue()%> </p>
                                      </div>
                                      <%}%>    



                                      <!-- End of Problem Compliment --> 
                    </td>
                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" class="container7"> <%--container7 --%>

                    </td>


                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3">
                        <div style="font-size:16px; font-weight:bold; margin-left:20px;">Job Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Name of employer</label>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"><%=DBConnect.getEmployer((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=DBConnect.getWorkpassType((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getOccupation((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getCommencedDate((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-8">
                                <a href="/TWC2-CaseManagementSystem/ViewJobProfile.jsp"  >View full profile</a>
                            </div>
                            <div class="col-md-4">
                                <a onclick="goBack()">Not this job</a>
                            </div>
                        </div> 
                        
                    </td>

                </tr>
                <%--5th row--%>
                <%ChiefProblem chiefProblem = DBConnect.getProblem((String) session.getAttribute("FIN"));%>
                <tr>
                    <td rowspan="2" class="container4" valign="top">
                        <div style="font-size:16px; font-weight:bold;color:black; margin-left:20px;">Problem Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Problem registration date</label>
                            <%if(chiefProblem != null){%>
                                <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"> <%=chiefProblem.getProblemRegDate()%></p>
                            <%} else {%>
                            
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Chief problem</label>
                            <%if(chiefProblem != null){%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=chiefProblem.getChiefProblem()%>  </p>
                             <%} else {%>
                            
                             <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                             <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Date of injury</label>
                            <%if(injuryDetail != null){%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=injuryDetail.getInjuryDate()%></p>
                            <%} else {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Lead caseworker</label>
                            <%if(caseWorker != null){%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=caseWorker.getLeadCaseWorker()%></p>
                            <%} else {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-7">
                                <a href="/TWC2-CaseManagementSystem/ViewProblemProfile.jsp" >View full profile</a>
                            </div>
                            <div class="col-md-5">
                                <a href="/TWC2-CaseManagementSystem/ListExistingProblemProfile.jsp">Not this problem</a>
                            </div>
                        </div> 

                    </td>


                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="2" class="container9">
                        <button type="submit" class="btn btn-primary btn-large" style="margin-left:10px;" onclick="onSubmit()"><span style="font-size:13px;">EDIT</span><br/> <span>this record</span></button>
                        <a type="submit" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ListRecords.jsp"><span style="font-size:13px;">LIST</span><br/> <span>records</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp" style="height:55px;text-align: center; line-height:40px;"><span style="font-size:13px;">CASE MENU</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
