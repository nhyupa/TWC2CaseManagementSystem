<%-- 
    Document   : EditWorkerProfile
    Created on : Jun 10, 2014, 12:10:28 AM
--%>

<%@page import="src.ChiefProblem"%>
<%@page import="src.InjuryDetail"%>
<%@page import="src.CaseWorker"%>
<%@page import="src.Worker"%>
<%@page import="java.util.ArrayList"%>
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
            
             
         function doit(){
             editWorkerForm.submit();             
         }    
        
        
            function goBack() {
                window.history.back()
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit() {
                document.editWorkerForm.action ="/TWC2-CaseManagementSystem/EditWorkerProfileServlet";
            }
          
        </script>
        
        <title>Edit Worker Profile</title>
    </head>
    
    <%
        DBConnect.connectDB();
        ArrayList<String> nationalList = DBConnect.getNationalitieslists();
    %>
    <body style="font-family:arial; font-size:14px">
        <%
            String workerName = DBConnect.getWorkername((String)session.getAttribute("FIN"));
            String phoneNumber = null;
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
                        <div class="headertitle"> EDIT PROFILE</div>
                        
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
                    
                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                        
                        <form id="editWorkerForm" name="editWorkerForm" role="form"  action ="EditWorkerProfileServlet" method="post"> 
                            
                            <div style="font-size:16px; font-weight:bold; margin-left:10px;">Worker Profile</div>
                            <div class="col-md-10" style="margin-top:20px">
                                <label>
                                    <span class="asterick">*</span>Worker registration date
                                </label>
                                <div class="form-group">
                                    <input type="date" required class="form-control" placeholder="<%=DBConnect.getRegistrationDate((String)session.getAttribute("FIN"))%>" name="workerRegDate"style="width:70%;"/>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    <span class="asterick">*</span>Created by(20)
                                </label>
                                <input type="text" name="createdBy" placeholder="<%=DBConnect.getCreatedBy((String)session.getAttribute("FIN"))%>"  class="form-control"/>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    Created for(20)
                                </label>
                                <input type="text" name="createdFor" placeholder="<%=DBConnect.getCreatedFor((String)session.getAttribute("FIN"))%>"  class="form-control"/>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    Name of worker(50)
                                </label>
                                <input type="text" name="workerName" placeholder="<%=DBConnect.getWorkername((String)session.getAttribute("FIN"))%>" class="form-control"/>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    FIN number
                                </label>
                                <p class="form-control"> <%=session.getAttribute("FIN")%></p>
                            </div>
                            
                                <%
                                    String gender = DBConnect.getGender((String)session.getAttribute("FIN"));
                                    gender = gender.substring(0,1);
                                %>
                            <div class="col-md-10">
                                <label>
                                    Gender
                                </label>
                                <select class="form-control col-md-2" placeholder="<%=gender%>" name="gender">
                                    <option value="">Select From Options</option>
                                    
                                    <option value="male" >M</option>
                                    <option value="female" >F</option>
                                </select>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    Nationality
                                </label>
                                <select class="form-control col-md-2" name="nationality">
                                   <%for(int i = 0; i <nationalList.size(); i++){%>
                                    <option value="<%=nationalList.get(i)%>" ><%=nationalList.get(i)%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    Explain if above is 'Other' 
                                </label>
                                <input type="text" name="otherNationality" placeholder=""  class="form-control"/>
                            </div>
                            <div class="col-md-10">
                                <label>
                                    <span class="asterick">*</span>Date of birth
                                </label>
                                <div class="form-group">
                                    <input type="date" required name="dateOfBirth" placeholder="<%=DBConnect.getDateOfBirth((String)session.getAttribute("FIN"))%>" class="form-control" style="width:70%;"/>
                                </div>
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
                        <a type="button" class="btn btn-primary btn-large" href='javascript:doit()'><span style="font-size:13px;">SAVE</span><br/> <span style="font-size:11px;">Go to Case Menu</span></a>
                        <a type="button" class="btn btn-primary btn-large" onclick="onSubmit()"><span style="font-size:13px;">SAVE</span><br/> <span style="font-size:11px;">& list jobs</span></a>
                        <a type="button" class="btn btn-primary btn-large" onclick="goBack()"><span style="font-size:13px;"> DO NOT SAVE</span><br/> <span style="font-size:11px;">Revert to pre-existing</span></a>
                        
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
