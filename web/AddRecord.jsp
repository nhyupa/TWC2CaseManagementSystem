<%-- 
    Document   : AddRecord
    Created on : Jun 26, 2014, 12:10:28 AM
    Author     : Sion
--%>

<%@page import="src.ChiefProblem"%>
<%@page import="src.CaseWorker"%>
<%@page import="src.InjuryDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>

        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.min.css"/>

        <!--custom stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/style.css"/>

        <!--jasny-bootstrap v3.1.3-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/jasny-bootstrap.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>


        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  
        <script>
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
       
            function onSubmit() {
                document.addRecordForm.action ="/TWC2-CaseManagementSystem/AddRecordServlet"; 
            }
            
            
            function goBack() {
                window.history.back()
            }
           
        </script>

        <title>Add Record</title>
    </head>

    <%
        String FIN = (String) session.getAttribute("FIN");
        String jobKey = (String) session.getAttribute("jobKey");
        String probKey = (String) session.getAttribute("probKey");
        String workerName = DBConnect.getWorkername(FIN);
        String phoneNumber = null;


        ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails(FIN, jobKey);
        ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails(FIN);

        CaseWorker caseWorker = null;
        InjuryDetail injuryDetail = null;
        if (caseWorkerDetails.size() != 0) {
            caseWorker = caseWorkerDetails.get(caseWorkerDetails.size() - 1);
        }
        if (injuryDetails.size() != 0) {
            injuryDetail = injuryDetails.get(injuryDetails.size() - 1);
        }

        ArrayList<String> nationalities = DBConnect.getNationalitieslists();
        ArrayList<String> workpass = DBConnect.getWorkPassList();
        ArrayList<String> languageDetails = DBConnect.getLanguagelists();
        ArrayList<String> workhistoryTypes = DBConnect.getWorkHistoryHowType();
        ArrayList<String> accomodationProvidedTypes = DBConnect.getAccomodationProvidedTypes();
        ArrayList<String> accomodationTypes = DBConnect.getAccomodationTypes();
        ArrayList<String> agentLocationTypes = DBConnect.getAgentLocationTypes();
        ArrayList<String> salaryPaymentTypes = DBConnect.getSalaryPaymentTypes();
        

    %>
    <body style="font-size:14px;font-family:arial;">
        <%-- left side menus--%>
        <div class="leftDivision">
            <table border ="2" align="center" style="width:100%">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2" valign="center">
                        <div style="font-weight:bold; font-size:16px; font-weight:bold;margin-left:20px;">Worker Stub</div>
                        <div style="height:20px;"></div>
                        <div class="workername" style="margin-left:20px;"> 
                            <label style="margin:0">Name of worker</label>
                            <p class="form-control" style="left:25px; height:25px; width:80%;margin:0"> <%=workerName%> </p>
                        </div>
                        <div class="col-md-6" style="padding:0 0 10px 0;">
                            <div class="finnumber" style="margin-left:20px;"> 
                                <label style="margin:0"> FIN number</label>
                                <p class="form-control" style="left:25px;height:25px;margin:0"> <%=FIN%> </p>
                            </div>
                            <div class="phone" style="margin-left:20px;"> 
                                <label style="margin:0">Phone</label>
                                <p class="form-control" style="left:25px; height:25px;margin:0"> <%=DBConnect.getPhoneNumber(FIN)%> </p>
                            </div>
                            <div style="height:80px;"></div>
                            <a href="/TWC2-CaseManagementSystem/ViewWorkerProfile.jsp" style="margin-left:20px">View full profile</a>

                        </div>
                        <%String pictureName = DBConnect.getWorkerPicture(FIN);

                        %>
                        <div class="col-md-5">
                            <div style="height:10px;"></div>
                            <div class="thumbnail" style="width: 120px; height: 160px;"><img src ="WorkerFacePicture/<%=pictureName%>"></div>
                        </div>

                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td colspan="2"class="container5">
                        <div class="headertitle" style="font-size:18px"><bold>ADD RECORD</bold> </div>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div style="height:30px"> </div>
                        <div class="username-background" style="height:40%">
                            <strong class="word" style="margin-left:8px;"> Hello <%= user%></strong>
                            </br>
                            <button style="margin-left:2px;" type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                        </div>
                        <%
                            }
                        %>


                    </td>

                </tr>
                <%--2nd row--%>

                <tr>

                    <td rowspan="4" class="container6" valign="top" > <%--container6 --%>

                        <% if (request.getAttribute("regMsg") != null) {
                                String regMsg = (String) request.getAttribute("regMsg");%>
                        <label><%=regMsg%></label> <%}%>

                        <div style="padding-left:20px; width:130%">


                            <form id="addRecordForm" name="addRecordForm" role="form"  action ="AddRecordServlet" method="post" enctype="multipart/form-data"> 

                                <!-- Start of Worker Compliment -->

                                <% String listToSee = (String) session.getAttribute("listToSee");
                                    //request getAttribute
                                    // request getParameter
                                    if (listToSee.equalsIgnoreCase("nickName")) {%>



                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="margin:0">Nickname of worker</label>
                                    <input class="form-control" name="nickName" placeholder="<%//Worker.getNicknam %>" style="margin-left:10px;width:60%;">  </input>
                                </div>

                                <%}%> 



                                <!-- passport Details --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("passportDetails")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Passport details</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%;">Passport country</label>
                                    <select name="country" class="form-control col-md-2" style="margin-left:10px;width:60%;">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < nationalities.size(); i++) {%>
                                        <option value="<%=nationalities.get(i)%>" ><%=nationalities.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">Passport number</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="passport_number"></input>
                                    <label>Passport issue date</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="passport_issue"></input>
                                    <label>Passport expiry date</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="passport_expiry_date"></input>
                                </div>
                                <% }%>


                                <!-- Face Photo --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("facePhoto")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Face photo</div>
                                <div style="height:10px;"></div>
                                <div style="margin-left:10px;">
                                    <label>Date stamp</label>
                                    <input class="form-control" type="date" name="dateStamp" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
                                    <label>Face pic 120 x 160 pixels</label>
                                    <div style="height:10px;margin-left:10px;"> </div>
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail">
                                            <img style="width:120px;height:160px" src="image/<%%>">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 120px; max-height: 160px;"></div>
                                        <div>
                                            <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                        </div>
                                    </div>

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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="sgPhoneNumber"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type ="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="phoneObsoleteDate"></input>
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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="homeCountryPhoneNum"> </input>
                                    <label>Owner of this number</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="homePhoneNumOwner"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type ="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="homeNumObsoleteDate"> </input>   

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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="workerSgAddr"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="workerSgAddrObsoleteDate">  </input>   

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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="homeCountryAddress"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="homeCountryAddrObsoleteDate"> </input>   

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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="digitalContactType"> </input>
                                    <label>Email/QQ address or other detail</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="emailAddress"> </input>   
                                    <label>Owner of electronic contact</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="electronicContactOwner"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="electronicContactObsoleteDate"> </input>   

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
                                    <input class="form-control" placeholder=" <% %>" name ="kinName" style="margin-left:10px;width:60%;">  </input>
                                    <label>Relationship of next of kin to worker</label>
                                    <input class="form-control" placeholder=" <% %>" name="kinRelationship" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Phone number of next of kin</label>
                                    <input class="form-control" placeholder=" <% %>" name="kinPhoneNum" style="margin-left:10px;width:60%;">  </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" name="obsoleteDate" style="margin-left:10px;width:60%;">  </input>   
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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="familyMemberName">  </input>
                                    <label>Relationship of family member to worker</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="familyMemberRelationship"> </input>   
                                    <label>Phone number of family member</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="familyMemberPhoneNumber">  </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="FamilyMemberDateObsolete">  </input>   
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
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="friendName"> </input>
                                    <label>Phone number of friend</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="friendPhone"> </input>   
                                    <label>Relationship to worker</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="workerRelationship">  </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;" name="friendobsoleteDate">  </input>   


                                </div> 
                                <%}%> 



                                <!-- Worker's language --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("workersLanguage")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%;">Worker's main language</label>
                                    <select name="workerMainLanguage" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < languageDetails.size(); i++) {%>
                                        <option value="<%=languageDetails.get(i)%>" ><%=languageDetails.get(i)%></option>

                                        <%}%>

                                    </select>

                                    <label style="width:80%;">Explain if above is 'Other'</label>
                                    <input class="form-control" placeholder=" <% %>" name="otherLanaguage" style="margin-left:10px;width:60%;"> </input>   
                                    <label>Spoken English standard</label>
                                    <input class="form-control" placeholder=" <% %>" name="spokenEnglishStandard" style="margin-left:10px;width:60%;"> </input>

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
                                    <input class="form-control" placeholder=" <% %>" name="bankAccName" style="margin-left:10px;width:60%;">  </input>
                                    <label>Bank account number</label>
                                    <input class="form-control" placeholder=" <% %>" name="bankAccNumber" style="margin-left:10px;width:60%;"> </input>   
                                    <label>Bank name</label>
                                    <input class="form-control" placeholder=" <% %>" name="bankName" style="margin-left:10px;width:60%;"> </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" name="bankObsoleteDate" style="margin-left:10px;width:60%;">  </input>
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

                                    <label style="width:80%;">Pass type</label>
                                    <select name="passType" class="form-control col-md-2" style="margin-left:10px;width:60%;">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < workpass.size(); i++) {%>
                                        <option value="<%=workpass.get(i)%>" ><%=workpass.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">Pass number</label>
                                    <input class="form-control" placeholder=" <% %>" name="passNumber" style="margin-left:10px;width:60%;"> </input>   
                                    <label>Pass issue date</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" name="passIssueDate" style="margin-left:10px;width:60%;" > </input>
                                    <label>Date discovered to be obsolete</label>
                                    <input type="date" class="form-control" placeholder=" <% %>" name="passObsolete" style="margin-left:10px;width:60%;" > </input>
                                </div> 
                                <%}%> 


                                <!-- IPA details --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("IPADetails")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">IPA details</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%;">Workpass specified in IPA</label>
                                    <select name="workpassSpecified" class="form-control col-md-2" style="margin-left:10px;width:60%;">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < workpass.size(); i++) {%>
                                        <option value="<%=workpass.get(i)%>" ><%=workpass.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">IPA employer name</label>
                                    <input class="form-control" name="ipaEmployerName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>IPA basic monthly salary S$</label>
                                    <input class="form-control" name="ipaBasicMonthlySalary" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
                                    <label>IPA total deductions S$</label>
                                    <input class="form-control" name="ipaTotalDeductions" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
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
                                    <input class="form-control" name="giverName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Relationship of giver to worker or agent or employer</label>
                                    <input class="form-control" name="giverRelationship" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>When verbal assurances given</label>
                                    <input type="date" class="form-control" name="givenDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Where verbal assurances given</label>
                                    <input class="form-control" name="givenPlace" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
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
                                    <input type="date" class="form-control" name="contractDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Where contract signed</label>
                                    <input class="form-control" name="contractSigned" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Relationship of opposite contracting party to job</label>
                                    <input class="form-control" name="contractRelationship" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Basic salary</label>
                                    <input class="form-control" name="contractBasicSalary" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                </div>
                                <%}%>                      



                                <!-- Intermediary agent --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("intermediaryAgent")) {
                                %>

                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Intermediary agent</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%;">Agent company name </label>
                                    <input class="form-control" name="agentCompanyName" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
                                    <label style="width:80%;">Location of agent</label>
                                    <select name="agentLocation" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of agent location type from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < agentLocationTypes.size(); i++) {%>
                                        <option value="<%=agentLocationTypes.get(i)%>" ><%=agentLocationTypes.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">Amount paid to this agent S$</label>
                                    <input class="form-control" name="agentAmountPaid" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Amount owed to this agent at start of work S$</label>
                                    <input class="form-control" name="agentMoneyOwed" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>

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
                                    <input class="form-control" name="employerName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Employer address</label>
                                    <input class="form-control" name="employerAddress" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Employer phone, email contacts</label>
                                    <input class="form-control" name="employerContacts" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
                                    <label>Key persons in employer</label>
                                    <input class="form-control" name="employerKey" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>


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
                                    <input class="form-control" name="workplaceType" placeholder=" <% %>" style="margin-left:10px;width:60%;"></input>
                                    <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
                                    <input class="form-control" name="workplaceWhose" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>   
                                    <label>Who directed worker to this workplace?</label>
                                    <input class="form-control" name="workplaceDirect" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>
                                    <label>When start at workplace?</label>
                                    <input type="date" class="form-control" name="workplaceStart" placeholder=" <% %>" style="margin-left:10px;width:60%;"></input>


                                </div> 
                                <%}%>          

                                <!-- Work history  --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("workHistory")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Work history</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%">How did worker get into the job defined in Job Profile?  </label>
                                    <select name="getWorkHow" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of workhistory type from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < workhistoryTypes.size(); i++) {%>
                                        <option value="<%=workhistoryTypes.get(i)%>" ><%=workhistoryTypes.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%">Date arrived Singapore for this job</label>
                                    <input type="date" class="form-control" name="singaporeArrivalDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label style="width:80%">Is this first job in Singapore?</label>
                                    <select name="firstJobWhether" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <option value="Y">Yes</option>
                                        <option value="N">No</option>
                                    </select>
                                    <label style="width:80">If not, year in which worker arrived in Singapore for first job</label>
                                    <input class="form-control" name="firstJobArrival" placeholder=" <% %>" style="margin-left:10px;width:60%;"> </input>

                                </div> 
                                <%}%>           

                                <!-- Work history  --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("accommodationDuringWork")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Accommodation During Work</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:80%;">Accommodation provided by employer?  </label>
                                    <select name="accomodationProvided" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < accomodationProvidedTypes.size(); i++) {%>
                                        <option value="<%=accomodationProvidedTypes.get(i)%>" ><%=accomodationProvidedTypes.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">Type of accommodation</label>
                                    <select name="accomodationType" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of nationality from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < accomodationTypes.size(); i++) {%>
                                        <option value="<%=accomodationTypes.get(i)%>" ><%=accomodationTypes.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label>Cost charged by employer per month S$</label>
                                    <input class="form-control" name="employerMonthlyCost" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Cost paid by self per month S$</label>
                                    <input class="form-control" name="selfPaidCost" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     


                                <!-- End of Job Compliement -->
                                <%
                                    if (listToSee.equalsIgnoreCase("aggravatingIssue")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Aggravating issue</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Aggravating issue </label>
                                    <input class="form-control" name="aggravatingIssue" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Explain if at left is 'Other'</label>
                                    <input class="form-control" name="aggravatingIssueOther" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Monetary loss/value of this aggravating issue S$</label>
                                    <input class="form-control" name="monetaryloss" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Remarks about aggravating issue</label>
                                    <input class="form-control" name="aggravatingIssueRemarks" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Lead caseworker --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("leadCaseworker")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Lead caseworker</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Lead caseworker </label>
                                    <input class="form-control" name="leadCaseWorker" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Start Date</label>
                                    <input type="date" class="form-control" name="caseWorkerStartDate" placeholder=" <% %>"  style="margin-left:10px;width:60%;">  </input>   
                                    <label>End Date</label>
                                    <input type="date" class="form-control" name="caseWorkerEndDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     


                                <!-- Auxiliary caseworker --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("auxiliaryCaseworker")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Auxiliary caseworker</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Auxiliary caseworker </label>
                                    <input class="form-control" name="auxCaseWorkerName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Start Date</label>
                                    <input type="date" class="form-control" name="auxStartDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>End Date</label>
                                    <input type="date" class="form-control" name="auxEndDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Salary & related history --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("salaryRelatedHistory")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Salary & related history</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label style="width:70%;">Describe complaint about basic salary incorrect or not paid </label>
                                    <input class="form-control" name="basicSalaryComplaint" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label style="width:80%;">Mode of salary payment</label>
                                    <select name="salaryPaymentMode" class="form-control col-md-2" style="margin-left:10px;width:60%">
                                        <!-- for loop, use list of salary Payment type from database --> 
                                        <option value="">Select an option</option>
                                        <%for (int i = 0; i < salaryPaymentTypes.size(); i++) {%>
                                        <option value="<%=salaryPaymentTypes.get(i)%>" ><%=salaryPaymentTypes.get(i)%></option>

                                        <%}%>

                                    </select>
                                    <label style="width:80%;">Estimated total value of claim S$</label>
                                    <input class="form-control" name="estimatedClaim" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Estimated 12 months' value of claim S$</label>
                                    <input class="form-control" name="estimated12monthsClaim" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     

                                <!-- Injury history --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("injuryHistory")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Injury history</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of injury </label>
                                    <input type="date" class="form-control" name="injuryDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Location where incident occurred</label>
                                    <input class="form-control" name="incidentLocation" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Body part(s) injured</label>
                                    <input class="form-control" name="bodyPartInjured" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Where (clinic/hospital) initially treated</label>
                                    <input class="form-control" name="locationTreated" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Illness history --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("illnessHistory")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Illness history</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>When illness began </label>
                                    <input class="form-control" name="illnessBegan" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>When illness diagnosed</label>
                                    <input class="form-control" name="diagnosedIllness" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Nature of illness</label>
                                    <input class="form-control" name="illnessNature" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Does worker consider illness work-related?</label>
                                    <input class="form-control" name="workRelatedIllness" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Details/history other problems --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("detailsHistoryOtherProblems")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Details/history other problems</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Describe details of problem if it's not salary/injury/illness </label>
                                    <input class="form-control" name="otherProblems" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Estimated value of claim S$</label>
                                    <input class="form-control" name="estimatedValueClaim" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   

                                </div> 
                                <%}%>     
                                <!-- Trafficking indicators --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("traffickingIndicators")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;"> Trafficking indicators </div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date this assessment made </label>
                                    <input type="date" class="form-control" name="assessmentDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Name of TWC2 person making this assessment</label>
                                    <input class="form-control" name="assessmentPerson" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Describe other indicators of trafficking complained of</label>
                                    <input class="form-control" name="traffickingComplaint" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Describe other indicators of trafficking observed</label>
                                    <input class="form-control" name="otherTrafficking" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Salary claim lodged --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("salaryClaimLodged")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Salary claim lodged</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date claim lodged at MOM </label>
                                    <input type="date" class="form-control" name="claimLodgedDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Initial value of claim S$</label>
                                    <input class="form-control" name="initialValueOfClaim" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Describe basis for amount claimed</label>
                                    <input class="form-control" name="amountClaimedDesc" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Wica claim lodged --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("wicaClaimLodged")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Wica claim lodged</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date claim lodged at MOM </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Wica ref number</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Wica insurance company</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Wica insurance policy number</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Non-Wica med claim --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("nonWicaMedClaim")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Non-Wica med claim</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date MOM notified </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Initial value of claim S$</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Insurance company</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Insurance policy number</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Police report --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("policeReport")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Police report</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date police report made </label>
                                    <input type="date" class="form-control" name="policeReportDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Police station where report lodged</label>
                                    <input class="form-control" name="policeStation" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Accompanying TWC2 persons</label>
                                    <input class="form-control" name="accompaniedPerson" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Details of police report</label>
                                    <input class="form-control" name="policeReportDetails" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Oth complaint lodged --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("othComplaintLodged")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Oth complaint lodged</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date other complaint lodged </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Agency/authority to whom complaint addressed</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>This complaint lodged by</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>If TWC2 or third party, name of person lodging complaint?</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Case discussion --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("caseDiscussion")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case discussion</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of discussion, assistance or information-receipt </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Mode/location of discussion, assistance or information-receipt</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>TWC2 person consulted, assisting or informed</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Topic of discussion or information received</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Hospital --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("hospital")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Hospital</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of update </label>
                                    <input type="date" class="form-control" name="updateDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Current hospital</label>
                                    <input class="form-control" name="currentHospital" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Explain if at left is 'Other'</label>
                                    <input class="form-control" name="otherHospital" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Department/doctor within hospital if known</label>
                                    <input class="form-control" name="doctor" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- MC/Light Duty status --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("mcLightDutyStatus")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">MC/Light Duty status</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of update </label>
                                    <input type="date" class="form-control" name="MCUpdateDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Current MC or Light Duty status </label>
                                    <input class="form-control" name="currentMCStatus" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Latest known MC expiry date</label>
                                    <input type ="date" class="form-control" name="latestMCExpirydate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Cumulative MC days so far</label>
                                    <input class="form-control" name="cumulativeMCDays" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- R2R appts --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("r2rAppts")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">R2R appts</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of appointment </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>R2R first volunteer</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>R2R second volunteer</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Purpose of appointment</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Wica status --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("wicaStatus")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Wica status</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of update </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Wica status</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Wica points</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Wica S$ compensation</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Lawyer status --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("lawyerStatus")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Lawyer status</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of update </label>
                                    <input type="date" class="form-control" name="lawyerUpdate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>With this update, does worker have lawyer for this problem?</label>
                                    <input class="form-control" name="haveLawyer" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Name of law firm</label>
                                    <input class="form-control" name="lawFirmName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Remarks re his lawyer status</label>
                                    <input class="form-control" name="lawyerStatusRemarks" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Case milestone (non-criminal) --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("caseMilestoneNonCriminal")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (non-criminal)</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date milestone reached </label>
                                    <input type="date" class="form-control" name="dateMilestoneReached" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Milestone reached</label>
                                    <input class="form-control" name="milestoneReached" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Explain if at left is 'Other'</label>
                                    <input class="form-control" name="milestoneOther" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Remarks re milestone reached</label>
                                    <input class="form-control" name="milestoneRemarks" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Case milestone (criminal) --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("caseMilestoneCriminal")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Case milestone (criminal)</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date milestone reached </label>
                                    <input type="date" class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Milestone reached</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Details of charges</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Details of sentence</label>
                                    <input class="form-control" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Transfer, TJS, repatriation --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("transferTJSRepatriation")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Transfer, TJS, repatriation</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date of update </label>
                                    <input type="date" class="form-control" name="ttrUpdateDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Transfer, TJS or repatriation status</label>
                                    <input class="form-control" name="ttrStatus" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Date of departure from Singapore</label>
                                    <input type="date" class="form-control" name="departureDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Name of TJS or new employer</label>
                                    <input class="form-control" name="newEmployerName" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- Benefaction --> 
                                <%
                                    if (listToSee.equalsIgnoreCase("benefaction")) {
                                %>
                                <div style="font-weight:bold;font-size:16px; margin-left:10px;">Benefaction</div>
                                <div style="height:10px;"></div>
                                <div class="row1 col-md-10">

                                    <label>Date benefit given </label>
                                    <input type="date" class="form-control" name="benefitGivenDate" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Type of benefit</label>
                                    <input class="form-control" name="benefitType" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>   
                                    <label>Purpose of or reason for benefit/refund</label>
                                    <input class="form-control" name="benefitPurpose" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>
                                    <label>Value of benefit/refund S$</label>
                                    <input class="form-control" name="benefitValue" placeholder=" <% %>" style="margin-left:10px;width:60%;">  </input>

                                </div> 
                                <%}%>     
                                <!-- End of Problem Compliment -->

                        </div>


                    </td>

                    <td class="container11">
                    </td>


                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7" valign="top"> <%--container7 --%>

                    </td>


                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3">
                        <div style="font-size:16px; font-weight:bold; margin-left:20px;">Job Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Name of employer</label>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"><%=DBConnect.getEmployer(FIN)%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=DBConnect.getWorkpassType(FIN)%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=DBConnect.getOccupation(FIN)%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"><%=DBConnect.getCommencedDate(FIN)%></p>
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
                <%ChiefProblem chiefProblem = DBConnect.getProblem(FIN);%>
                <tr>
                    <td rowspan="2" class="container4" valign="top">
                        <div style="font-size:16px; font-weight:bold;color:black; margin-left:20px;">Problem Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Problem registration date</label>
                            <%if (chiefProblem != null) {%>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"> <%=chiefProblem.getProblemRegDate()%></p>
                            <%} else {%>

                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Chief problem</label>
                            <%if (chiefProblem != null) {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=chiefProblem.getChiefProblem()%>  </p>
                            <%} else {%>

                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Date of injury</label>
                            <%if (injuryDetail != null) {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=injuryDetail.getInjuryDate()%></p>
                            <%} else {%>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"></p>
                            <%}%>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Lead caseworker</label>
                            <%if (caseWorker != null) {%>
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

                    <td colspan="3" class="container9">
                        <button type="submit"class="btn btn-primary btn-large" style="margin-left:10px" onClick="onSubmit();"><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">View added record</span> </button>
                        <button type="submit"class="btn btn-primary btn-large" onClick="onSubmit2"><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">List records</span> </button>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ListRecords.jsp"><span style="font-family:arial;font-size:13px;">DO NOT SAVE</span><br/> <span style="font-family:arial;font-size:11px;">List records</span> </a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><span style="font-family:arial;font-size:13px;">DO NOT SAVE</span><br/> <span style="font-family:arial;font-size:11px;">Go to Case Menu</span> </a>
                    </td>
                </tr>
            </table>
        </div>
    </form>

</body>
</html>
