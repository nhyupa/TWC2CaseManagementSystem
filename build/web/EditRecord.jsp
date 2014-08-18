<%-- 
    Document   : EditRecord
    Created on : Jun 21, 2014, 12:33:17 PM
    Author     : Sion
--%>

<%@page import="src.ChiefProblem"%>
<%@page import="src.InjuryDetail"%>
<%@page import="src.CaseWorker"%>
<%@page import="src.DBConnect"%>
<%@page import="src.Worker"%>
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
                document.editForm.action ="/TWC2-CaseManagementSystem/EditRecordServlet"; 
            }
            
            
            function goBack() {
                window.history.back()
            }
           
             
        </script>
        <script src="holder.js"></script>

        <title>Edit Record</title>
    </head>
    <body style="font-family:arial;font-size:14px">

        <%
            // retrieve users from database    
            // ArrayList<Job> jobList = new ArrayList<Job>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();
            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            // get lsit of workers
            // get lsit of workers
            
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
                        <div class="headertitle"> Edit Record</div>
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
                        <form id="editForm" name="editForm" role="form"  action ="#" method="post"> 

                            <!-- Start of Worker Compliment -->

                            <% String listToSee = (String) session.getAttribute("listToSee");
//request getAttribute
// request getParameter
                                if (listToSee.equalsIgnoreCase("nickName")) {%>
                                
                             
                             
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-10">

                                <label style="margin:0">Nickname of worker</label>
                                <input class="form-control" placeholder="<%//Worker.getNicknam %>"style="left:25px;height:20px;width:30%;">  </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Passport number</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
                                <label>Passport issue</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
                                <label>Passport expiry date</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Face pic 150 x 200 pixels</label>
                                <div style="height:10px"> </div>
                                <img src ="image/<%//worker.getPhoto()%>" data-src="holder.js/150x200/auto">
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Owner of this number</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Email/QQ address or other detail</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Owner of electronic contact</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Relationship of next of kin to worker</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Phone number of next of kin</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Relationship of family member to worker</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Phone number of family member</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Phone number of friend</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Relationship to worker</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   


                            </div> 
                            <%}%> 



                            <!-- Worker's language --> 
                            <%
                                if (listToSee.equalsIgnoreCase("workersLanguage")) {
                            %>
                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
                            <div style="height:10px;"></div>
                            <div class="row1 col-md-10">

                                <label>Worker's main language</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Explain if above is 'Other'</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Spoken English standard</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Bank account number</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Bank name</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Pass number</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Pass issue date</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date discovered to be obsolete</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>IPA employer name</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>IPA basic monthly salary S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>IPA total deductions S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Relationship of giver to worker or agent or employer</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>When verbal assurances given</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Where verbal assurances given</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Where contract signed</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Relationship of opposite contracting party to job</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Basic salary</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Location of agent</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Amount paid to this agent S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Amount owed to this agent at start of work S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Employer address</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Employer phone, email contacts</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Key persons in employer</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>


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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
                                <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
                                <label>Who directed worker to this workplace?</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>When start at workplace?</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>


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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
                                <label>Date arrived Singapore for this job</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Is this first job in Singapore?</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>If not, year in which worker arrived in Singapore for first job</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>

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
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Type of accommodation</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
                                <label>Cost charged by employer per month S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
                                <label>Cost paid by self per month S$</label>
                                <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>

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
                        <button type="submit" class="btn btn-primary btn-large" onclick="onSubmit()"><span style="font-size:13px;">SAVE</span><br/> <span>View edited record</span></button>
                        <a type="button" class="btn btn-primary btn-large" onclick="goBack()"><span style="font-size:13px;"> DO NOT SAVE</span><br/> <span style="font-size:11px;">View pre-existing</span></a>                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
