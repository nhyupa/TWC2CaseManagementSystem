<%-- 
    Document   : WhichProblem
    Created on : August 10, 2014, 12:33:17 PM
    Author     : Sion
--%>

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
                //  document.listForm.action ="/TWC2-CaseManagementSystem/ViewRecord.jsp"; //pass to view page
                document.getElementById('listForm').action="/TWC2-CaseManagementSystem/ViewProblemProfile.jsp"; //pass to view page
            }
          
            function goBack() {
                window.history.back()
            }
           
             
        </script>
        <script src="holder.js"></script>

        <title>Which Problem?</title>

        <script language="javascript">
            function doit(){
                form1.submit();             
            }    
        </script>
    </head>
    <body style="font-family:arial;font-size:14px">

        <%
            // retrieve users from database    
            // ArrayList<Job> jobList = new ArrayList<Job>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();

            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            String phoneNumber = null;

            // get lsit of workers


        %>


        <%-- left side menus--%>
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
                                <p class="form-control" style="left:25px; height:25px;margin:0"> <% %> </p>
                            </div>
                            <div style="height:30px;"></div>
                            <a href="ViewWorkerProfile.jsp" style="margin-left:20px">View full profile</a>

                        </div>

                        <%String pictureName = DBConnect.getWorkerPicture((String) session.getAttribute("FIN"));

                        %>
                        <div class="col-md-5">
                            <div style="height:5px;"></div>
                            <div class="thumbnail" style="width: 130px; height: 130px;"><img src ="image/<%=pictureName%>"></div>
                        </div>
                    </td>

                    <td rowspan="6" class="container10">

                    </td>
                    <td class="container5">
                        <div class="headertitle"> WHICH PROBLEM?</div>
                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>

                        <div class="username-background" style="height:38%">
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

                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                        <form id ="listForm" name="form1" role="form" action="ViewProblemProfile.jsp" method="post" enctype="multipart/form-data"> 

                            <div style="font-weight:bold;font-size:16px; margin-left:10px;">Your selected worker & job has more than one problem</div>
                            <div style="height:10px;"></div>
                            <div style="font-weight:bold;font-size:13px; margin-left:10px;">Select one problem</div>

                            <div style="height:5px;"></div>
                            <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
                                <div class="col-md-1"></div>
                                <div class="col-md-3" style="font-weight:bold;">Problem registration date</div>
                                <div class="col-md-3" style="font-weight:bold;">Chief Problem</div>
                                <div class="col-md-3" style="font-weight:bold;">Date of injury</div>
                                <div class="col-md-3" style="font-weight:bold;">Lead caseworker</div>

                            </div>
                            <!-- 
                            for loop get list of problems. 
                            
                            -->
                            <%  //for    (int i = 0; i < problemList.size(); i++) {

                            %>      

                            <div class="row2 col-md-12">
                                <div class="col-md-1"><input type="radio" name="selectoption"></div>
                                <div class="col-md-3"><%//=%></div>
                                <div class="col-md-3"><%//=%></div>
                                <div class="col-md-3"><%//=%></div>
                                <div class="col-md-3"><%//=%></div>
                            </div> 
                            <%
                                //}
                            %> 

                    </td>
                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" class="container7"> <%--container7 --%>

                    </td>


                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3" valign="top"> 
                        <div style="font-size:16px; font-weight:bold; margin-left:20px;">Job Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Name of employer</label>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"> <%=session.getAttribute("employerName")%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=DBConnect.getWorkpassType((String) session.getAttribute("FIN"))%>  </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getOccupation((String) session.getAttribute("FIN"))%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=DBConnect.getCommencedDate((String) session.getAttribute("FIN"))%></p>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-8">
                                <a href="ViewJobProfile.jsp" >View full profile</a>
                            </div>
                            <div class="col-md-4">
                                <a onclick="goBack()">Not this job</a>
                            </div>
                        </div> 
                    </td>

                </tr>
                <%--5th row--%>
                <tr>
                    <td rowspan="2" class="container4" valign="top">

                    </td>


                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="2" class="container9">
                        <button style="margin-left:10px;"type="submit" class="btn btn-primary btn-large" onClick="onSubmit()"><span style="font-size:13px;">VIEW</span><br/> <span>selected problem</span></button>
                        <a type="button" class="btn btn-primary btn-large" onclick="goBack()"><span style="font-size:13px;"> BACK UP ONE LEVEL</span><br/> <span style="font-size:11px;">to modify criteria</span></a>                        
                        <a type="button" class="btn btn-primary btn-large" href="SpecialistHomePage.jsp" style="height:55px;text-align: center; vertical-align: middle;"><span style="font-size:13px;">ABANDON</span><br/> <span style="font-size:11px;">Return to Welcome</span></a>
                     
                    </td>
                </tr>

            </table>
        </div>

    </body>
</html>
