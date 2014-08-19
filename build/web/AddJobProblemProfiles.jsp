<%-- 
    Document   : AddJobProblemProfiles
    Created on : August 8, 2014, 12:10:28 AM
    Author     : Sion
--%>

<%@page import="src.CaseWorker"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.InjuryDetail"%>
<%@page import="src.ChiefProblem"%>
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


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>

        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
        
         <script language="javascript">
         function doit(){
             createJobForm.submit();             
         }    
        </script>
        <script>
            $(document).ready(function()
            {
 
                $('#createJobForm').validate(
                {
                    rules: {
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
                        }
                        
                        
                    },
                    highlight: function(element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');

                    },
                    success: function(element) {
                        $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    }

                });

                $('#createProblemForm').validate(
                {
                    rules: {
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

        <title>Add Job Problem Profiles</title>
    </head>
    <body style="font-size:11px;font-family:arial;">
        <%-- left side menus--%>
        <%
            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            String phoneNumber = null;
            
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
        <div class="leftDivision">
            <table border ="2" align="center" style="width:100%">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2" valign="center">
                        <div style="font-weight:bold; font-size:16px; font-weight:bold;margin-left:20px;">Worker Stub</div>
                        <div style="height:20px;"></div>
                        <div class="workername" style="margin-left:20px;"> 
                            <label style="margin:0">Name of worker</label>
                            <p class="form-control" style="left:25px; height:30px; width:80%;margin:0"> <%=workerName%> </p>
                        </div>
                        <div class="col-md-6" style="padding:0 0 10px 0;">
                            <div class="finnumber" style="margin-left:20px;"> 
                                <label style="margin:0"> FIN number</label>
                                <p class="form-control" style="left:25px;height:30px;margin:0"> <%=session.getAttribute("FIN")%> </p>
                            </div>
                            <div class="phone" style="margin-left:20px;"> 
                                <label style="margin:0">Phone</label>
                                <p class="form-control" style="left:25px; height:30px;margin:0"> <%=DBConnect.getPhoneNumber((String)session.getAttribute("FIN"))%> </p>
                            </div>
                            <div style="height:80px;"></div>
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
                    <td colspan="2"class="container5">
                        <div class="headertitle" style="font-size:18px"><bold>Add JOB & PROBLEM PROFILES</bold> </div>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div class="username-background" style="height:37%">
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

                    <td rowspan="4" class="container6" valign="top" > <%--container6 --%>

                        <% if (request.getAttribute("regMsg") != null) {
                                String regMsg = (String) request.getAttribute("regMsg");%>
                        <label><%=regMsg%></label> <%}%>
                        <%-- Job Profile --%>
                        <form id="createJobForm" role="form"  action ="SpecialistAddJobAndProblemServlet" method="post"> 
                            <div style="padding-left:20px; width:130%">
                                <div class="col-md-10" style="margin:0;padding-left:0">
                                    <div style="margin-top:5px"> </div>

                                    <div style="font-size:14px;font-weight:bold;width:100%;">Job Profile</div>
                                    <div style="margin-top:6px"> </div>
                                </div>

                                <div class="form-group"  style="margin:0">
                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Name of employer
                                    </label>
                                    <input type="text" required name="employerName" class="form-control col-sm-6" style="height:20px;"/>
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Workpass type that comes with this job
                                    </label>
                                    <select class="form-control col-md-2" name="workpass" style="height:25px;width:40%;font-size:9px">
                                        <option value="">select from list </option>
                                        <option value="w1">w1</option>
                                        <option value="w2" >w2</option>
                                    </select>
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' (50)
                                    </label>
                                    <input type="text" name="otherWorkpass" class="form-control col-sm-6" style="height:20px;">
                                </div>
                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:100%;padding-left:0;"> 
                                        Job sector
                                    </label>
                                    <select class="form-control col-md-2" name="jobsector" style="height:25px;width:40%;font-size:9px">
                                        <option value="">select from list </option>
                                        <option value="j1">j1</option>
                                        <option value="j2" >j2</option>
                                    </select>
                                </div>

                                <div class="form-group"  style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        Explain if above is 'Other' (50)
                                    </label>
                                    <input type="text" name="otherJobSector" class="form-control col-sm-6" style="height:20px;">
                                </div>

                            </div>
                            
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
                        
                    </td>

                    <td class="container11">
                    </td>


                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7" valign="top"> <%--container7 --%>
     

                        
                            <div style="padding-left:20px; width:130%">

                                <div class="col-md-10" style="margin:0;padding-left:0">
                                    <div style="margin-top:20px"> </div>

                                    <div style="font-size:14px;font-weight:bold;width:100%;">Problem Profile</div>
                                    <div style="margin-top:6px"> </div>
                                </div>
                                <div class="form-group" style="margin:0">

                                    <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                                        <span style ="color:red">*</span> Problem registration date
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
                                        <option value="p1">p1</option>
                                        <option value="p2" >p2</option>
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
                        <div style="font-size:16px; font-weight:bold; margin-left:20px;">Job Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Name of employer</label>
                            <p class="form-control" style="left:25px; height:30px;width:80%;margin:0"><%=DBConnect.getEmployer((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"> <%=DBConnect.getWorkpassType((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"> <%=DBConnect.getOccupation((String)session.getAttribute("FIN"))%> </p>
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

                    <td colspan="3" class="container9">
                        <div style="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href='javascript:doit()'><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& view form again</span> </a></div>
                        <div style="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& go to Case Menu</span> </a></div>
                        <div style ="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href="SpecialistHomePage.jsp"><span style="font-family:arial;font-size:13px;">ABANDON</span><br/> <span style="font-family:arial;font-size:11px;">& return to Welcome</span></a></div>
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>
