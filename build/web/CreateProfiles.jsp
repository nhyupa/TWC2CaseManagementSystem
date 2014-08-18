<%-- 
    Document   : CreateProfiles
    Created on : Jun 10, 2014, 12:10:28 AM
    Author     : Sion
--%>

<%@page import="src.User"%>
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

        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>

        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  

       <script language="javascript">
         function doit(){
             form1.submit();             
         }    
        </script>
        
        <script>
            $(document).ready(function()
            {
                $('#createWorkerForm').validate(
                {
                    rules: {
                        createdBy: {
                            required: true,
                            maxlength: 20
                        },
                        createdFor: {
                            maxlength: 20
                        },
                        workerName: {
                            maxlength: 50,
                            required: true
                        },
                        gender: {
                            required: true
                        },
                        nationality: {
                            required: true
                        },
                         otherNationality: {
                            maxlength: 50
                        },
                        FIN: {
                            required: true
                        },
                        
                        employerName: {
                            required: true,
                            maxlength: 20
                        },
                     
                        workpass: {
                            maxlength: 50,
                            required: true
                        },
                        otherWorkpass: {
                            maxlength: 50
                        },
                        otherJobSector: {
                            maxlength: 50
                        },
                        jobCommenced:{
                            maxlength:50
                        },
                        jobEnded:{
                            maxlength:50
                        },
                        jobRemarks:{
                            maxlength:200
                        },
                        
                        chiefProblem: {
                            required: true,
                            maxlength: 50
                        }, 
                        otherProblem:{
                            maxlength: 50
                        },
                        problemRemarks:{
                            maxlength: 50
                        }
                     
                    },
                    highlight: function(element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');

                    },
                    success: function(element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    }
                });
   
            });
              
        </script>	

        <title>Create Profiles</title>
    </head>
    
    <%
        DBConnect.connectDB();
        ArrayList<String> nationalitiesLists = DBConnect.getNationalitieslists();
        ArrayList<String> workPassList = DBConnect.getWorkPassList();
        ArrayList<String> jobSectorList = DBConnect.getJobSectorlists();
        ArrayList<String> problemList = DBConnect.getProblemLists();
        DBConnect dbConnect = new DBConnect();
        ArrayList<User> users = dbConnect.getUsers();
        
        User loginUser = null;
        for (int i = 0; i < users.size(); i++) {
            User user1 = users.get(i);
            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                 loginUser = user1;
            }
       }
        
      
        session.setAttribute("createdBy", loginUser.getfullName());
        
    %>
    
    <body style="font-size:11px;font-family:arial;">
        <%-- left side menus--%>
        <div class="leftDivision">
            <table border ="2" align="center" style="width:100%">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2" valign="top">

                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td colspan="2"class="container5">
                        <div class="headertitle" style="font-size:18px"><bold>Create Profiles</bold> </div>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div class="username-background" style="height:37%">
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
                        
                        <form id ="createWorkerForm" name="form1" role="form" action ="WorkerAndJobRegistrationServlet" method="post" enctype="multipart/form-data"> 
                            <div style="padding-left:20px;">
                                <div class="fileinput fileinput-new" data-provides="fileinput" style="float:right">
                                    <div class="fileinput-new thumbnail" style="width: 100px; height: 130px;">
                                        <img data-src="holder.js/100x130" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;"></div>
                                    <div>
                                        <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                        <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>
                                <div style="font-size:14px;font-weight:bold">Worker Profile</div>
                                <div style="margin-top:6px"> </div>
                            
                         
                                <div class="form-group" style="margin:0">
   
                     
                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Worker registration date (dd/mm/yyyy)
                                    </label>                        
                                    <input type="date" required name="workerRegDate"class="form-control col-sm-6" style="width:60%;height:20px;"/>
                                    <div style="width:40%;height:30px;float:left;margin:0"> </div> 
                                   
                                </div>
     
                          
                                
                                <div class="form-group"  style="margin:0">
                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span>Created by (20)
                                    </label>
                                    <p class="form-control col-sm-6" style="width:60%;" name="createdBy" > <%=loginUser.getfullName()%> </p>
                                    <div style="width:40%;height:20px;float:left;margin:0"> </div> 
                                    
                                    
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Created for (20)
                                    </label>
                                     <select name="createdFor" class="form-control col-md-2" style="height:25px; font-size:10px;width:25%">
                                        
                                         <%for(int i =0 ; i < users.size(); i++) {
                                            User user = users.get(i);
                                            String fullname = user.getfullName();
                                         %>
                                         <option value="<%=fullname%>" ><%=fullname%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group"  style="margin:0">
                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span>Name of worker(50)
                                    </label>
                                    <input type="text" name="workerName"class="form-control col-sm-6" style="height:20px;" >
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span>FIN number
                                    </label>
                                    <input type="text" class="form-control col-sm-6" name="FIN" style="height:20px; width:60%" >
                                </div>

                                <div class="form-group"  style="margin:0">
                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        Gender
                                    </label>
                                    <select name="gender" class="form-control col-md-2" style="height:25px; font-size:10px;width:25%">
                                        <option value="male" >M</option>
                                        <option value="female" >F</option>
                                    </select>
                                    
                                </div>
                                    
                                <div class="form-group"  style="margin:0">
                                    
                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        Nationality
                                    </label>
                                    <select class="form-control col-md-2" name="nationality" style="height:25px;width:60%;font-size:9px">
                                        <option value="">select from list </option>
                                        <%for(int i = 0 ; i < nationalitiesLists.size(); i++){ %>
                                        <option value="<%=nationalitiesLists.get(i)%>"><%=nationalitiesLists.get(i)%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' 
                                    </label>
                                    <input type="text" name="otherNationality" class="form-control col-sm-6" style="height:20px;width:130%;">
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span>Date of birth
                                    </label>
                                    <input type="date" required class="form-control col-sm-6"  name="dateOfBirth"  style="height:20px;width:60%"/>
                                </div>
                      
                        
                        <%-- Job Profile --%>

                       
                                <div class="col-md-10" style="margin:0;padding-left:0">
                                    <div style="margin-top:5px"> </div>

                                    <div style="font-size:14px;font-weight:bold;width:100%;">Job Profile</div>
                                    <div style="margin-top:6px"> </div>
                                </div>

                                <div class="form-group"  style="margin:0">
                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Name of employer
                                    </label>
                                    <input type="text" required name="employerName" class="form-control col-sm-6" style="height:20px;width:130%"/>
                                </div>
                                
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Workpass type that comes with this job
                                    </label>
                                    <select class="form-control col-md-2" name="workpass" style="height:25px;width:60%;font-size:9px">
                                        
                                        <option value="">select from list </option>
                                        <% for (int i=0; i < workPassList.size(); i++){ %>
                                        <option value="<%=workPassList.get(i)%>"><%=workPassList.get(i)%></option>
                                        <%}%>    
                                    </select>
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' (50)
                                    </label>
                                    <input type="text" name="otherWorkpass" class="form-control col-sm-6" style="height:20px;width:130%">
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        Job sector
                                    </label>
                                    <select class="form-control col-md-2" name="job sector" style="height:25px;width:60%;font-size:9px;">
                                        <option value="">select from list </option>
                                        <%for(int i = 0 ; i <jobSectorList.size(); i++){ %>
                                        
                                            <option value="<%=jobSectorList.get(i)%>"><%=jobSectorList.get(i)%></option>
                                        <%}%>
                                    </select>
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' (50)
                                    </label>
                                    <input type="text" name="otherJobSector" class="form-control col-sm-6" style="height:20px;width:130%">
                                </div>

                            </div>
               
                    </td>

                    <td class="container11">
                        
                            <% if (session.getAttribute("workerRegSuccessMsg") != null) {
                              String msg = (String) session.getAttribute("workerRegSuccessMsg");%>
                            <label style="color:green"><%=msg%></label> <%}%>
                              <%session.removeAttribute("workerRegSuccessMsg");%>
                        
                        
                    </td>


                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7" valign="top"> <%--container7 --%>
                        <div style="padding-left:20px; width:130%">
                            <div style="margin-top:40px"> </div>

                            <div class="form-group"  style="margin:0">
                                <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                    Occupation
                                </label>
                                <input type="text" required class="form-control col-sm-6" name="occupation" style="height:20px;" />
                            </div>

                            <div class="form-group"  style="margin:0">

                                <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                    When commenced this job (50)
                                </label>
                                <input type="text" name="jobCommenced" class="form-control col-sm-6" style="height:20px;"/>

                            </div>
                            <div class="form-group"  style="margin:0">

                                <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                    When ended this job (50)
                                </label>
                                <input type="text" name="jobEnded" class="form-control col-sm-6" style="height:20px;"/>

                            </div>

                            <div class="form-group"  style="margin:0">

                                <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                    <span style ="color:red">*</span> is this a TJS job?
                                </label>
                                <select class="form-control col-md-2" name="TJSJob" style="height:25px;width:40%;font-size:9px">
                                    <option value="Y">Y</option>
                                    <option value="N" >N</option>
                                </select>
                            </div>

                            <div class="form-group"  style="margin:0">

                                <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                    Remarks about job (200)
                                </label>
                                <input type="text" name="jobRemarks" class="form-control col-sm-6" style="height:50px;"/>

                            </div>




                        </div>
                        

                     
                            <div style="padding-left:20px; width:130%">

                                <div class="col-md-10" style="margin:0;padding-left:0">
                                    <div style="margin-top:20px"> </div>

                                    <div style="font-size:14px;font-weight:bold;width:100%;">Problem Profile</div>
                                    <div style="margin-top:6px"> </div>
                                </div>
                                <div class="form-group" style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Problem registration date (dd/mm/yyyy)
                                    </label>                        
                                    <input type="date" required class="form-control col-sm-6"  name="problemRegDate" style="width:40%;height:20px;"/>
                                    <div style="width:60%;height:20px;float:left;margin:0"> </div> 

                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Chief problem presented
                                    </label>
                                    <select class="form-control col-md-2" name="chiefProblem" style="height:25px;width:40%;font-size:9px">
                                        <option value="">select from list </option>
                                        <%for(int i = 0; i < problemList.size(); i++){
                                            String problem = problemList.get(i);
                                        %>
                                        
                                        <option value="<%=problem%>"><%=problem%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' (50)
                                    </label>
                                    <input type="text" name="otherProblem" class="form-control col-sm-6" style="height:20px;">
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        Remarks about chief problem (200)
                                    </label>
                                    <input type="text" name="problemRemarks" class="form-control col-sm-6" style="height:50px;"/>

                                </div>
                            </div>
                        

                        </div>
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
                        <div style="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href='javascript:doit()'><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& view form again</span> </div></a>
                        <div style="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& go to Case Menu</span> </div></a>
                        <div style ="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href="SpecialistHomePage.jsp"><span style="font-family:arial;font-size:13px;">ABANDON</span><br/> <span style="font-family:arial;font-size:11px;">& return to Homepage</span> </div></a>
                    </td>
                </tr>
               
            </table>
        </div>
         </form>
    </body>
</html>
