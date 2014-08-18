<%-- 
    Document   : ListExisitingProblemProfile
    Created on : Jun 10, 2014, 12:33:17 PM
    Author     : Sion
--%>

<%@page import="src.CaseWorker"%>
<%@page import="src.InjuryDetail"%>
<%@page import="src.JobProfile"%>
<%@page import="src.ChiefProblem"%>
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
                document.problemProfileForm.action ="/TWC2-CaseManagementSystem/ViewJProblemProfile.jsp";
            }
          
           
             
        </script>
        
        <title>List Existing Problem Profile</title>
    </head>
    <body style="font-family:arial;font-size:14px">
        
                <%
            // retrieve users from database    
           // ArrayList<Problem> jobList = new ArrayList<Problem>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();
            String workerName = DBConnect.getWorkername((String)session.getAttribute("FIN"));
            // get lsit of problems
            
            String FIN = (String) session.getAttribute("FIN");
              ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails(FIN);
            ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails(FIN);
             CaseWorker caseWorkerProblemStub = null;
            InjuryDetail injuryDetailProblemStub = null;
            if(caseWorkerDetails.size() !=0){
                caseWorkerProblemStub = caseWorkerDetails.get(caseWorkerDetails.size() - 1);
            }
            if(injuryDetails.size() !=0){
                injuryDetailProblemStub = injuryDetails.get(injuryDetails.size() - 1);
            }
            
            ArrayList<JobProfile> jobs = DBConnect.retrieveJobs(FIN);
            ArrayList<ChiefProblem> chiefProblems = null;
            for(int i = 0 ; i < jobs.size() ; i++) {
                JobProfile job = jobs.get(i);
                String jobKey = job.getJobKey(); 
                chiefProblems = DBConnect.retrieveProblems(FIN,jobKey);
                if(chiefProblems.size() > 0) {
                    session.setAttribute("jobKey", jobKey);
                }
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
                                <p class="form-control" style="left:25px;height:30px;margin:0"> <%=session.getAttribute("FIN")%> </p>
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
                        <div class="headertitle"> LIST EXISTING PROFILES</div>
                    </td>
                
                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>

                        <div class="username-background" style="height:38%">
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
               
                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                       <form id="jobProfileForm" name="problemProfileForm" role="form"  action ="#" method="post"> 

                       <div style="font-weight:bold;font-size:16px; margin-left:10px;">Problem Profile</div>
                       <div style="height:10px;"></div>
                       <div class="row1 col-md-10">
                           <div class="col-md-1"></div>
                           <div class="col-md-2" style="font-weight:bold;">Problem reg date</div>
                           <div class="col-md-2" style="font-weight:bold;">Chief problem</div>
                           <div class="col-md-2" style="font-weight:bold;">Date of injury</div>
                           <div class="col-md-3" style="font-weight:bold;">Lead caseworker</div>
                       </div>
                       
                       <!-- 
                       for loop get list of problems. 
                       
                       -->
                           <%
                                for (int i = 0; i < chiefProblems.size(); i++) {
                                    ChiefProblem problem= chiefProblems.get(i);
                                    String problemRegDate = problem.getProblemRegDate();
                                    String problemName = problem.getChiefProblem();
                                    
                                    
                                
                        %>      
                        
                        
                       <div class="row2 col-md-10">
                           <div class="col-md-1"><input type="radio" name="selectoption"></div>
                           <div class="col-md-2"><%=problemRegDate%></div>
                           <div class="col-md-2"><%=problemName%></div>
                           <%if(injuryDetailProblemStub != null){%>
                           <div class="col-md-2"><%=injuryDetailProblemStub.getInjuryDate()%></div>
                           <%}%>
                           <%if(caseWorkerProblemStub != null){%>
                           <div class="col-md-3"><%=caseWorkerProblemStub.getLeadCaseWorker()%></div>
                           <%}%>
                       </div>
                        <%} %> 

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
                                <a href="#">Not this job</a>
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
                        <a type="button" class="btn btn-primary btn-large" onclick="onSubmit()"><span style="font-size:13px;">VIEW</span><br/> <span>selected item</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/AddProblemProfile.jsp"><span style="font-size:13px;">ADD</span><br/> <span> new chief problem</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><!--pass selected worker's information --><span style="font-size:13px;">CASE MENU</span><br/> <span>of selected problem</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                    </td>
                </tr>
            </table>
        </div>
                        </form>
    </body>
</html>
