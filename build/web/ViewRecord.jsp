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
            // get lsit of workers
            String FIN = (String)session.getAttribute("FIN");
            ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails((String) session.getAttribute("FIN"));
            ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails((String) session.getAttribute("FIN"));
            
            CaseWorker caseWorker = null;
            InjuryDetail injuryDetail = null;
            if(caseWorkerDetails.size() !=0){
                caseWorker = caseWorkerDetails.get(caseWorkerDetails.size() - 1);
            }
            if(injuryDetails.size() !=0){
                injuryDetail = injuryDetails.get(injuryDetails.size() - 1);
            }
            /** Nickname **/
            String nickName = request.getParameter("nickName");
            ArrayList<String> nickNames = DBConnect.retrieveWorkerNicknames(FIN);
            String nickname = null;
            if(nickName != null){
                nickname = nickNames.get(Integer.parseInt(nickName));
            }
            
            
            
            /** Facephoto **/
            String facePhotoChoice = request.getParameter("selectoption");
            ArrayList<WorkerPhoto> photos = DBConnect.retrieveWorkerPhotos(FIN);
            WorkerPhoto photo = null;
            if(facePhotoChoice !=null){
                 photo = photos.get(Integer.parseInt(facePhotoChoice));
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
                            <div class="thumbnail" style="width: 150px; height: 200px;"><img src ="WorkerFacePicture/<%=pictureName%>"></div>
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
                                <p class="form-control" style="left:25px;height:30px;width:30%;"><%=nickname%></p>
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
                                <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportCountry")%> </p>
                                <label>Passport number</label>
                                <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportNumber")%> </p>
                                <label>Passport issue</label>
                                <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportIssue")%> </p>
                                <label>Passport expiry date</label>
                                <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportExpiryDate")%> </p>
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
                                <p class="form-control" style="left:25px;height:30px;width:30%;"><%=photo.getDateStamp()%></p>
                                <label>Face pic 150 x 200 pixels</label>
                                <div style="height:10px"> </div>
                                <div class="thumbnail col-md-3" style="width: 150px; height: 200px;"><img src ="WorkerFacePicture/<%=photo.getPhotoName()%>"></div>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Owner of this number</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Email/QQ address or other detail</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Owner of electronic contact</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Relationship of next of kin to worker</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Phone number of next of kin</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Relationship of family member to worker</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Phone number of family member</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Phone number of friend</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Relationship to worker</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   


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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Explain if above is 'Other'</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Spoken English standard</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Bank account number</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Bank name</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Pass number</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Pass issue date</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date discovered to be obsolete</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>IPA employer name</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>IPA basic monthly salary S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>IPA total deductions S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Relationship of giver to worker or agent or employer</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>When verbal assurances given</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Where verbal assurances given</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Where contract signed</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Relationship of opposite contracting party to job</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Basic salary</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Location of agent</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Amount paid to this agent S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Amount owed to this agent at start of work S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Employer address</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Employer phone, email contacts</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Key persons in employer</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>


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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Who directed worker to this workplace?</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>When start at workplace?</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>


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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Date arrived Singapore for this job</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Is this first job in Singapore?</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>If not, year in which worker arrived in Singapore for first job</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>

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
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Type of accommodation</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>   
                                <label>Cost charged by employer per month S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>
                                <label>Cost paid by self per month S$</label>
                                <p class="form-control" style="left:25px;height:20px;width:30%;"> <% %> </p>

                            </div> 
                            <%}%>     


                            <!-- End of Job Compliement -->

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
                            <p class="form-control" style="left:25px; height:30px;width:80%;margin:0"><%=DBConnect.getEmployer((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"> <%=DBConnect.getWorkpassType((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getOccupation((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getCommencedDate((String)session.getAttribute("FIN"))%></p>
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
                        <button type="submit" class="btn btn-primary btn-large" onclick="onSubmit()"><span style="font-size:13px;">EDIT</span><br/> <span>this record</span></button>
                        <a type="submit" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ListRecords.jsp"><span style="font-size:13px;">LIST</span><br/> <span>records</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp" style="height:55px;text-align: center; vertical-align: middle;"><span style="font-size:13px;">CASE MENU</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
