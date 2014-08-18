<%-- 
    Document   : ViewJobProfile
    Created on : Jun 10, 2014, 11:05:11 AM
    Author     : Sion
--%>
<%@page import="src.CaseWorker"%>
<%@page import="src.InjuryDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.ChiefProblem"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
       <script>
            function goBack() {
                window.history.back()
     
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
       
           
             
        </script>
        
        <title>View Job Profile</title>
    </head>
    <body style="font-family:arial;font-size:14px">
        <%-- left side menus--%>
        
        <%
            
            String workerName = DBConnect.getWorkername((String)session.getAttribute("FIN"));
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
                   <td  rowspan="3" valign="center" class="container2">
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
                            
                             <% if (session.getAttribute("editWorkerSuccessMsg") != null) {
                              String msg = (String) session.getAttribute("editWorkerSuccessMsg");%>
                            <label style="color:green"><%=msg%></label> <%}%>
                              <%session.removeAttribute("editWorkerSuccessMsg");%>
                              
                               <% if (session.getAttribute("editWorkerJobSuccessMsg") != null) {
                              String jobMsg = (String) session.getAttribute("editWorkerJobSuccessMsg");%>
                            <label style="color:green"><%=jobMsg%></label> <%}%>
                              <%session.removeAttribute("editWorkerJobSuccessMsg");%>
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
                    <td colspan="2"class="container5">
                       <div class="headertitle"> VIEW PROFILE</div>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div class="username-background" style="height:36%">
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
                        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Job Profile</div>
                        <div class="employername col-md-10">
                            <label>
                                <span class="asterick">*</span>Name of employer
                            </label>
                                <p class="form-control" style="left:25px;" ><%=DBConnect.getEmployer((String)session.getAttribute("FIN"))%></p>
                        </div>
                        <div class="workpass col-md-10">
                            <label>
                                <span class="asterick">*</span>Workpass type that comes with this job
                            </label>
                                <p class="form-control" style="left:25px;"> <%=DBConnect.getWorkpassType((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div class="nameotherworkpasstype  col-md-10">
                            <label for="nameotherworkpasstype " style="font-family: arial;font-size:14px;">
                                Explain if above is 'Other'
                            </label>
                                <p class="form-control" style="left:25px;"> <% %> </p>
                        </div>
                        <div class="jobsector col-md-10">
                            <label for="jobsector" style="font-family: arial;font-size:14px;">
                                Job sector
                            </label>
                            <p class="form-control" style="left:25px;"> <%=DBConnect.getJobSector((String)session.getAttribute("FIN")) %> </p>
                        </div>
                        <div class="nameotherjobsector col-md-10">
                            <label for="nameotherjobsector " style="font-family: arial;font-size:14px;">
                                Explain if above is 'Other'
                            </label>
                                <p class="form-control" style="left:25px;"> <% %> </p>
                        </div>
                        <div class="occupation col-md-10">
                            <label for="occupation" style="font-family: arial;font-size:14px;">
                               Occupation
                            </label>
                                <p class="form-control" style="left:25px;"> <%=DBConnect.getOccupation((String)session.getAttribute("FIN")) %> </p>
                        </div>
                        <div class="jobcommencement col-md-10">
                            <label for="jobcommencement" style="font-family: arial;font-size:14px;">
                                When commenced this job
                            </label>
                                <p class="form-control" style="left:25px;"> <%=DBConnect.getCommencedDate((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div class="jobended col-md-10">
                            <label for="jobended " style="font-family: arial;font-size:14px;">
                                When ended this job
                            </label>
                                <p class="form-control" style="left:25px;"> <%=DBConnect.getEndDate((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div class="tjs col-md-10">
                            <label for="tjs" style="font-family: arial;font-size:14px;">
                                Is this a TJS job?
                            </label>
                            <p class="form-control" style="left:25px;"> <%=DBConnect.getStatus((String)session.getAttribute("FIN"))%> </p>
                        </div>
                        <div class="jobremark col-md-10">
                            <label for="jobremark " style="font-family: arial;font-size:14px;">
                               Remarks about job
                            </label>
                            <p class="form-control" style="left:25px;"> <%=DBConnect.getRemarks((String)session.getAttribute("FIN"))%> </p>
                        </div>
                     
                        
                    </td>

                    <td class="container11">
                        
                    </td>


                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7"> <%--container7 --%>

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
                            <p class="form-control" style="left:25px;height:30px;width:80%;margin:0"> <%=DBConnect.getCommencedDate((String)session.getAttribute("FIN"))%> </p>
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
                    
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><span style="font-size:13px;">CASE MENU</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/EditJobProfile.jsp"><span style="font-size:13px;">EDIT</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ListExistingJobProfile.jsp"><span style="font-size:13px;">LIST this worker's jobs</span></a>
                        <a type="button" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT this worker</span></a>
                    </td>
                </tr>
            </table>
        </div>

    </body>
</html>
