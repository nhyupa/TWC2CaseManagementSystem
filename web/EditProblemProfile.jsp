<%-- 
    Document   : EditProblemProfile
    Created on : Jun 10, 2014, 11:22:01 AM
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

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>

        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
        <script>
            function doit(){
                editProblemForm.submit();             
            }  
            function goBack() {
                window.history.back()
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit() {
                document.editProblemForm.action ="/TWC2-CaseManagementSystem/SpecialistEditProblemProfileServlet";
            }
          
        </script>
        <title>Edit Problem Profile</title>
    </head>
    <body style="font-family:arial;font-size:14px">
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
            
            ArrayList<String> problemList = DBConnect.getProblemLists();

        %>
        <div class="leftDivision">
            <table border ="2" align="center" style="width:100%">

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
                    <td colspan="2"class="container5">
                        <div class="headertitle"> EDIT PROFILE</div>

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
                
                 <%ChiefProblem chiefProblem = DBConnect.getProblem((String) session.getAttribute("FIN"));%>
                <tr>

                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>

                        <form id="editProblemForm" name="editProblemForm" role="form"  action ="SpecialistEditProblemServlet" method="post"> 

                            <div style="font-family: arial;font-size:16px; font-weight:bold; margin-left:10px;">Problem Profile</div>
                            <div class="col-md-10">
                                <label>
                                    <span class="asterick">*</span>Problem registration date (yyyy-mm-dd)
                                </label>
                                <input type="text" class="form-control" placeholder="<%=chiefProblem.getProblemRegDate()%>" name="problemRegistrationDate">
                            </div>
                            
                            <div class="col-md-10">
                                <label>
                                    <span class="asterick">*</span>Chief problem presented
                                </label>
                                <select class="form-control col-md-2" name="chiefProblem" placeholder="<%=chiefProblem.getChiefProblem()%>">
                                    <!-- get list of chief problems as select list  --> 
                                    <option value=""><%=chiefProblem.getChiefProblem()%></option>
                                    <option value=""> Select from options</option>
                                    <%for(int i = 0; i < problemList.size(); i++){
                                            String problem = problemList.get(i);
                                        %>
                                        
                                        <option value="<%=problem%>"><%=problem%></option>
                                        <%}%>
                                  
                                </select>
                            </div>
                                    
                            <div class="col-md-10">
                                <label>
                                    Explain if above is 'Other' (50)
                                </label>
                                <input type="text" class="form-control" placeholder="<%=chiefProblem.getOtherProblem()%>" name="chiefProblemOther">
                            </div>
                                    
                            <div class="col-md-10">
                                <label>
                                    Remarks about chief problem (200)
                                </label>
                                <input type="text" class="form-control" style="height:140px"name="problemRemarks" placeholder="<%=chiefProblem.getProblemRemarks()%>">
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
                                <a href="/TWC2-CaseManagementSystem/ViewJobProfile.jsp"  >View full profile</a>
                            </div>
                            <div class="col-md-4">
                                <a onclick="goBack()">Not this job</a>
                            </div>
                        </div> 

                    </td>

                </tr>
                <%--5th row--%>
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


                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="3" class="container9">
                        <a type="button" class="btn btn-primary btn-large" href='javascript:doit()'><span style="font-size:13px;">SAVE</span><br/> <span style="font-size:11px;">Go to Case Menu</span></a>
                        <a type="button" class="btn btn-primary btn-large" onclick="goBack()"><span style="font-size:13px;"> DO NOT SAVE</span><br/> <span style="font-size:11px;">Revert to pre-existing</span></a>

                    </td>
                </tr>
                
                
            </table>
        </div>
    </form>
</body>
</html>
