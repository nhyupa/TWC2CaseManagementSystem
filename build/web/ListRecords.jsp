<%-- 
    Document   : ListExisitingJobProfile
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
                //  document.listForm.action ="/TWC2-CaseManagementSystem/ViewRecord.jsp"; //pass to view page
                document.getElementById('listForm').action="/TWC2-CaseManagementSystem/ViewRecord.jsp"; //pass to view page
            }
          
           
             
        </script>
        <script src="holder.js"></script>
        
        <title>List Records</title>
    </head>
    <body style="font-family:arial;font-size:14px">
        
        <%
            // retrieve users from database    
            // ArrayList<Job> jobList = new ArrayList<Job>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();
            String FIN = (String)session.getAttribute("FIN");
           
            /**
            if(session.getAttribute("FIN") != null){
              
                FIN = (String) session.getAttribute("FIN");
            }
            if(session.getAttribute("FIN_Number") !=null) {
                FIN = (String)session.getAttribute("FIN_Number");
            }
           **/
            String workerName = DBConnect.getWorkername(FIN);
            String phoneNumber = null;
            
            
            /** Problem Stub **/
            
            
            
            
            // get lsit of workers
            /**Get Worker Nicknames */
            ArrayList<String> workerNicknames = DBConnect.retrieveWorkerNicknames(FIN);
           
            
            /** Get Latest Photo & DateStamp of photo for Worker */
            ArrayList<WorkerPhoto> photos = DBConnect.retrieveWorkerPhotos(FIN);
            
            /** Get Passport Details **/
            ArrayList<Passport> passportDetails = DBConnect.retrieveWorkerPassportDetails(FIN);
            
            /** Get Contact Details **/
            ArrayList<WorkerSGContactDetails> contactDetails = DBConnect.retrieveWorkerContactDetails(FIN);
            
            /** Get Home Country Contact Details**/
            ArrayList<HomeCountryContactDetails> homeContactDetails = DBConnect.retrieveHomeCountryContactDetails(FIN);
            
            /** Get Singapore Address **/
            ArrayList<WorkerSgAddress> sgAddressDetail = DBConnect.retrieveSingaporeAddress(FIN);
           
            /** Get Home Country Address **/
            ArrayList<WorkerHomeCountryAddress> homeCountryAddressDetail = DBConnect.retrieveHomeCountryAddress(FIN);
            
            /** Get Digital Contact Type **/
            ArrayList<WorkerDigitalContactType> digitalContactTypeDetails = DBConnect.retrieveDigitalContactType(FIN);
            /** Get Kin Details **/
            ArrayList<KinDetails> kinDetails = DBConnect.retrieveKinDetails(FIN);
           
            /** Get Friend Details **/
            ArrayList<WorkerFriendDetails> workerFriendDetails = DBConnect.retrieveFriendDetails(FIN);
          
            /** Get Language Details **/
            ArrayList<LanguageDetails> languageDetails = DBConnect.retrieveLanguageDetails(FIN);
            
            /** Get Family Details **/
            ArrayList<FamilyDetails> familyDetails = DBConnect.retrieveFamilyWorkerDetails(FIN);
            
            /** Get Bank Account Details **/
            ArrayList<WorkerBankAccountDetails> bankAccountDetails = DBConnect.retrieveWorkerBankAccountDetails(FIN);
           
            /*
            ** Job Complement 
             */
            /** Get Pass Details **/
            ArrayList<Pass> passDetail = DBConnect.getPassDetails(FIN);
            
            /** Get IPA details **/
            ArrayList<IPA> ipaDetail = DBConnect.getIPADetails(FIN);
            
            /**Verbal Assurance Details **/
            ArrayList<VerbalAssurance> verbalAssuranceDetail = DBConnect.getVerbalAssuranceDetails(FIN);
            
            /** Employment Contract Details **/
            ArrayList<EmploymentContract> employmentContractDetails = DBConnect.getEmploymentContractDetails(FIN);
            
            /** Agent Details **/
            ArrayList<Agent> agentDetails = DBConnect.getAgentDetails(FIN);
            
            /** EmployerDetails **/
            ArrayList<Employer> employerDetails = DBConnect.getEmployerDetails(FIN);
            
            /** WorkplaceDetails **/
            ArrayList<Workplace> workplaceDetails = DBConnect.getWorkplaceDetails(FIN);
            
            /** Work HistoryDetails**/
            ArrayList<WorkHistory> workHistoryDetails = DBConnect.getWorkHistoryDetails(FIN);
            
            /**Accomodation**/
            ArrayList<Accomodation> accomodationDetails = DBConnect.getAccomodationDetails(FIN);
            
            /** Problem Compliment**/
            ArrayList<AggravatingIssue> aggraIssueDetails = DBConnect.getAggravatingIssueDetails(FIN);
            
            /**Case Worker**/
            ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails(FIN);
            
            /**Auxillary Case Worker**/
            ArrayList<AuxillaryCaseWorker> auxCaseworkerDetails = DBConnect.getAuxCaseWorkerDetails(FIN);
            
            /**Salary Related History**/
            ArrayList<SalaryRelatedHistory> salRelatedHistoryDetails = DBConnect.getSalaryRelatedHistoryDetails(FIN);
            
            /** Injury Details**/
            ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails(FIN);
            
            /** Illness Details**/
            ArrayList<IllnessHistory> illnessDetails = DBConnect.getIllnessDetails(FIN);
            
            /** Other Problem Details **/
            ArrayList<OtherProblem> otherProblemDetails = DBConnect.getOtherProblemDetails(FIN);
           
            /** Trafficking Indicator **/
            ArrayList<TraffickingIndicator> traffickingIndicators = DBConnect.getTraffickingIndicators(FIN);
            
            /** Salary Claim Lodged **/
            ArrayList<SalaryClaimLodged> salaryClaimLodgedDetails = DBConnect.getSalaryClaimLodgedDetails(FIN);
            
            /** Police Report Details **/
            ArrayList<PoliceReport> policeReportDetails = DBConnect.getPoliceReportDetails(FIN);
            
            /** Hospital Details **/
            ArrayList<Hospital> hospitalDetails = DBConnect.getHospitals(FIN);
            
            /** MC Status **/
            ArrayList<MC> mcDetails = DBConnect.getMCs(FIN);
            
            
            /**Lawyer Status **/
            ArrayList<Lawyer> lawyerDetails = DBConnect.getLawyerDetails(FIN);
            
            /** Non Criminal Case Details **/
            ArrayList<NonCriminialCaseMilestone> nonCriminialCaseMilestoneDetails = dbConnect.getNonCriminalCaseDetails(FIN);
            
            /** Benefit Details **/
            ArrayList<Benefit> benefitDetails = DBConnect.getBenefitDetails(FIN);
            /** Transfer T R **/
            ArrayList<TTR> ttrDetails = DBConnect.getTTRDetails(FIN);
            /** Problem Stub **/
            CaseWorker caseWorkerProblemStub = null;
            InjuryDetail injuryDetailProblemStub = null;
            if(caseWorkerDetails.size() !=0){
                caseWorkerProblemStub = caseWorkerDetails.get(caseWorkerDetails.size() - 1);
            }
            if(injuryDetails.size() !=0){
                injuryDetailProblemStub = injuryDetails.get(injuryDetails.size() - 1);
            }
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
                            <p class="form-control" style="left:25px; height:30px; width:80%;margin:0"> <%=workerName%> </p>
                        </div>
                        <div class="col-md-6" style="padding:0 0 10px 0;">
                            <div class="finnumber" style="margin-left:20px;"> 
                                <label style="margin:0"> FIN number</label>
                                <p class="form-control" style="left:25px;height:30px;margin:0"><%=FIN%></p>
                            </div>
                            <div class="phone" style="margin-left:20px;"> 
                                <label style="margin:0">Phone</label>
                                <p class="form-control" style="left:25px; height:30px;margin:0"> <%=DBConnect.getPhoneNumber((String)session.getAttribute("FIN"))%> </p>
                            </div>
                            <div style="height:60px;"></div>
                            <a href="/TWC2-CaseManagementSystem/ViewWorkerProfile.jsp" style="margin-left:20px">View full profile</a>
                            
                        </div>
                        
                        
                        <%String pictureName = DBConnect.getWorkerPicture((String)session.getAttribute("FIN"));
                                 
                        %>
                        <div class="col-md-5">
                            <div style="height:10px;"></div>
                            <div class="thumbnail" style="width: 150px; height: 200px;"><img src ="WorkerFacePicture/<%=pictureName%>"></div>
                        </div>
                    </td>
                    <td rowspan="6" class="container10">
                        
                    </td>
                    <td class="container5">
                        <div class="headertitle"> List Records</div>
                    </td>
                    
                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        
                        <div class="username-background" style="height:38%">
                            <strong style="margin-left:8px;"> Hello <%= user%></strong>
                            </br>
                            <button style="margin-left:2px;" type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                        <%
                            }
                        %>
                    </td>
                    
                </tr>
                <%--2nd row--%>
                
                <tr>
                    
                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                        <form id ="listForm" name="listForm" role="form" method="post"> 
                            
                            <!-- Start of Worker Compliment -->
                            
                            
                            
                            <% String listToSee = (String) request.getParameter("listToSee");
                                if (listToSee ==null){
                                    listToSee = (String)session.getAttribute("listToSee");
                                }
                                session.setAttribute("listToSee", listToSee);

                                if (listToSee.equalsIgnoreCase("nickName")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1" ></div>
                                <div class="col-md-3" style="font-weight:bold; width:100%">Nickname of worker</div>
                            </div>                            
                            <!-- 
                            for loop get list of workers. 
                            -->
                            <%  
                              
                               for(int i = 0 ;  i < workerNicknames.size();i++){ 
                           
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="nickName" value="<%=i%>"></div>
                                <div class="col-md-3"><%=workerNicknames.get(i)%></div>
                                
                            </div>
                            <%//} 
                                 } 
                                
                              }
                            %> 
                            
                            <% if (session.getAttribute("nickNameMsg") != null) {
                                        String nickNameSuccessMsg = (String) session.getAttribute("nickNameMsg");%>
                            <label style="color:green"><br/><%=nickNameSuccessMsg%></label> <%}%>
                                <%session.removeAttribute("nickNameMsg");%>
                            
                            <!-- passport Details --> 
                            <%
                                if (listToSee.equalsIgnoreCase("passportDetails")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Passport details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Passport country</div>
                                <div class="col-md-2" style="font-weight:bold;">Passport number</div>
                                <div class="col-md-2" style="font-weight:bold;">Passport issue</div>
                                <div class="col-md-2" style="font-weight:bold;">Passport expiry date</div>
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%  for (int i = 0; i < passportDetails.size(); i++) {
                                    Passport currentPassport= passportDetails.get(i);
                                    String passportIssueDate = currentPassport.getPassportIssueDate();
                                    String passportExpiryDate = currentPassport.getPassportExpiryDate();
                                    
                                    String formattedPassportIssueDate = passportIssueDate.substring(0,10);
                                    String formattedPassportExpiryDate = passportExpiryDate.substring(0,10);
                                    
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=currentPassport.getCountry()%></div>
                                <div class="col-md-2"><%=currentPassport.getPassportNumber()%></div>
                                <div class="col-md-2"><%=formattedPassportIssueDate%></div>
                                <div class="col-md-2"><%=formattedPassportExpiryDate%></div>
                            </div>  
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("passportMsg") != null) {
                                        String passportMsg = (String) session.getAttribute("passportMsg");%>
                            <label style="color:green"><br/><%=passportMsg%></label> <%}%>
                                <%session.removeAttribute("passportMsg");%>
                            <!-- Face Photo --> 
                            <%
                                if (listToSee.equalsIgnoreCase("facePhoto")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Face photo</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date stamp</div>
                                <div class="col-md-3" style="font-weight:bold;">Face pic 150 x 200 pixels</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%   
                             
                            for (int i = 0; i < photos.size(); i++) {
                                   WorkerPhoto photo= photos.get(i);
                                   String photoName = photo.getPhotoName();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption" value="<%=i%>"></div>
                                <div class="col-md-2"><%=photo.getDateStamp() %></div>
                                
                                <div class="thumbnail col-md-3" style="width: 150px; height: 200px;"><img src ="WorkerFacePicture/<%=photoName%>"></div>
                                
                            </div> 
                            
                            <%//} 
                                }
                              }

                            %> 
                            
                            
                            
                            <!-- Sg phone number --> 
                            <%
                                if (listToSee.equalsIgnoreCase("sgPhoneNumber")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Sg phone number</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Sg phone number</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%  for (int i = 0; i < contactDetails.size(); i++) {
                                WorkerSGContactDetails currentContactDetail= contactDetails.get(i);

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=currentContactDetail.getPhoneNumber()%></div>
                                <div class="col-md-3"><%=currentContactDetail.getPhoneObsoleteDate()%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("sgPhoneMsg") != null) {
                                        String sgPhoneMsg = (String) session.getAttribute("sgPhoneMsg");%>
                            <label style="color:green"><br/><%=sgPhoneMsg%></label> <%}%>
                                <%session.removeAttribute("sgPhoneMsg");%>
                            <!-- Home ctry phone number --> 
                            <%
                                if (listToSee.equalsIgnoreCase("homeCountryPhoneNumber")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country phone number</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Home country phone number</div>
                                <div class="col-md-3" style="font-weight:bold;">Owner of this number</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%  for (int i = 0; i < homeContactDetails.size(); i++) {
                                HomeCountryContactDetails homeContactDetail= homeContactDetails.get(i);
                                String homePhoneObsolete = homeContactDetail.getHomePhoneObsoleteDate();
                                String homeCountryPhoneNumber = homeContactDetail.getHomePhoneNumber();
                                String homePhoneNumOwner = homeContactDetail.getHomePhoneOwner();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=homeCountryPhoneNumber%></div>
                                <div class="col-md-3"><%=homePhoneNumOwner%></div>
                                <div class="col-md-3"><%=homePhoneObsolete%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("homeCountryPhoneMsg") != null) {
                                        String homeCountryPhoneMsg = (String) session.getAttribute("homeCountryPhoneMsg");%>
                            <label style="color:green"><br/><%=homeCountryPhoneMsg%></label> <%}%>
                                <%session.removeAttribute("homeCountryPhoneMsg");%>
                            <!-- Worker's Sg address --> 
                            <%
                                if (listToSee.equalsIgnoreCase("sgAddress")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's Singapore address</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Worker address in Singapore</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%    for (int i = 0; i < sgAddressDetail.size(); i++) {
                                    WorkerSgAddress sgAddress= sgAddressDetail.get(i);
                                    String workerSGAddress = sgAddress.getSingaporeAddress();
                                    String workerSgAddressObsoleteDate = sgAddress.getSingaporeAddrObsoleteDate();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=workerSGAddress%></div>
                                <div class="col-md-3"><%=workerSgAddressObsoleteDate%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("SGAddressMsg") != null) {
                                        String sgAddressMsg = (String) session.getAttribute("SGAddressMsg");%>
                            <label style="color:green"><br/><%=sgAddressMsg%></label> <%}%>
                                <%session.removeAttribute("SGAddressMsg");%>
                            
                            
                            <!-- Home ctry address --> 
                            <%
                                if (listToSee.equalsIgnoreCase("homeCountryAddress")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country address</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Worker address in home country</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <% for (int i = 0; i < homeCountryAddressDetail.size(); i++) {
                                 WorkerHomeCountryAddress homeCountryAddrDetail = homeCountryAddressDetail.get(i);
                                 String workerHomeCountryAddress = homeCountryAddrDetail.getHomeCountryAddress();
                                 String workerHomeCountryAddressObsolete = homeCountryAddrDetail.getHomeCountryAddrObsolete();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=workerHomeCountryAddress%></div>
                                <div class="col-md-3"><%=workerHomeCountryAddressObsolete%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("homeCountryAddressMsg") != null) {
                                        String homeCountryAddressMsg = (String) session.getAttribute("homeCountryAddressMsg");%>
                            <label style="color:green"><br/><%=homeCountryAddressMsg%></label> <%}%>
                                <%session.removeAttribute("homeCountryAddressMsg");%>
                            <!-- Worker's digital contacts --> 
                            <%
                                if (listToSee.equalsIgnoreCase("workersDigitalContacts")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's digital contacts</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Type of digital contact </div>
                                <div class="col-md-3" style="font-weight:bold;">Email/QQ address or other detail</div>
                                <div class="col-md-3" style="font-weight:bold;">Owner of electronic contact</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%for (int i = 0; i < digitalContactTypeDetails.size(); i++) {
                                 WorkerDigitalContactType digitalContactDetails= digitalContactTypeDetails.get(i);
                                 String digitalContactType =digitalContactDetails.getDigitalContactType();
                                 String email = digitalContactDetails.getEmailAddress();
                                 String owner = digitalContactDetails.getElectronicContactOwner();
                                 String date = digitalContactDetails.getObsoleteDate();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=digitalContactType%></div>
                                <div class="col-md-3"><%=email%></div>
                                <div class="col-md-3"><%=owner%></div>
                                <div class="col-md-3"><%=date%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            
                            <% if (session.getAttribute("digitalContactTypeMsg") != null) {
                                        String digitalContactMsg = (String) session.getAttribute("digitalContactTypeMsg");%>
                            <label style="color:green"><br/><%=digitalContactMsg%></label> <%}%>
                                <%session.removeAttribute("digitalContactTypeMsg");%>
                            
                            
                            <!-- Next of kin --> 
                            <%
                                if (listToSee.equalsIgnoreCase("nextOfKin")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Next of kin</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Name of next of kin </div>
                                <div class="col-md-3" style="font-weight:bold;">Relationship of next of kin to worker</div>
                                <div class="col-md-3" style="font-weight:bold;">Phone number of next of kin</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <% 
                                
                            for (int i = 0; i < kinDetails.size(); i++) {
                                KinDetails kinDetail= kinDetails.get(i);

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=kinDetail.getKinName()%></div>
                                <div class="col-md-3"><%=kinDetail.getKinRelationship()%></div>
                                <div class="col-md-3"><%=kinDetail.getKinPhone()%></div>
                                <div class="col-md-3"><%=kinDetail.getKinObsoleteDate()%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("kinMsg") != null) {
                                        String kinMsg = (String) session.getAttribute("kinMsg");%>
                            <label style="color:green"><br/><%=kinMsg%></label> <%}%>
                                <%session.removeAttribute("kinMsg");%>
                            
                            
                            
                            <!-- Family member --> 
                            <%
                                if (listToSee.equalsIgnoreCase("familyMember")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Family member</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Name of family member </div>
                                <div class="col-md-3" style="font-weight:bold;">Relationship of family member to worker</div>
                                <div class="col-md-3" style="font-weight:bold;">Phone number of family member</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%  for (int i = 0; i < familyDetails.size(); i++) {
                               FamilyDetails familyDetail= familyDetails.get(i);

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=familyDetail.getFamilyMemberName()%></div>
                                <div class="col-md-3"><%=familyDetail.getFamilyMemberRelationship()%></div>
                                <div class="col-md-3"><%=familyDetail.getFamilyMemberPhoneNumber()%></div>
                                <div class="col-md-3"><%=familyDetail.getFamilyMemberObsolete()%></div>
                            </div> 
                            
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("familyMemberMsg") != null) {
                                        String familyMemberMsg = (String) session.getAttribute("familyMemberMsg");%>
                            <label style="color:green"><br/><%=familyMemberMsg%></label> <%}%>
                                <%session.removeAttribute("familyMemberMsg");%>
                            
                            
                            <!-- Friend in Singapore --> 
                            <%
                                if (listToSee.equalsIgnoreCase("friendInSingapore")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Friend in Singapore</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Name of friend in Singapore </div>
                                <div class="col-md-3" style="font-weight:bold;">Phone number of friend</div>
                                <div class="col-md-3" style="font-weight:bold;">Relationship to worker</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%for (int i = 0; i < workerFriendDetails.size(); i++) {
                                   WorkerFriendDetails workerFriendDetail= workerFriendDetails.get(i);
                                   String friendName = workerFriendDetail.getFriendSgName();
                                   String friendRelationship = workerFriendDetail.getFriendSgRelationship();
                                   String friendPhoneNumber = workerFriendDetail.getFriendSgPhone();
                                   String friendObsoleteDate = workerFriendDetail.getFriendSgObsoleteDate();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=friendName%></div>
                                <div class="col-md-3"><%=friendRelationship%></div>
                                <div class="col-md-3"><%=friendPhoneNumber%></div>
                                <div class="col-md-3"><%=friendObsoleteDate%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            
                            <% if (session.getAttribute("friendMsg") != null) {
                                        String friendMsg = (String) session.getAttribute("friendMsg");%>
                            <label style="color:green"><br/><%=friendMsg%></label> <%}%>
                                <%session.removeAttribute("friendMsg");%>
                            
                            
                            <!-- Worker's language --> 
                            <%
                                if (listToSee.equalsIgnoreCase("workersLanguage")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Worker's main language </div>
                                <div class="col-md-3" style="font-weight:bold;">Explain if above is 'Other'</div>
                                <div class="col-md-3" style="font-weight:bold;">Spoken English standard</div>
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <% for (int i = 0; i < languageDetails.size(); i++) {
                                 LanguageDetails languageDetail= languageDetails.get(i);

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=languageDetail.getWorkerMainLanguage()%></div>
                                <div class="col-md-3"></div>
                                <div class="col-md-3"><%=languageDetail.getSpokenEnglishStandard()%></div>
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("languageMsg") != null) {
                                        String languageMsg = (String) session.getAttribute("languageMsg");%>
                            <label style="color:green"><br/><%=languageMsg%></label> <%}%>
                                <%session.removeAttribute("languageMsg");%>
                            
                            <!-- Bank account details --> 
                            <%
                                if (listToSee.equalsIgnoreCase("bankAccountDetails")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Bank account details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Bank account name </div>
                                <div class="col-md-3" style="font-weight:bold;">Bank account number</div>
                                <div class="col-md-3" style="font-weight:bold;">Bank name</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of workers. 
                            
                            -->
                            <%  for (int i = 0; i < bankAccountDetails.size(); i++) {
                                WorkerBankAccountDetails bankAccountDetail= bankAccountDetails.get(i);
                                String accountName = bankAccountDetail.getBankAccountName();
                                String accountNumber = bankAccountDetail.getBankAccountNumber();
                                String bankName = bankAccountDetail.getBankName();
                                String bankObsolete = bankAccountDetail.getBankObsolete();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=accountName%></div>
                                <div class="col-md-3"><%=accountNumber%></div>
                                <div class="col-md-3"><%=bankName%></div>
                                <div class="col-md-3"><%=bankObsolete%></div>
                                
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("bankAccMsg") != null) {
                                        String bankAccountMsg = (String) session.getAttribute("bankAccMsg");%>
                            <label style="color:green"><br/><%=bankAccountMsg%></label> <%}%>
                                <%session.removeAttribute("bankAccMsg");%>
                            
                            
                            <!-- End of Worker Compliement -->
                            
                            <!----------------------------------------------------------------------------------------------------------------------->
                            
                            <!-- Start of Job Compliement -->
                            
                            
                            <!-- Pass details --> 
                            <%
                                if (listToSee.equalsIgnoreCase("passDetails")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Pass details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Pass type </div>
                                <div class="col-md-3" style="font-weight:bold;">Pass number</div>
                                <div class="col-md-3" style="font-weight:bold;">Pass issue date</div>
                                <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <% for (int i = 0; i < passDetail.size(); i++) {
                                    Pass pass = passDetail.get(i);
                                    String passType = pass.getPassType();
                                    String passNumber = pass.getPassNumber();
                                    String passIssueDate = pass.getPassIssueDate();
                                    String passObsoleteDate = pass.getPassObsoleteDate();
                                    
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=passType%></div>
                                <div class="col-md-3"><%=passNumber%></div>
                                <div class="col-md-3"><%=passIssueDate%></div>
                                <div class="col-md-3"><%=passObsoleteDate%></div>
                                
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            
                            <% if (session.getAttribute("passMsg") != null) {
                                        String passMessage = (String) session.getAttribute("passMsg");%>
                            <label style="color:green"><br/><%=passMessage%></label> <%}%>
                                <%session.removeAttribute("passMsg");%>
                            <!-- IPA details --> 
                            <%
                                if (listToSee.equalsIgnoreCase("IPADetails")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">IPA details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Workpass specified in IPA </div>
                                <div class="col-md-3" style="font-weight:bold;">IPA employer name</div>
                                <div class="col-md-3" style="font-weight:bold;">IPA basic monthly salary S$</div>
                                <div class="col-md-3" style="font-weight:bold;">IPA total deductions S$</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <% for (int i = 0; i < ipaDetail.size(); i++) {
                                IPA ipa= ipaDetail.get(i);
                                String ipaWorkpass = ipa.getWorkpassSpecified();
                                String ipaEmployerName = ipa.getIpaEmployerName();
                                String ipaBasicMonthlySalary = ipa.getIpaBasicMonthlySalary();
                                String ipaDeduction = ipa.getIpaDeductions();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=ipaWorkpass%></div>
                                <div class="col-md-3"><%=ipaEmployerName%></div>
                                <div class="col-md-3"><%=ipaBasicMonthlySalary%></div>
                                <div class="col-md-3"><%=ipaDeduction%></div>
                                
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("ipaMsg") != null) {
                                        String ipaMsg = (String) session.getAttribute("ipaMsg");%>
                            <label style="color:green"><br/><%=ipaMsg%></label> <%}%>
                                <%session.removeAttribute("ipaMsg");%>
                            
                            
                            <!-- Verbal assurances pre-job --> 
                            <%
                                if (listToSee.equalsIgnoreCase("verbalAssurances")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Verbal assurances pre-job</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" name="giverName" style="font-weight:bold;">Name of giver of verbal assurances </div>
                                <div class="col-md-3" name="giverRelationship" style="font-weight:bold;">Relationship of giver to worker or agent or employer</div>
                                <div class="col-md-3" name="givenDate" style="font-weight:bold;">When verbal assurances given</div>
                                <div class="col-md-3" name="givenPlace" style="font-weight:bold;">Where verbal assurances given</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <% for (int i = 0; i < verbalAssuranceDetail.size(); i++) {
                                VerbalAssurance verbalDetail= verbalAssuranceDetail.get(i);
                                String giverName = verbalDetail.getGiverName();
                                String giverRelationship = verbalDetail.getGiverRelationship();
                                String givenDate = verbalDetail.getGivenDate();
                                String givenPlace = verbalDetail.getGivenPlace();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=giverName%></div>
                                <div class="col-md-3"><%=giverRelationship%></div>
                                <div class="col-md-3"><%=givenDate %></div>
                                <div class="col-md-3"><%=givenPlace%></div>
                                
                            </div> 
                            <%} 
                                }
                            %> 
                            
                            <% if (session.getAttribute("verbalMsg") != null) {
                                        String verbalMsg = (String) session.getAttribute("verbalMsg");%>
                            <label style="color:green"><br/><%=verbalMsg%></label><%}%>
                                <%session.removeAttribute("verbalMsg");%>
                            <!-- Employment contract --> 
                            <%
                                if (listToSee.equalsIgnoreCase("employmentContract")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employment contract</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Contract date </div>
                                <div class="col-md-3" style="font-weight:bold;">Where contract signed</div>
                                <div class="col-md-3" style="font-weight:bold; width:20%">Relationship of opposite contracting party to job</div>
                                <div class="col-md-3" style="font-weight:bold;">Basic salary</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <%for (int i = 0; i < employmentContractDetails.size(); i++) {
                               EmploymentContract employmentContract= employmentContractDetails.get(i);
                               String contractDate = employmentContract.getContractDate();
                               String contractSignedPlace = employmentContract.getContractSignedPlace();
                               String contractRelationship = employmentContract.getContractRelationship();
                               String contractSalary = employmentContract.getContractBasicSalary();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=contractDate%></div>
                                <div class="col-md-3"><%=contractSignedPlace%></div>
                                <div class="col-md-3"><%=contractRelationship%></div>
                                <div class="col-md-3"><%=contractSalary%></div>
                                
                            </div> 
                            <%} 
                                }
                            %>                      
                            
                            <% if (session.getAttribute("employmentContractMsg") != null) {
                                        String employmentContractMsg = (String) session.getAttribute("employmentContractMsg");%>
                            <label style="color:green"><br/><%=employmentContractMsg%></label><%}%>
                                <%session.removeAttribute("employmentContractMsg");%>
                            
                            <!-- Intermediary agent --> 
                            <%
                                if (listToSee.equalsIgnoreCase("intermediaryAgent")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Intermediary agent</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Agent company name </div>
                                <div class="col-md-3" style="font-weight:bold;">Location of agent</div>
                                <div class="col-md-3" style="font-weight:bold;">Amount paid to this agent S$</div>
                                <div class="col-md-3" style="font-weight:bold;">Amount owed to this agent at start of work S$</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <% for (int i = 0; i < agentDetails.size(); i++) {
                                    Agent agent= agentDetails.get(i);
                                    String agentName = agent.getAgentCompanyName();
                                    String agentLocation =agent.getAgentLocation();
                                    String agentAmountPaid = agent.getAgentAmountPaid();
                                    String agentAmountOwed = agent.getAgentAmountOwed();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=agentName%></div>
                                <div class="col-md-3"><%=agentLocation%></div>
                                <div class="col-md-3"><%=agentAmountPaid%></div>
                                <div class="col-md-3"><%=agentAmountOwed%></div>
                                
                            </div>  
                            <%} 
                                }
                            %>                      
                            
                            <% if (session.getAttribute("agentMsg") != null) {
                                        String agentMsg = (String) session.getAttribute("agentMsg");%>
                            <label style="color:green"><br/><%=agentMsg%></label><%}%>
                                <%session.removeAttribute("agentMsg");%>
                            
                            <!-- Employer details --> 
                            <%
                                if (listToSee.equalsIgnoreCase("employerDetails")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employer details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Official name of employer </div>
                                <div class="col-md-3" style="font-weight:bold;">Employer address</div>
                                <div class="col-md-3" style="font-weight:bold;">Employer phone, email contacts</div>
                                <div class="col-md-3" style="font-weight:bold;">Key persons in employer</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <%for (int i = 0; i < employerDetails.size(); i++) {
                                Employer employer= employerDetails.get(i);
                                String employerName = employer.getEmployerName();
                                String employerAddress = employer.getEmployerAddress();
                                String employerContact = employer.getEmployerContacts();
                                String employerKey = employer.getEmployerKeyPersons();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=employerName%></div>
                                <div class="col-md-3"><%=employerAddress%></div>
                                <div class="col-md-3"><%=employerContact%></div>
                                <div class="col-md-3"><%=employerKey%></div>
                                
                            </div>  
                            <%} 
                                }
                            %>                      
                            
                            <% if (session.getAttribute("employerMsg") != null) {
                                        String employerMsg = (String) session.getAttribute("employerMsg");%>
                            <label style="color:green"><br/><%=employerMsg%></label><%}%>
                                <%session.removeAttribute("employerMsg");%>
                            <!-- Workplace details  --> 
                            <%
                                if (listToSee.equalsIgnoreCase("workplaceDetails")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Workplace details</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Type of workplace </div>
                                <div class="col-md-3" style="font-weight:bold;">Is workplace controlled by employer stated on workpass? If not, who?</div>
                                <div class="col-md-3" style="font-weight:bold;">Who directed worker to this workplace?</div>
                                <div class="col-md-3" style="font-weight:bold;">When start at workplace?</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <%for (int i = 0; i < workplaceDetails.size(); i++) {
                               Workplace workplace= workplaceDetails.get(i);
                               String workplaceType = workplace.getWorkplaceType();
                               String workplaceWhose = workplace.getWorkplaceWhose();
                               String workplaceDirect = workplace.getWorkplaceDirect();
                               String workplaceStart = workplace.getWorkplaceStart();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=workplaceType%></div>
                                <div class="col-md-3"><%=workplaceWhose%></div>
                                <div class="col-md-3"><%=workplaceDirect%></div>
                                <div class="col-md-3"><%=workplaceStart%></div>
                                
                            </div> 
                            <%} 
                                }
                            %>          
                            
                            <% if (session.getAttribute("workplaceMsg") != null) {
                                        String workplaceMsg = (String) session.getAttribute("workplaceMsg");%>
                            <label style="color:green"><br/><%=workplaceMsg%></label><%}%>
                                <%session.removeAttribute("workplaceMsg");%>
                            
                            
                            
                            <!-- Work history  --> 
                            <%
                                if (listToSee.equalsIgnoreCase("workHistory")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Work history</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">How did worker get into the job defined in Job Profile? </div>
                                <div class="col-md-3" style="font-weight:bold;">Date arrived Singapore for this job</div>
                                <div class="col-md-3" style="font-weight:bold;">Is this first job in Singapore?</div>
                                <div class="col-md-3" style="font-weight:bold;">If not, year in which worker arrived in Singapore for first job</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <%  for (int i = 0; i < workHistoryDetails.size(); i++) {
                                  WorkHistory workHistory= workHistoryDetails.get(i);
                                  String getWorkHow = workHistory.getGetWorkHow();
                                  String sgArrivalDate = workHistory.getSingaporeArrivalDate();
                                  String firstJobWhether = workHistory.getFirstJobWhether();
                                  String firstJobArrival = workHistory.getSingaporeArrivalDate();

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=getWorkHow%></div>
                                <div class="col-md-3"><%=sgArrivalDate%></div>
                                <div class="col-md-3"><%=firstJobWhether%></div>
                                <div class="col-md-3"><%=firstJobArrival%></div>
                                
                            </div>  
                            <%} 
                                }
                            %>           
                            
                            <% if (session.getAttribute("workHistoryMsg") != null) {
                                        String workHistoryMsg = (String) session.getAttribute("workHistoryMsg");%>
                            <label style="color:green"><br/><%=workHistoryMsg%></label><%}%>
                                <%session.removeAttribute("workHistoryMsg");%>
                            
                            
                            <!-- Accommodation during work  --> 
                            <%
                                if (listToSee.equalsIgnoreCase("accommodationDuringWork")) {
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Accommodation during work</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Accommodation provided by employer?</div>
                                <div class="col-md-3" style="font-weight:bold;">Type of accommodation</div>
                                <div class="col-md-3" style="font-weight:bold;">Cost charged by employer per month S$</div>
                                <div class="col-md-2" style="font-weight:bold;">Cost paid by self per month S$</div>
                                
                            </div>
                            <!-- 
                            for loop get list of Jobs. 
                            
                            -->
                            <% for (int i = 0; i < accomodationDetails.size(); i++) {
                              Accomodation accomodation= accomodationDetails.get(i);
                              String accomodationProvided = accomodation.getAccomodationProvided();
                              String accomodationType = accomodation.getAccomodationType();
                              String chargedCost = accomodation.getEmployerMonthlyCost();
                              String costPaid = accomodation.getSelfPaidCost();
                            %>      
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=accomodationProvided%></div>
                                <div class="col-md-3"><%=accomodationType%></div>
                                <div class="col-md-3"><%=chargedCost%></div>
                                <div class="col-md-2"><%=costPaid%></div>
                                
                            </div> 
                            <%} 
                                }
                            %>           
                            
                            <% if (session.getAttribute("accomodationMsg") != null) {
                                        String accomodationMsg = (String) session.getAttribute("accomodationMsg");%>
                            <label style="color:green"><br/><%=accomodationMsg%></label><%}%>
                                <%session.removeAttribute("accomodationMsg");%>
                            
                            <!-- End of Job Compliement -->
                            
                            
                            <!-- Start of Problem Compliment -->
                            
                            <%
                                if (listToSee.equalsIgnoreCase("aggravatingIssue")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Aggravating issue</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Aggravating issue</div>
                                <div class="col-md-3" style="font-weight:bold;">Explain if at left is 'Other'</div>
                                <div class="col-md-3" style="font-weight:bold;">Monetary loss/value of this aggravating issue S$</div>
                                <div class="col-md-3" style="font-weight:bold;">Remarks about aggravating issue</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < aggraIssueDetails.size();i++){ 
                                 AggravatingIssue aggraIssueDetail = aggraIssueDetails.get(i);
                                 String aggraIssue = aggraIssueDetail.getAggravatingIssue();
                                 String aggraIssueOther = aggraIssueDetail.getAggravatingIssueMore();
                                 String monetaryLoss = aggraIssueDetail.getMonetaryLoss();
                                 String aggraRemarks = aggraIssueDetail.getAggravatingIssueRemarks();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=aggraIssue%></div>
                                <div class="col-md-3"><%=aggraIssueOther%></div>
                                <div class="col-md-3"><%=monetaryLoss%></div>
                                <div class="col-md-3"><%=aggraRemarks%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                            <% if (session.getAttribute("aggravatingIssueMsg") != null) {
                                        String aggravatingIssueMsg = (String) session.getAttribute("aggravatingIssueMsg");%>
                            <label style="color:green"><br/><%=aggravatingIssueMsg%></label><%}%>
                                <%session.removeAttribute("aggravatingIssueMsg");%>
                            
                            <!-- Lead caseworker --> 
                            <%
                                if (listToSee.equalsIgnoreCase("leadCaseworker")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Lead caseworker</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Lead caseworker</div>
                                <div class="col-md-3" style="font-weight:bold;">Start Date</div>
                                <div class="col-md-3" style="font-weight:bold;">End Date</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < caseWorkerDetails.size();i++){ 
                                CaseWorker caseWorker =caseWorkerDetails.get(i);
                                String leadCaseWorker = caseWorker.getLeadCaseWorker();
                                String caseWorkerStartDate = caseWorker.getCaseWorkerStartDate();
                                String caseWorkerEndDate = caseWorker.getCaseWorkerEndDate();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=leadCaseWorker%></div>
                                <div class="col-md-3"><%=caseWorkerStartDate%></div>
                                <div class="col-md-3"><%=caseWorkerEndDate%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                            <% if (session.getAttribute("leadCaseWorkerMsg") != null) {
                                        String leadCaseworkerMsg = (String) session.getAttribute("leadCaseWorkerMsg");%>
                            <label style="color:green"><br/><%=leadCaseworkerMsg%></label><%}%>
                                <%session.removeAttribute("leadCaseWorkerMsg");%>
                            
                            <!-- Auxiliary caseworker --> 
                            <%
                                if (listToSee.equalsIgnoreCase("auxiliaryCaseworker")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Auxiliary caseworker</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Auxiliary caseworker</div>
                                <div class="col-md-3" style="font-weight:bold;">Start Date</div>
                                <div class="col-md-3" style="font-weight:bold;">End Date</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%  for(int i = 0 ;  i < auxCaseworkerDetails.size();i++){ 
                                    AuxillaryCaseWorker auxCaseWorker = auxCaseworkerDetails.get(i);
                                    String auxCaseWorkerName = auxCaseWorker.getAuxCaseWorkerName();
                                    String auxStartDate  = auxCaseWorker.getAuxStartDate();
                                    String auxEndDate = auxCaseWorker.getAuxEndDate();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=auxCaseWorkerName%></div>
                                <div class="col-md-3"><%=auxStartDate%></div>
                                <div class="col-md-3"><%=auxEndDate%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                              <% if (session.getAttribute("auxCaseWorkerName") != null) {
                                        String auxCaseWorkerName = (String) session.getAttribute("auxCaseWorkerName");%>
                            <label style="color:green"><br/><%=auxCaseWorkerName%></label><%}%>
                                <%session.removeAttribute("auxCaseWorkerName");%>
                            
                            <!-- Salary & related history --> 
                            <%
                                if (listToSee.equalsIgnoreCase("salaryRelatedHistory")) {
                                    
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Salary & related history</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Describe complaint about basic salary incorrect or not paid</div>
                                <div class="col-md-2" style="font-weight:bold;">Mode of salary payment</div>
                                <div class="col-md-3" style="font-weight:bold;">Estimated total value of claim S$</div>
                                <div class="col-md-3" style="font-weight:bold;">Estimated 12 months' value of claim S$</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < salRelatedHistoryDetails.size();i++){ 
                                    SalaryRelatedHistory salaryRelatedHistory = salRelatedHistoryDetails.get(i);
                                   String salaryComplaint = salaryRelatedHistory.getSalaryComplaint();
                                   String salMode = salaryRelatedHistory.getSalaryPaymentMode();
                                   String estimatedTotalValue = salaryRelatedHistory.getEstimatedTotalValueOfClaim();
                                   String estimated12YearClaim = salaryRelatedHistory.getEstimated12MonthsValueOfClaim();
                                    
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=salaryComplaint%></div>
                                <div class="col-md-2"><%=salMode%></div>
                                <div class="col-md-3"><%=estimatedTotalValue%></div>
                                <div class="col-md-3"><%=estimated12YearClaim%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                              <% if (session.getAttribute("basicSalaryComplaintMsg") != null) {
                                        String basicSalaryComplaintMsg = (String) session.getAttribute("basicSalaryComplaintMsg");%>
                            <label style="color:green"><br/><%=basicSalaryComplaintMsg%></label><%}%>
                                <%session.removeAttribute("basicSalaryComplaintMsg");%>
                            
                            <!-- Injury History --> 
                            <%
                                if (listToSee.equalsIgnoreCase("injuryHistory")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Injury history</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of injury</div>
                                <div class="col-md-3" style="font-weight:bold;">Location where incident occurred</div>
                                <div class="col-md-2" style="font-weight:bold;">Body part(s) injured</div>
                                <div class="col-md-3" style="font-weight:bold;">Where (clinic/hospital) initially treated</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < injuryDetails.size();i++){ 
                                InjuryDetail injuryDetail = injuryDetails.get(i);
                                String injuryDate = injuryDetail.getInjuryDate();
                                String injuryLocation = injuryDetail.getInjuryLocation();
                                String bodyPartsInjured = injuryDetail.getBodyPartsInjured();
                                String treatmentHospital = injuryDetail.getLocationTreated();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=injuryDate%></div>
                                <div class="col-md-3"><%=injuryLocation%></div>
                                <div class="col-md-2"><%=bodyPartsInjured%></div>
                                <div class="col-md-3"><%=treatmentHospital%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                                <% if (session.getAttribute("injuryMsg") != null) {
                                        String injuryMsg = (String) session.getAttribute("injuryMsg");%>
                            <label style="color:green"><br/><%=injuryMsg%></label><%}%>
                                <%session.removeAttribute("injuryMsg");%>
                            
                            
                            <!-- Illness history --> 
                            <%
                                if (listToSee.equalsIgnoreCase("illnessHistory")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Illness history</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">When illness began</div>
                                <div class="col-md-3" style="font-weight:bold;">When illness diagnosed</div>
                                <div class="col-md-2" style="font-weight:bold;">Nature of illness</div>
                                <div class="col-md-3" style="font-weight:bold;">Does worker consider illness work-related?</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < illnessDetails.size();i++){ 
                                IllnessHistory illnessHistory = illnessDetails.get(i);
                                String illnessDate = illnessHistory.getIllnessBegan();
                                String illnessDiagnosed = illnessHistory.getDiagnosedIllness();
                                String illnessNature = illnessHistory.getIllnessNature();
                                String workRelatedIllness = illnessHistory.getWorkRelatedIllness();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=illnessDate%></div>
                                <div class="col-md-3"><%=illnessDiagnosed%></div>
                                <div class="col-md-2"><%=illnessNature%></div>
                                <div class="col-md-3"><%=workRelatedIllness%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                             <% if (session.getAttribute("illnessMsg") != null) {
                                        String illnessMsg = (String) session.getAttribute("illnessMsg");%>
                            <label style="color:green"><br/><%=illnessMsg%></label><%}%>
                                <%session.removeAttribute("illnessMsg");%>
                            
                            <!-- Details/history other problems --> 
                            <%
                                if (listToSee.equalsIgnoreCase("detailsHistoryOtherProblems")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Details/history other problems</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-4" style="font-weight:bold;">Describe details of problem if it's not salary/injury/illness</div>
                                <div class="col-md-4" style="font-weight:bold;">Estimated value of claim S$</div>
                                
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < otherProblemDetails.size();i++){ 
                                    OtherProblem problem = otherProblemDetails.get(i);
                                    String problemDescription = problem.getOtherProblem();
                                    String estimatedLoss = problem.getEstimatedValue();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-4"><%=problemDescription%></div>
                                <div class="col-md-4"><%=estimatedLoss%></div>
                                
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                              <% if (session.getAttribute("otherProblemsMsg") != null) {
                                        String otherProblemsMsg = (String) session.getAttribute("otherProblemsMsg");%>
                            <label style="color:green"><br/><%=otherProblemsMsg%></label><%}%>
                                <%session.removeAttribute("otherProblemsMsg");%>
                            
                            <!-- Trafficking indicators --> 
                            <%
                                if (listToSee.equalsIgnoreCase("traffickingIndicators")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Trafficking indicators</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date this assessment made</div>
                                <div class="col-md-3" style="font-weight:bold;">Name of TWC2 person making this assessment</div>
                                <div class="col-md-3" style="font-weight:bold;">Describe other indicators of trafficking complained of</div>
                                <div class="col-md-3" style="font-weight:bold;">Describe other indicators of trafficking observed</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%  for(int i = 0 ;  i < traffickingIndicators.size();i++){ 
                                    TraffickingIndicator indicator = traffickingIndicators.get(i);
                                    String assessmentDate = indicator.getAssessmentDate();
                                    String assessmentPerson = indicator.getAssessmentPerson();
                                    String otherIndicatorComplaint = indicator.getTraffickingComplaint();
                                    String otherIndicator = indicator.getOtherTrafficking();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=assessmentDate%></div>
                                <div class="col-md-3"><%=assessmentPerson %></div>
                                <div class="col-md-3"><%=otherIndicatorComplaint%></div>
                                <div class="col-md-3"><%=otherIndicator%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                             <% if (session.getAttribute("assessmentMsg") != null) {
                                        String assessmentMsg = (String) session.getAttribute("assessmentMsg");%>
                            <label style="color:green"><br/><%=assessmentMsg%></label><%}%>
                                <%session.removeAttribute("assessmentMsg");%>
                            
                            <!-- Salary claim lodged --> 
                            <%
                                if (listToSee.equalsIgnoreCase("salaryClaimLodged")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Salary claim lodged</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Date claim lodged at MOM</div>
                                <div class="col-md-2" style="font-weight:bold;">Initial value of claim S$</div>
                                <div class="col-md-3" style="font-weight:bold;">Describe basis for amount claimed</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < salaryClaimLodgedDetails.size();i++){ 
                                    SalaryClaimLodged claimLodged = salaryClaimLodgedDetails.get(i);
                                    String salClaimDate = claimLodged.getSalClaimDate();
                                    String valueClaim = claimLodged.getSalClaimLoss();
                                    String salBasisClaimDesc  = claimLodged.getSalClaimBasis();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=salClaimDate%></div>
                                <div class="col-md-2"><%=valueClaim%></div>
                                <div class="col-md-3"><%=salBasisClaimDesc%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                              <% if (session.getAttribute("salaryClaimLodgeMsg") != null) {
                                        String salaryClaimLodgeMsg = (String) session.getAttribute("salaryClaimLodgeMsg");%>
                            <label style="color:green"><br/><%=salaryClaimLodgeMsg%></label><%}%>
                                <%session.removeAttribute("salaryClaimLodgeMsg");%>
                            
                            <!-- Wica claim lodged --> 
                            <%
                                if (listToSee.equalsIgnoreCase("wicaClaimLodged")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Wica claim lodged</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date claim lodged at MOM</div>
                                <div class="col-md-3" style="font-weight:bold;">Wica ref number</div>
                                <div class="col-md-3" style="font-weight:bold;">Wica insurance company</div>
                                <div class="col-md-3" style="font-weight:bold;">Wica insurance policy number</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < wicaClaimLodgedList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            
                            <!-- Non-Wica med claim --> 
                            <%
                                if (listToSee.equalsIgnoreCase("nonWicaMedClaim")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Non-Wica med claim</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Non-Wica med claim</div>
                                <div class="col-md-3" style="font-weight:bold;">Initial value of claim S$</div>
                                <div class="col-md-3" style="font-weight:bold;">Insurance company</div>
                                <div class="col-md-3" style="font-weight:bold;">Insurance policy number</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < nonWicaMedClaimList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            <!-- Police report --> 
                            <%
                                if (listToSee.equalsIgnoreCase("policeReport")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Police report</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date police report made</div>
                                <div class="col-md-3" style="font-weight:bold;">Police station where report lodged</div>
                                <div class="col-md-3" style="font-weight:bold;">Accompanying TWC2 persons</div>
                                <div class="col-md-3" style="font-weight:bold;">Details of police report</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < policeReportDetails.size();i++){ 
                                PoliceReport policeReport = policeReportDetails.get(i);
                                String policeReportDate = policeReport.getPoliceReportDate();
                                String policeReportStation = policeReport.getPoliceStation();
                                String accompaniedPersons = policeReport.getAccompaniedPersons();
                                String policeReportDetail = policeReport.getPoliceReportDetails();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=policeReportDate%></div>
                                <div class="col-md-3"><%=policeReportStation%></div>
                                <div class="col-md-3"><%=accompaniedPersons%></div>
                                <div class="col-md-3"><%=policeReportDetail%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                            
                              <% if (session.getAttribute("policeReportMsg") != null) {
                                        String policeReportMsg = (String) session.getAttribute("policeReportMsg");%>
                            <label style="color:green"><br/><%=policeReportMsg%></label><%}%>
                                <%session.removeAttribute("policeReportMsg");%>
                            <!-- Oth complaint lodged --> 
                            <%
                                if (listToSee.equalsIgnoreCase("othComplaintLodged")) {
                                    
                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Oth complaint lodged</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date other complaint lodged</div>
                                <div class="col-md-3" style="font-weight:bold;">Agency/authority to whom complaint addressed</div>
                                <div class="col-md-2" style="font-weight:bold;">This complaint lodged by</div>
                                <div class="col-md-3" style="font-weight:bold;">If TWC2 or third party, name of person lodging complaint?</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < othComplaintLodgedList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            <!-- Case discussion --> 
                            <%
                                if (listToSee.equalsIgnoreCase("caseDiscussion")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case discussion</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Date of discussion, assistance or information-receipt</div>
                                <div class="col-md-3" style="font-weight:bold;">Mode/location of discussion, assistance or information-receipt</div>
                                <div class="col-md-3" style="font-weight:bold;">TWC2 person consulted, assisting or informed</div>
                                <div class="col-md-2" style="font-weight:bold;">Topic of discussion or information received</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < othComplaintLodgedList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-2"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            <!-- Hospital --> 
                            <%
                                if (listToSee.equalsIgnoreCase("hospital")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Hospital</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" name="updateDate" style="font-weight:bold;">Date of update</div>
                                <div class="col-md-2" name="currentHospital" style="font-weight:bold;">Current hospital</div>
                                <div class="col-md-3" name="otherHospital" style="font-weight:bold;">Explain if at left is 'Other'</div>
                                <div class="col-md-3" name="doctor" style="font-weight:bold;">Department/doctor within hospital if known</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < hospitalDetails.size();i++){ 
                                    Hospital hospital = hospitalDetails.get(i);
                                    String updateDate = hospital.getHopitalUpdateDate();
                                    String hospitalName=  hospital.getHospitalName();
                                    String hospitalMore = hospital.getHospitalMore();
                                    String hospitalDoctor = hospital.getHospitalDoctor();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=updateDate%></div>
                                <div class="col-md-2"><%=hospitalName%></div>
                                <div class="col-md-3"><%=hospitalMore%></div>
                                <div class="col-md-3"><%=hospitalDoctor%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                                <% if (session.getAttribute("hospitalMsg") != null) {
                                        String hospitalMsg = (String) session.getAttribute("hospitalMsg");%>
                            <label style="color:green"><br/><%=hospitalMsg%></label><%}%>
                                <%session.removeAttribute("hospitalMsg");%>
                            
                            <!-- MC/Light Duty status --> 
                            <%
                                if (listToSee.equalsIgnoreCase("mcLightDutyStatus")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">MC/Light Duty status</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of update</div>
                                <div class="col-md-3" style="font-weight:bold;">Current MC or Light Duty status </div>
                                <div class="col-md-3" style="font-weight:bold;">Latest known MC expiry date</div>
                                <div class="col-md-3" style="font-weight:bold;">Cumulative MC days so far</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < mcDetails.size();i++){ 
                                    MC mc = mcDetails.get(i);
                                    String mcUpdate = mc.getMCUpdate();
                                    String currentMCStatus = mc.getMCStatus();
                                    String latestMCExpiryDate = mc.getMCExpDate();
                                    if(latestMCExpiryDate == null){
                                        latestMCExpiryDate = "";
                                    }
                                    String cumulativeMCDays = mc.getMCDaysCulmul();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=mcUpdate%></div>
                                <div class="col-md-3"><%=currentMCStatus%></div>
                                <div class="col-md-3"><%=latestMCExpiryDate%></div>
                                <div class="col-md-3"><%=cumulativeMCDays%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                             <% if (session.getAttribute("MCmsg") != null) {
                                        String MCmsg = (String) session.getAttribute("MCmsg");%>
                            <label style="color:green"><br/><%=MCmsg%></label><%}%>
                                <%session.removeAttribute("MCmsg");%>
                            
                            <!-- R2R appts --> 
                            <%
                                if (listToSee.equalsIgnoreCase("r2rAppts")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">R2R appts</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of appointment</div>
                                <div class="col-md-3" style="font-weight:bold;">R2R first volunteer </div>
                                <div class="col-md-3" style="font-weight:bold;">R2R second volunteer</div>
                                <div class="col-md-3" style="font-weight:bold;">Purpose of appointment</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < r2rApptsList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            <!-- Wica status --> 
                            <%
                                if (listToSee.equalsIgnoreCase("wicaStatus")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Wica status</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of update</div>
                                <div class="col-md-2" style="font-weight:bold;">Wica status </div>
                                <div class="col-md-2" style="font-weight:bold;">Wica points</div>
                                <div class="col-md-3" style="font-weight:bold;">Wica S$ compensation</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < wicaStatusList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            
                            <!-- Lawyer status --> 
                            <%
                                if (listToSee.equalsIgnoreCase("lawyerStatus")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Lawyer status</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of update</div>
                                <div class="col-md-4" style="font-weight:bold;">With this update, does worker have lawyer for this problem? </div>
                                <div class="col-md-2" style="font-weight:bold;">Name of law firm</div>
                                <div class="col-md-3" style="font-weight:bold;">Remarks re his lawyer status</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < lawyerDetails.size();i++){ 
                                 Lawyer lawyer = lawyerDetails.get(i);
                                 String lawyerUpdate = lawyer.getLawyerUpdate();
                                 String lawyerHave = lawyer.getLawyerHave();
                                 String lawFirm = lawyer.getLawyerFirm();
                                 String lawyerRemarks = lawyer.getLawyerRemarks();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=lawyerUpdate%></div>
                                <div class="col-md-4"><%=lawyerHave%></div>
                                <div class="col-md-2"><%=lawFirm%></div>
                                <div class="col-md-3"><%=lawyerRemarks%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                              <% if (session.getAttribute("lawyerMsg") != null) {
                                        String lawyerMsg = (String) session.getAttribute("lawyerMsg");%>
                            <label style="color:green"><br/><%=lawyerMsg%></label><%}%>
                                <%session.removeAttribute("lawyerMsg");%>
                            
                            
                            
                            <!--Case milestone (non-criminal) --> 
                            <%
                                if (listToSee.equalsIgnoreCase("caseMilestoneNonCriminal")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (non-criminal)</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Date milestone reached</div>
                                <div class="col-md-2" style="font-weight:bold;">Milestone reached</div>
                                <div class="col-md-3" style="font-weight:bold;">Explain if at left is 'Other'</div>
                                <div class="col-md-3" style="font-weight:bold;">Remarks re milestone reached</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < nonCriminialCaseMilestoneDetails.size();i++){ 
                                    NonCriminialCaseMilestone nonCriminalCase =nonCriminialCaseMilestoneDetails.get(i);
                                    String dateMilestoneReached = nonCriminalCase.getDateMilestoneReached();
                                    String milestoneReached = nonCriminalCase.getMilestoneReached();
                                    String milstoneOther = nonCriminalCase.getMilestoneOther();
                                    if(milstoneOther == null){
                                        milstoneOther = "";
                                    }
                                    String milestoneRemarks = nonCriminalCase.getMilestoneRemarks();
                                    if(milestoneRemarks == null){
                                        milestoneRemarks ="";
                                    }
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%=dateMilestoneReached%></div>
                                <div class="col-md-2"><%=milestoneReached%></div>
                                <div class="col-md-3"><%=milstoneOther%></div>
                                <div class="col-md-3"><%=milestoneRemarks%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                            
                            <!--Case milestone (criminal) --> 
                            <%
                                if (listToSee.equalsIgnoreCase("caseMilestoneCriminal")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (criminal)</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Date milestone reached</div>
                                <div class="col-md-2" style="font-weight:bold;">Milestone reached</div>
                                <div class="col-md-3" style="font-weight:bold;">Details of charges</div>
                                <div class="col-md-3" style="font-weight:bold;">Details of sentence</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%                                // for(int i = 0 ;  i < caseMilestoneCriminalList.size();i++){ 

                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-2"><% %></div>
                                <div class="col-md-3"><% %></div>
                                <div class="col-md-3"><% %></div>
                            </div>
                            <%//} 
                                    // }                        
                                }
                            %> 
                            
                            
                            
                            
                            <!--Benefaction --> 
                            <%
                                if (listToSee.equalsIgnoreCase("benefaction")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Benefaction</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date benefit given</div>
                                <div class="col-md-2" style="font-weight:bold;">Type of benefit</div>
                                <div class="col-md-4" style="font-weight:bold;">Purpose of or reason for benefit/refund</div>
                                <div class="col-md-3" style="font-weight:bold;">Value of benefit/refund S$</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <%for(int i = 0 ;  i < benefitDetails.size();i++){ 
                                 Benefit benefit = benefitDetails.get(i);
                                 String benefitDate =benefit.getBenefitGivenDate();
                                 String benefitType =benefit.getBenefitType();
                                 String benefitPurpose = benefit.getBenefitPurpose();
                                 String benefitValue = benefit.getBenefitValue();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=benefitDate%></div>
                                <div class="col-md-2"><%=benefitType%></div>
                                <div class="col-md-4"><%=benefitPurpose%></div>
                                <div class="col-md-3"><%=benefitValue%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %> 
                            
                                <% if (session.getAttribute("benefitMsg") != null) {
                                        String benefitMsg = (String) session.getAttribute("benefitMsg");%>
                            <label style="color:green"><br/><%=benefitMsg%></label><%}%>
                                <%session.removeAttribute("benefitMsg");%>
                            
                            
                            
                            <!--Transfer, TJS, repatriation --> 
                            <%
                                if (listToSee.equalsIgnoreCase("transferTJSRepatriation")) {

                            %>
                            
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Transfer, TJS, repatriation</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-2" style="font-weight:bold;">Date of update</div>
                                <div class="col-md-3" style="font-weight:bold;">Transfer, TJS or repatriation status</div>
                                <div class="col-md-3" style="font-weight:bold;">Date of departure from Singapore</div>
                                <div class="col-md-3" style="font-weight:bold;">Name of TJS or new employer</div>
                            </div>                            
                            <!-- 
                            for loop get list of problems. 
                            -->
                            <% for(int i = 0 ;  i < ttrDetails.size();i++){ 
                                    TTR ttr = ttrDetails.get(i);
                                    String ttrUpdate = ttr.getTtrUpdateDate();
                                    String ttrStatus = ttr.getTtrStatus();
                                    String departureDate = ttr.getDepartureDate();
                                    String newEmployerName = ttr.getNewEmployerName();
                            %>      
                            
                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-2"><%=ttrUpdate%></div>
                                <div class="col-md-3"><%=ttrStatus%></div>
                                <div class="col-md-3"><%=departureDate%></div>
                                <div class="col-md-3"><%=newEmployerName%></div>
                            </div>
                            <%} 
                                    // }                        
                                }
                            %>
                            
                             <% if (session.getAttribute("ttrMsg") != null) {
                                        String ttrMsg = (String) session.getAttribute("ttrMsg");%>
                            <label style="color:green"><br/><%=ttrMsg%></label><%}%>
                                <%session.removeAttribute("ttrMsg");%>
                            
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
                            <p class="form-control" style="left:25px; height:30px;width:80%;margin:0"> <%=DBConnect.getEmployer((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getWorkpassType((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getOccupation((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getCommencedDate((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-8">
                                <a href="/TWC2-CaseManagementSystem/ViewJobProfile.jsp" >View full profile</a>
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
                            <%if(injuryDetailProblemStub != null){%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=injuryDetailProblemStub.getInjuryDate()%></p>
                            <%} else {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Lead caseworker</label>
                            <%if(caseWorkerProblemStub != null){%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=caseWorkerProblemStub.getLeadCaseWorker()%></p>
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
                        <button type="submit" class="btn btn-primary btn-large" onClick="onSubmit()"><span style="font-size:13px;">VIEW</span><br/> <span>selected record</span></button>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/AddRecord.jsp"><span style="font-size:13px;">ADD</span><br/> <span> new record</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp" style="height:55px;text-align: center; vertical-align: middle;"><span style="font-size:13px;">CASE MENU</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                    </td>
                </tr>
                
            </table>
        </div>
    </form>
</body>
</html>
