<%-- 
    Document   : CaseMenu
    Created on : July 27, 2014, 2:58:50 PM
    Author :Sion
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="src.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="stylesheets/Clifford.css"/>
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>

        <script src="/javascript/holder.js"></script>
        <script>
            function onLogout() {
                document.location.href = "LogoutServlet";
            }      
        </script>
        <title>Case Menu</title>
    </head>
    <body style="font-family:arial;font-size:14px">
        <%-- left side menus--%>
        <%
                    
            String userToView = request.getParameter("userToView");
            session.setAttribute("userView", userToView);
            ArrayList<Worker> workerFromNameSearchResults = (ArrayList<Worker>)session.getAttribute("workerObjs"); 
            ArrayList<Worker> workerFromFINSearchResult = (ArrayList<Worker>)session.getAttribute("workerFINObjs");
           
            String FIN = null;
           
            if(workerFromNameSearchResults != null && workerFromNameSearchResults.size() != 0 ){
                Worker worker = null;
                if(userToView == null){
                    FIN = (String)session.getAttribute("FIN");
                }
                else {
                    worker = workerFromNameSearchResults.get(Integer.parseInt(userToView));
                    
                    FIN = worker.getFIN_Num();
                    session.setAttribute("FIN",FIN);
                } 
            }
            
            
            /** Worker FIN **/
          
            if(workerFromFINSearchResult != null && workerFromFINSearchResult.size() != 0 ){
                Worker worker = null;
 
                if(userToView != null){
                    worker = workerFromFINSearchResult.get(Integer.parseInt(userToView));
                    
                    FIN = worker.getFIN_Num();
                    session.setAttribute("FIN",FIN);
                }
                else {
                    FIN = (String)session.getAttribute("FIN");
                } 
            }
            
          
         
            
            
            String tempFIN = "";
                        
            String jobKey = DBConnect.getJobKey(FIN);
            if (jobKey !=null){
               session.setAttribute("jobKey", jobKey);
            }
            
                            
           ChiefProblem chiefProblem = DBConnect.getProblem(FIN);
           String probKey = DBConnect.getProbKey(FIN, jobKey);
            if (probKey !=null){
               session.setAttribute("probKey", probKey);
            }
          
           
           
            String workerName = DBConnect.getWorkername(FIN);
            String phoneNumber = null;
            
            ArrayList<CaseWorker> caseWorkerDetails = DBConnect.getCaseWorkerDetails(FIN,jobKey);
            ArrayList<InjuryDetail> injuryDetails = DBConnect.getInjuryDetails(FIN);
            
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
                                <p class="form-control" style="left:25px;height:25px;margin:0"> <%=FIN%> </p>
                            </div>
                            <div class="phone" style="margin-left:20px;"> 
                                <label style="margin:0">Phone</label>
                                <p class="form-control" style="left:25px; height:25px;margin:0"> <%=DBConnect.getPhoneNumber(FIN)%> </p>
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

                       <%String pictureName = DBConnect.getWorkerPicture(FIN);
                                 
                            %>
                        <div class="col-md-5">
                            <div style="height:5px;"></div>
                            <div class="thumbnail" style="width: 120px; height: 160px;"><img src ="WorkerFacePicture/<%=pictureName%>"></div>
                        </div>
                    </td>

                    <td rowspan="6" class="container10">

                    </td>
                    <td class="container5">
                        <div style="font-size:18px; font-weight:bold;margin-left:20px;" >CASE MENU</div>
                    </td>
                    
                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
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
                        <div style="height:20px;"></div>

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

                    <td rowspan="2" class="container6" valign="top">
                        <jsp:include page="WorkerComplimentCaseMenu.jsp"/>
                    </td>

                </tr>
                <%--3rd row--%>
                <tr>

                    <td class="container11">

                    </td>

                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3" valign="top"> 
                        <div style="font-size:16px; font-weight:bold; margin-left:20px;">Job Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Name of employer</label>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"><%=DBConnect.getEmployer(FIN)%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=DBConnect.getWorkpassType(FIN)%>  </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getOccupation(FIN)%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getCommencedDate(FIN)%></p>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-8">
                                <a href="/TWC2-CaseManagementSystem/ViewJobProfile.jsp" >View full profile</a>
                            </div>
                            <div class="col-md-4">
                                <a href="ListExistingJobProfile.jsp">Not this job</a>
                            </div>
                        </div> 
                    </td>
                    <td colspan="2" class="container7" valign="top">
                        <jsp:include page="JobComplimentCaseMenu.jsp"/>

                    </td>
                </tr>
                <%--5th row--%>

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
                    <td colspan="2" class="container8">
                        <jsp:include page="ProblemComplimentCaseMenu.jsp"/>

                    </td>

                </tr>
                <%--6th row--%>
                
                <%
                String jobPosition = "";
                if(loginUser != null){
                    jobPosition = loginUser.getJobTitle();%>
                  
                <%}%>
                <tr>

                    <td colspan="2" class="container9">
                        
                        <% if(jobPosition.equalsIgnoreCase("Administrator")) {%>
                            <a type="button" style="margin-left:10px;" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/AdminHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                        <%}%>
                        <% if(jobPosition.equalsIgnoreCase("Management")) {%>
                            <a type="button" style="margin-left:10px;" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ManagerHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                        <%}%>
                        <% if(jobPosition.equalsIgnoreCase("General Specialist") ||jobPosition.equalsIgnoreCase("Restricted Specialist")) {%>
                            <a type="button" style="margin-left:10px;" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                        <%}%>
                        
                        
                        <a type="button" style="height:55px; line-height: 40px"class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/ListAttachment.jsp">Attachments</a>
                    
                    </td>
                </tr>
            </table>
        </div>

    </body>
</html>
