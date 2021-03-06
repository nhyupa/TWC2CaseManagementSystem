<%-- 
    Document   : SpecialistHomePage
    Created on : Jun 3, 2014, 10:47:47 AM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="stylesheets/Andrew.css"/>
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>

        <!--javascript-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        
        <!--javascript-->
        <script>
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
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
    
    <%
        DBConnect database = new DBConnect();
        DBConnect.connectDB();
        String username;
        if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
            username = (String) request.getSession().getAttribute("username");
        }
        ArrayList<User> users = database.getUsers();
        User loginUser = null;
        for (int i = 0; i < users.size(); i++) {
            User user1 = users.get(i);
            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                  loginUser = user1;
            }
        }
        ArrayList<String> nationalities = DBConnect.getNationalitieslists();
        ArrayList<String> workpass = DBConnect.getWorkPassList();
        ArrayList<String> problemLists = DBConnect.getProblemLists();
        ArrayList<String> hospitalNames = DBConnect.getHospitals();
    %>
    <body>
        <%-- left side menus--%>
        
            <table border ="2" align="center" class="leftDivision">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2">

                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td colspan="2" class="container5" >
                        <strong class="headertitle">HOME PAGE FOR SPECIALIST</strong> 
                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%;"/>

                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div style="height:12%"></div>
                        <div class="username-background">
                             <strong style="margin-left:8px;" class="word"> Hello <%= user%></strong>
                            </br>
                            <button style="margin-left:2px;" type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                        </div>
                        <%
                            }
                        %>
                    </td>

                </tr>
                <%--2nd row--%>
                <%
                    String errorMsg = null;
                    if (session.getAttribute("errMsg") != null) {
                        errorMsg = (String) session.getAttribute("errMsg");
                    }
                %>

                <tr>

                    <td rowspan="4" class="container6"> <%--container6 --%>
                        <form name="findForm"  role="form" action ="SpecialistFindFINServlet" id="createuser-form"  method="post">

                        <!-- Testing --> 
                        <div style="width:100%;margin-left:10px">
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
                                                <%for(int i = 0 ; i < nationalities.size() ; i++){%>
                                                <option value="<%=nationalities.get(i)%>" ><%=nationalities.get(i)%></option>
                                                
                                                <%}%>

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
                                                <option value="">Select an option</option>
                                                <%for(int i = 0 ; i < workpass.size() ; i++){%>
                                                <option value="<%=workpass.get(i)%>"><%=workpass.get(i)%> </option>
                                                <%}%>
                                            </select> 
                                        </div>

                                        <div class="form-group" id="ChiefProblem" style="margin-left:10px;">
                                            <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                                Chief problem
                                            </label>
                                            <select name="ChiefProblem" class="form-control col-md-2" style="margin-left:10px;width:100%">
                                                <%for(int i =0 ; i < problemLists.size(); i++){%>
                                                <option value="<%=problemLists.get(i)%>" ><%=problemLists.get(i)%></option>
                                                <%}%>
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
                                                <%for(int i =0 ; i < hospitalNames.size(); i++){%>
                                                <option value="<%=hospitalNames.get(i)%>" ><%=hospitalNames.get(i)%></option>
                                                <%}%>
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
                <%--3rd row--%>
                <%String jobPosition = loginUser.getJobTitle();%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7"> <%--container7 --%>
                        <ul class="navigation-menu">
                            <li><a href="ViewAllUsers.jsp" class="menu-link">ALL USERS</a></li>
                            <li><a href="ViewMyProfile.jsp" class="menu-link">MY PROFILE</a></li>
                           
                            <li><a href="" class="menu-link">REPORT MODULE</a></li>
                             <%if(jobPosition.equalsIgnoreCase("Administrator")) {%>
                            <li><a href="AdminHomePage.jsp" class="menu-link">ADMINISTRATORS' FORMS</a></li>
                            <%}%>
                            <%if(jobPosition.equalsIgnoreCase("Administrator") || jobPosition.equalsIgnoreCase("Management")){%>
                            <li><a href="ManagerHomePage.jsp" class="menu-link">MANAGERS' FORMS</a></li>
                            <%}%>
                            
                           
                            <li><a href="AssociateHomePage.jsp" class="menu-link">ASSOCIATES' FORMS</a></li>
                        </ul>

                    </td>

                    </td>


                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3">

                    </td>

                </tr>
                <%--5th row--%>
                <tr>
                    <td rowspan="2" class="container4">
                    </td>


                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="3" class="container9">

                    </td>
                </tr>
            </table>
       
    </body>
</html>
