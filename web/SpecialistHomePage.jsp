<%-- 
    Document   : SpecialistHomePage
    Created on : August 3, 2014, 11:57:53 AM
    Author     : Sion
--%>

<%@page import="src.User"%>
<%@page import="src.WorkerContactDetails"%>
<%@page import="src.DBConnect"%>
<%@page import="src.Worker"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="stylesheets/Andrew.css"/>
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>

        <!--javascript-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <script>
            function onLogout(){
                document.location.href="/LogoutServlet";
            }
            

            $(document).ready(function(){
                $("#Name").hide(); 
                $("#FIN").hide(); 
                $("#Gender").hide(); 
                $("#Nationality").hide(); 
                $("#SingaporePhoneNumber").hide(); 
                $("#HomeCountryPhoneNumber").hide(); 
                $("#EmployerName").hide(); 
                $("#Occupation").hide(); 
                $("#Workpass").hide(); 
                $("#ChiefProblem").hide(); 
                $("#AggravatingIssue").hide(); 
                $("#LeadCaseworker").hide(); 
                $("#AuxiliaryCaseworker").hide(); 
                $("#Hospital").hide(); 
                $("#ProblemRegisteredDate").hide(); 
                $("#BetweenDate").hide();
                
                $('#NameCheck').change(function () {
                   
                    if($('#NameCheck').prop('checked')) {
                        $('#Name').show();
                    } else {
                        $('#Name').hide();
                    }
                });
                $('#FINCheck').change(function () {
                   
                    if($('#FINCheck').prop('checked')) {
                        $('#FIN').show();
                    } else {
                        $('#FIN').hide();
                    }
                });
          
                $('#GenderCheck').change(function () {
                   
                    if($('#GenderCheck').prop('checked')) {
                        $('#Gender').show();
                    } else {
                        $('#Gender').hide();
                    }
                });
          
                $('#NationalityCheck').change(function () {
                   
                    if($('#NationalityCheck').prop('checked')) {
                        $('#Nationality').show();
                    } else {
                        $('#Nationality').hide();
                    }
                });
          
                $('#SingaporePhoneNumberCheck').change(function () {
                   
                    if($('#SingaporePhoneNumberCheck').prop('checked')) {
                        $('#SingaporePhoneNumber').show();
                    } else {
                        $('#SingaporePhoneNumber').hide();
                    }
                });
          
                $('#HomeCountryPhoneNumberCheck').change(function () {
                   
                    if($('#HomeCountryPhoneNumberCheck').prop('checked')) {
                        $('#HomeCountryPhoneNumber').show();
                    } else {
                        $('#HomeCountryPhoneNumber').hide();
                    }
                });
          
                $('#OccupationCheck').change(function () {
                   
                    if($('#OccupationCheck').prop('checked')) {
                        $('#Occupation').show();
                    } else {
                        $('#Occupation').hide();
                    }
                });
          
                $('#EmployerNameCheck').change(function () {
                   
                    if($('#EmployerNameCheck').prop('checked')) {
                        $('#EmployerName').show();
                    } else {
                        $('#EmployerName').hide();
                    }
                });
          
                $('#ChiefProblemCheck').change(function () {
                   
                    if($('#ChiefProblemCheck').prop('checked')) {
                        $('#ChiefProblem').show();
                    } else {
                        $('#ChiefProblem').hide();
                    }
                });
          
                $('#WorkpassCheck').change(function () {
                   
                    if($('#WorkpassCheck').prop('checked')) {
                        $('#Workpass').show();
                    } else {
                        $('#Workpass').hide();
                    }
                });
          
                $('#AggravatingIssueCheck').change(function () {
                   
                    if($('#AggravatingIssueCheck').prop('checked')) {
                        $('#AggravatingIssue').show();
                    } else {
                        $('#AggravatingIssue').hide();
                    }
                });
          
                $('#LeadCaseworkerCheck').change(function () {
                   
                    if($('#LeadCaseworkerCheck').prop('checked')) {
                        $('#LeadCaseworker').show();
                    } else {
                        $('#LeadCaseworker').hide();
                    }
                });
          
                $('#AuxiliaryCaseworkerCheck').change(function () {
                   
                    if($('#AuxiliaryCaseworkerCheck').prop('checked')) {
                        $('#AuxiliaryCaseworker').show();
                    } else {
                        $('#AuxiliaryCaseworker').hide();
                    }
                });
          
                $('#HospitalCheck').change(function () {
                   
                    if($('#HospitalCheck').prop('checked')) {
                        $('#Hospital').show();
                    } else {
                        $('#Hospital').hide();
                    }
                });
          
                $('#ProblemRegisteredDateCheck').change(function () {
                   
                    if($('#ProblemRegisteredDateCheck').prop('checked')) {
                        $('#ProblemRegisteredDate').show();
                    } else {
                        $('#ProblemRegisteredDate').hide();
                    }
                });
          
                $('#BetweenDateCheck').change(function () {
                   
                    if($('#BetweenDateCheck').prop('checked')) {
                        $('#BetweenDate').show();
                    } else {
                        $('#BetweenDate').hide();
                    }
                });
          
          
      
            });
        </script>


        <title>Specialist Home Page</title>
        
    </head>
    
    <%ArrayList<Worker> nationalitySearchResults1 = DBConnect.retrieveNationalitySearchResults("Myanmar");
        
    %>
    <body>
        <%-- left side menus--%>

        <table border ="2" align="center" class="leftDivision">
            <%--1st row--%>

            <tr>
                <td rowspan="3" class="container2">

                </td>
                <td rowspan="6" class="container10" >

                </td>
                <td colspan="2" class="container5" >
                    <strong class="headertitle"> HOME PAGE FOR SPECIALIST</strong>
                </td>

                <td rowspan="2" class="container1">
                    <img src="image/logo_camans_180w.gif" style="width:100%;"/>
  <%
                      DBConnect database = new DBConnect();
                        DBConnect.connectDB();
                        ArrayList<User> userList = new ArrayList<User>();
                        userList = DBConnect.retrieveUsers();
                            User loginUser = null;
                           for (int j = 0; j < userList.size(); j++) {
                               User user1 = userList.get(j);
                                 
                            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                                loginUser = user1;
                            }
                          }
                        
                        if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                            String user = (String) request.getSession().getAttribute("username");
                    %>
                    <div style="height:12%"></div>
                    <div class="username-background">
                        <strong class="word" style="margin-left:8px;" > Hello <%= user%></strong>
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

                <%
                    String errorMsg = null;
                    if (session.getAttribute("errMsg") != null) {
                        errorMsg = (String) session.getAttribute("errMsg");
                    }
                %>


                <td rowspan="4" class="container6"> <%--container6 --%>
                    <form name="findForm"  role="form" action ="SpecialistFindFINServlet" id="createuser-form"  method="post">

                        <!-- Testing --> 
                        <div class="form-group"  style="width:100%;margin-left:10px">
                            <table> 
                                <tr>
                                    <td>
                                        <label class="col-sm-3 control-label" style="width:100%;float:left;padding-left:0;"> 
                                            Search Worker by 
                                        </label>

                                        <input type="checkbox" id ="NameCheck" value="Name">Name </input> </br> 
                                        <input type="checkbox" id ="FINCheck"value="FIN">FIN </input> </br>
                                        <input type="checkbox" id="GenderCheck" value="Gender">Gender </input> </br>
                                        <input type="checkbox" id="NationalityCheck"value="Nationality">Nationality </input> </br>
                                        <input type="checkbox" id="SingaporePhoneNumberCheck" value="SingaporePhoneNumber">Singapore phone number </input> </br>
                                        <input type="checkbox" id ="HomeCountryPhoneNumberCheck" value="HomeCountryPhoneNumber">Home country phone number </input> </br>
                                        <input type="checkbox" id="EmployerNameCheck" value="EmployerName">Employer's name </input> </br>
                                        <input type="checkbox" id="OccupationCheck" value="Occupation">Occupation </input> </br>
                                        <input type="checkbox" id="WorkpassCheck" value="Workpass">Workpass </input> </br>
                                        <input type="checkbox" id="ChiefProblemCheck" value="ChiefProblem">Chief Problem </input> </br>
                                        <input type="checkbox" id="AggravatingIssueCheck" value="AggravatingIssue">Aggravating issue </input> </br>
                                        <input type="checkbox" id="LeadCaseworkerCheck" value="LeadCaseworker">Lead caseworker </input> </br>
                                        <input type="checkbox" id="AuxiliaryCaseworkerCheck" value="AuxiliaryCaseworker">Auxiliary caseworker </input> </br>
                                        <input type="checkbox" id="HospitalCheck" value="Hospital">Hospital </input> </br>
                                        <input type="checkbox" id="ProblemRegisteredDateCheck" value="ProblemRegisteredDate">Time period when problem was registered with TWC2 </input> </br>
                                        <input type="checkbox" id="BetweenDateCheck"value="BetweenDate">Between periods </input> </br>
                                    </td>
                                    <td>
                                        <div id ="Name" class="form-group" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial worker's name 
                                            </label>
                                            <input type="text" name="Name" style="margin-left:10px;"class="form-control col-sm-6"/> 
                                       
                                        </div>

                                        <div class="form-group" id="FIN" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial FIN number
                                            </label>
                                            <input type="text" name="FIN" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="Gender" style="margin-left:10px;">

                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Gender
                                            </label>
                                            <select name="Gender" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <option value="">Select an option</option>
                                                <option value="male" >M</option>
                                                <option value="female" >F</option>
                                            </select>
                                        </div>

                                        <div class="form-group" id="Nationality" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Nationality
                                            </label>

                                            <select name="Nationality" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <!-- for loop, use list of nationality from database --> 
                                                <option value="">Select an option</option>
                                                <option value="Korea" >Korea</option>
                                                <option value="Myanmar" >Myanmar</option>

                                            </select>
                                        </div>

                                        <div class="form-group" id="SingaporePhoneNumber" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial Singapore phone number
                                            </label>
                                            <input type="text" name="SingaporePhoneNumber" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="HomeCountryPhoneNumber" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial home country phone number
                                            </label>
                                            <input type="text" name="HomeCountryPhoneNumber" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="EmployerName" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial employer's name
                                            </label>
                                            <input type="text" name="EmployerName" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="Occupation" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Full or partial occupation
                                            </label>
                                            <input type="text" name="Occupation" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="Workpass" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Workpass type that came with the job
                                            </label>
                                            <select name="Workpass" class="form-control col-md-2" style="width:100%;margin-left:10px;">
                                                <!-- use for loop, retrieve list of workpass types from database --> 
                                                <option value="w1" >W1</option>
                                                <option value="w2" >W2</option>
                                            </select> 
                                        </div>

                                        <div class="form-group" id="ChiefProblem" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Chief problem
                                            </label>
                                            <select name="ChiefProblem" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <!-- use for loop, retrieve list of Chief Problem types from database --> 
                                                <option value="p1" >p1</option>
                                                <option value="p2" >p2</option>
                                            </select> 
                                        </div>

                                        <div class="form-group" id="AggravatingIssue" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Aggravating issue
                                            </label>
                                            <select name="AggravatingIssue" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <!-- use for loop, retrieve list of Aggravating Issue types from database --> 
                                                <option value="i1" >i1</option>
                                                <option value="i2" >i2</option>
                                            </select> 
                                        </div>

                                        <div class="form-group" id="LeadCaseworker" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Lead caseworker
                                            </label>
                                            <input type="text" name="LeadCaseworker" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="AuxiliaryCaseworker" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Auxiliary caseworker
                                            </label>
                                            <input type="text" name="AuxiliaryCaseworker" style="margin-left:10px;" class="form-control col-sm-6"/> 
                                        </div>

                                        <div class="form-group" id="Hospital" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Hospital
                                            </label>

                                            <select name="Hospital" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <!-- use for loop, retrieve list of hospital types from database --> 
                                                <option value="hospital1" >hospital1</option>
                                                <option value="hospital2" >hospital2</option>
                                            </select> 
                                        </div>

                                        <div class="form-group" id="ProblemRegisteredDate" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Time when his problem was registered with TWC2 
                                            </label>
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                From
                                            </label>
                                            <input type="Date" name="ProblemRegisteredDateFrom" class="form-control col-sm-5" style="margin-left:10px;width:70%">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                To
                                            </label>
                                            <input type="Date" name="ProblemRegisteredDateTo" class="form-control col-sm-5" style="margin-left:10px;width:70%">
                                        </div>

                                        <div class="form-group" id="BetweenDate" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Between these dates (dd-mm-yyyy)
                                            </label>
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                From
                                            </label>
                                            <input type="Date" name="BetweenDateFrom" class="form-control col-sm-5" style="margin-left:10px;width:70%">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                To
                                            </label>
                                            <input type="Date" name="BetweenDateTo" class="form-control col-sm-5" style="margin-left:10px;width:70%">

                                        </div>

                                        <!-- --> 
                                    </td>
                                </tr>
                            </table>
                        </div> 



                        <div class="form-group" style="margin-top:50px;margin-left:10px;float:left;">
                            <button type="submit" class="btn btn-primary btn-large">FIND</button>
                            <% if (errorMsg != null || session.getAttribute("notFoundMsg") != null) {%>
                            <a type =" button" class ="btn btn-primary btn-large" href="CreateProfiles.jsp">Create Profiles </a>
                            <%}%>
                        </div>     
                    </form>



                    <% if (session.getAttribute("errMsg") != null) {%>
                    <label style="color:red"><%=errorMsg%></label> <%}%>
                    <%session.removeAttribute("errMsg");%>
                    
                    <%
                    String searchResults = null;
                    if (session.getAttribute("searchResults") != null) {
                        searchResults = (String) session.getAttribute("searchResults");
                    }%>
                    
                    <% if (session.getAttribute("searchResults") != null) {%>
                    <label style="color:green"><%=searchResults%></label> 
                    <br>
                    <a href="CaseMenu.jsp"><label style="color:green"><%=session.getAttribute("workerName")%></label></a>
                    <%}%>
                    <%session.removeAttribute("searchResults");%>

                    <!-- Nationality Search Results -->
                    
                   <% String workerName = null;%>
                   <%
                    String nationalitySearchReesultMsg = null;
                    if (session.getAttribute("nationalitySearchResultsMsg") != null) {
                        nationalitySearchReesultMsg = (String) session.getAttribute("nationalitySearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("nationalitySearchResultsMsg") != null) {%>
                    <label style="color:green"><%=nationalitySearchReesultMsg%></label></a> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("nationalitySearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> nationalitySearchResults = null;
                    if (session.getAttribute("nationalitySearchResults") != null) {
                        nationalitySearchResults = (ArrayList<Worker>)session.getAttribute("nationalitySearchResults");
                    }%>
                    
                     <% if (session.getAttribute("nationalitySearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<nationalitySearchResults.size();i++){ 
 
                         Worker worker = nationalitySearchResults.get(i);
                         workerName  = worker.getWorkerName();%>
                         <a href="/TWC2-CaseManagementSystem/CaseMenu.jsp?userToView=<%=i%>"><label style="color:green"><%=workerName%></label></a> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    <!-- SG phone number search Results -->
                                        
                   <%
                    String contactDetailsSearchResultsMsg = null;
                    if (session.getAttribute("contactDetailsSearchResultsMsg") != null) {
                        contactDetailsSearchResultsMsg = (String) session.getAttribute("contactDetailsSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("contactDetailsSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=contactDetailsSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("contactDetailsSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<WorkerContactDetails> contactDetailsSearchResults = null;
                    if (session.getAttribute("contactDetailsSearchResults") != null) {
                        contactDetailsSearchResults = (ArrayList<WorkerContactDetails>)session.getAttribute("contactDetailsSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("contactDetailsSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<contactDetailsSearchResults.size();i++){ 
                         WorkerContactDetails worker = contactDetailsSearchResults.get(i);
                         workerName  = worker.getWorkerName();%>
                     <label style="color:green"><%=workerName%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    
                    <!-- Gender Search Results -->
                    <%
                    String genderSearchResultsMsg = null;
                    if (session.getAttribute("genderSearchResultsMsg") != null) {
                        genderSearchResultsMsg = (String) session.getAttribute("genderSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("genderSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=genderSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("genderSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> genderSearchResults = null;
                    if (session.getAttribute("genderSearchResults") != null) {
                        genderSearchResults = (ArrayList<Worker>)session.getAttribute("genderSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("genderSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<genderSearchResults.size();i++){ 
                         Worker worker = genderSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                         <a href="/TWC2-CaseManagementSystem/CaseMenu.jsp?userToView=<%=i%>"><label style="color:green"><%=workername%></label></a>
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Name Search Results -->
                    <%
                    String nameSearchResultsMsg = null;
                    if (session.getAttribute("nameSearchResultsMsg") != null) {
                        nameSearchResultsMsg = (String) session.getAttribute("nameSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("nameSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=nameSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("nameSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> nameSearchResults = null;
                    if (session.getAttribute("nameSearchResults") != null) {
                        nameSearchResults = (ArrayList<Worker>)session.getAttribute("nameSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("nameSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<nameSearchResults.size();i++){ 
                         Worker worker = nameSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- FIN Search Results -->
                    <%
                    String FINSearchResultsMsg = null;
                    if (session.getAttribute("FINSearchResultsMsg") != null) {
                        FINSearchResultsMsg = (String) session.getAttribute("FINSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("FINSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=FINSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("FINSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> FINSearchResults = null;
                    if (session.getAttribute("FINSearchResults") != null) {
                        FINSearchResults = (ArrayList<Worker>)session.getAttribute("FINSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("FINSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<FINSearchResults.size();i++){ 
                         Worker worker = FINSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Home Country Phone Number Search Results -->
                    <%
                    String homeCountryPhoneNumberSearchResultsMsg = null;
                    if (session.getAttribute("homeCountryPhoneNumberSearchResultsMsg") != null) {
                        homeCountryPhoneNumberSearchResultsMsg = (String) session.getAttribute("homeCountryPhoneNumberSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("homeCountryPhoneNumberSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=homeCountryPhoneNumberSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("homeCountryPhoneNumberSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> HomeCountryPhoneNumberSearchResults = null;
                    if (session.getAttribute("HomeCountryPhoneNumberSearchResults") != null) {
                        HomeCountryPhoneNumberSearchResults = (ArrayList<Worker>)session.getAttribute("HomeCountryPhoneNumberSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("HomeCountryPhoneNumberSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<HomeCountryPhoneNumberSearchResults.size();i++){ 
                         Worker worker = HomeCountryPhoneNumberSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Employer Name Search Results -->
                    <%
                    String employerNameSearchResultsMsg = null;
                    if (session.getAttribute("employerNameSearchResultsMsg") != null) {
                        employerNameSearchResultsMsg = (String) session.getAttribute("employerNameSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("employerNameSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=employerNameSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("employerNameSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> employerNameSearchResults = null;
                    if (session.getAttribute("employerNameSearchResults") != null) {
                        employerNameSearchResults = (ArrayList<Worker>)session.getAttribute("employerNameSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("employerNameSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<employerNameSearchResults.size();i++){ 
                         Worker worker = employerNameSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Occupation Search Results -->
                    <%
                    String occupationSearchResultsMsg = null;
                    if (session.getAttribute("occupationSearchResultsMsg") != null) {
                        occupationSearchResultsMsg = (String) session.getAttribute("occupationSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("occupationSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=occupationSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("occupationSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> occupationSearchResults = null;
                    if (session.getAttribute("occupationSearchResults") != null) {
                        occupationSearchResults = (ArrayList<Worker>)session.getAttribute("occupationSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("occupationSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<occupationSearchResults.size();i++){ 
                         Worker worker = occupationSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Workpass Search Results -->
                    <%
                    String workpassSearchResultsMsg = null;
                    if (session.getAttribute("workpassSearchResultsMsg") != null) {
                        workpassSearchResultsMsg = (String) session.getAttribute("workpassSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("workpassSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=workpassSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("workpassSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> workpassSearchResults = null;
                    if (session.getAttribute("workpassSearchResults") != null) {
                        workpassSearchResults = (ArrayList<Worker>)session.getAttribute("workpassSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("workpassSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<workpassSearchResults.size();i++){ 
                         Worker worker = workpassSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Chief Problem Search Results -->
                    <%
                    String chiefProblemSearchResultsMsg = null;
                    if (session.getAttribute("chiefProblemSearchResultsMsg") != null) {
                        chiefProblemSearchResultsMsg = (String) session.getAttribute("chiefProblemSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("chiefProblemSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=chiefProblemSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("chiefProblemSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> chiefProblemSearchResults = null;
                    if (session.getAttribute("chiefProblemSearchResults") != null) {
                        chiefProblemSearchResults = (ArrayList<Worker>)session.getAttribute("chiefProblemSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("chiefProblemSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<chiefProblemSearchResults.size();i++){ 
                         Worker worker = chiefProblemSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Aggravating Issue Search Results -->
                    <%
                    String aggravatingIssueSearchResultsMsg = null;
                    if (session.getAttribute("aggravatingIssueSearchResultsMsg") != null) {
                        aggravatingIssueSearchResultsMsg = (String) session.getAttribute("aggravatingIssueSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("aggravatingIssueSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=aggravatingIssueSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("aggravatingIssueSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> aggravatingIssueSearchResults = null;
                    if (session.getAttribute("aggravatingIssueSearchResults") != null) {
                        aggravatingIssueSearchResults = (ArrayList<Worker>)session.getAttribute("aggravatingIssueSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("aggravatingIssueSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<aggravatingIssueSearchResults.size();i++){ 
                         Worker worker = aggravatingIssueSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Lead Caseworker Search Results -->
                    <%
                    String leadCaseworkerSearchResultsMsg = null;
                    if (session.getAttribute("leadCaseworkerSearchResultsMsg") != null) {
                        leadCaseworkerSearchResultsMsg = (String) session.getAttribute("leadCaseworkerSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("leadCaseworkerSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=leadCaseworkerSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("leadCaseworkerSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> leadCaseworkerSearchResults = null;
                    if (session.getAttribute("leadCaseworkerSearchResults") != null) {
                        leadCaseworkerSearchResults = (ArrayList<Worker>)session.getAttribute("leadCaseworkerSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("leadCaseworkerSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<leadCaseworkerSearchResults.size();i++){ 
                         Worker worker = leadCaseworkerSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    
                    <!-- Auxiliary Caseworker Search Results -->
                    <%
                    String auxiliaryCaseworkerSearchResultsMsg = null;
                    if (session.getAttribute("auxiliaryCaseworkerSearchResultsMsg") != null) {
                        auxiliaryCaseworkerSearchResultsMsg = (String) session.getAttribute("auxiliaryCaseworkerSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("auxiliaryCaseworkerSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=auxiliaryCaseworkerSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("auxiliaryCaseworkerSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> auxiliaryCaseworkerSearchResults = null;
                    if (session.getAttribute("auxiliaryCaseworkerSearchResults") != null) {
                        auxiliaryCaseworkerSearchResults = (ArrayList<Worker>)session.getAttribute("auxiliaryCaseworkerSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("auxiliaryCaseworkerSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<auxiliaryCaseworkerSearchResults.size();i++){ 
                         Worker worker = auxiliaryCaseworkerSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Hospital Search Results -->
                    <%
                    String hospitalSearchResultsMsg = null;
                    if (session.getAttribute("hospitalSearchResultsMsg") != null) {
                        hospitalSearchResultsMsg = (String) session.getAttribute("hospitalSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("hospitalSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=hospitalSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("hospitalSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> hospitalSearchResults = null;
                    if (session.getAttribute("hospitalSearchResults") != null) {
                        hospitalSearchResults = (ArrayList<Worker>)session.getAttribute("hospitalSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("hospitalSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<hospitalSearchResults.size();i++){ 
                         Worker worker = hospitalSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    
                    <!-- Problem Registered Date Search Results -->
                    <%
                    String problemRegisteredDateSearchResultsMsg = null;
                    if (session.getAttribute("problemRegisteredDateSearchResultsMsg") != null) {
                        problemRegisteredDateSearchResultsMsg = (String) session.getAttribute("problemRegisteredDateSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("problemRegisteredDateSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=problemRegisteredDateSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("problemRegisteredDateSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> problemRegisteredDateSearchResults = null;
                    if (session.getAttribute("problemRegisteredDateSearchResults") != null) {
                        problemRegisteredDateSearchResults = (ArrayList<Worker>)session.getAttribute("problemRegisteredDateSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("problemRegisteredDateSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<problemRegisteredDateSearchResults.size();i++){ 
                         Worker worker = problemRegisteredDateSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
					 
                    <%}%>
                    
                    
                    
                    
                    <!-- Between Date Search Results -->
                    <%
                    String betweenDateSearchResultsMsg = null;
                    if (session.getAttribute("betweenDateSearchResultsMsg") != null) {
                        betweenDateSearchResultsMsg = (String) session.getAttribute("betweenDateSearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("betweenDateSearchResultsMsg") != null) {%>
                    <label style="color:green"><%=betweenDateSearchResultsMsg%></label> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("betweenDateSearchResultsMsg");%>
                    
                    
                     <%
                    ArrayList<Worker> betweenDateSearchResults = null;
                    if (session.getAttribute("betweenDateSearchResults") != null) {
                        betweenDateSearchResults = (ArrayList<Worker>)session.getAttribute("betweenDateSearchResults");
                    }%>
                    
                     <% if (session.getAttribute("betweenDateSearchResults") != null) {%>
                     <%String workername = null;%>
                     <%for(int i=0; i<betweenDateSearchResults.size();i++){ 
                         Worker worker = betweenDateSearchResults.get(i);
                         workername = worker.getWorkerName();%>
                     <label style="color:green"><%=workername%></label> 
                     <br>     
                     <% }%>
                    <%}%>
                    
                    
                    
                    <!-- Search Not Found Message -->
                    <%
                    String notFoundMsg = null;
                    if (session.getAttribute("notFoundMsg") != null) {
                        notFoundMsg = (String) session.getAttribute("notFoundMsg");
                    }%>
                    
                    <% if (session.getAttribute("notFoundMsg") != null) {%>
                    <label style="color:red;"><%=notFoundMsg%></label> <%}%>
                    <br>
                    
                    <%session.removeAttribute("notFoundMsg");%>
                </td>


                <td class="container11">

                </td>


            </tr>
            
            <%
                String jobPosition = loginUser.getJobTitle();%>
            <%--3rd row--%>
            <tr>
                <td rowspan="3" colspan="2" class="container7" style="border:none;" > <%--container7 --%>
                    <ul class="navigation-menu">
                        <li><a href="ViewAllUsers.jsp" class="menu-link">ALL USERS</a></li>
                        <li><a href="ViewMyProfile.jsp" class="menu-link">MY PROFILE</a></li>
                        <li><a href="" class="menu-link">STANDARD REPORT</a></li>
                        <li><a href="AssociateHomePage.jsp" class="menu-link">ASSOCIATES' FORMS</a></li>
                        <%if(jobPosition.equalsIgnoreCase("Management") || jobPosition.equalsIgnoreCase("Administrator")) {%>
                        <li><a href="ManagerHomePage.jsp" class="menu-link">MANAGER's FORMS</a></li>
                        <%}%>
                        <%if(jobPosition.equalsIgnoreCase("Administrator")) {%>
                        <li><a href="AdminHomePage.jsp" class="menu-link">ADMINISTRATOR'S FORM</a></li>
                        <%}%>
                    </ul>

                </td>


            </tr>
            <%--4th row--%>
            <tr>
                <td class="container3" style="border:none;">

                </td>

            </tr>
            <%--5th row--%>
            <tr>
                <td rowspan="2" class="container4" style="border:none;">
                </td>


            </tr>
            <%--6th row--%>
            <tr>

                <td colspan="3" class="container9" style="border:none;">

                </td>
            </tr>
        </table>

    </body>
</html>

