<%-- 
    Document   : Garnish2
    Created on : August 11, 2014, 12:10:28 AM
    Author     : Sion
--%>

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
        <script>
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }

            function goBack() {
                window.history.back()
            }
            function onSubmit() {
                document.garnishForm.action ="/TWC2-CaseManagementSystem/GarnishServlet2";
            }
          
           
             
        </script>

        <title>Garnish2</title>
    </head>
    <body style="font-size:11px;font-family:arial;">
        <%-- left side menus--%>
        <%
            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            String phoneNumber = null;

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
                    <td colspan="2"class="container5">
                        <div class="headertitle" style="font-size:18px"><bold>GARNISH</bold> </div>

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
                        <form id="garnishForm" name="garnishForm" role="form"  action ="#" method="post"> 

                            <div style="font-family: arial;font-size:13px; font-weight:bold; margin-top:30px;margin-left:10px;">Complement: Aggravating issue</div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Aggravating issue
                                </label>
                                 <div style="width:60%"> </div>
                                <select style="height:25px;width:40%;font-size:10px" class="form-control col-md-2" name="aggravatingIssue">
                                    <!-- get list of aggravating issue as select list  --> 
                                    <option value="a1" >A1</option>
                                    <option value="a2" >A2</option>

                                </select>
                            </div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    Explain if above is 'Other' (50)
                                </label>
                                <input style="height:25px;" type="text" class="form-control"name="otherAggravatingIssue">
                            </div>

                            <div style="height:15px"> </div>
                            <div style="font-family: arial;font-size:13px; font-weight:bold; margin-top:30px;margin-left:10px;">Complement: Lead caseworker</div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Lead caseworker
                                </label>
                                 <div style="width:60%"> </div>
                                <select style="height:25px;width:40%;font-size:10px" class="form-control col-md-2" name="leadCaseworker">
                                    <!-- get list of leadcaseworker  as select list  --> 
                                    <option value="l1" >L1</option>
                                    <option value="l2" >L2</option>

                                </select>
                            </div>


                            <div style="height:15px"> </div>
                            <div style="font-family: arial;font-size:13px; font-weight:bold; margin-top:30px;margin-left:10px;">Complement: Lawyer status</div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Lawyer status, date of update (dd-mm-yyyy)
                                </label>
                                <input style="height:25px;width:50%;" type="date" class="form-control"name="lawyerStatusDateOfUpdate">

                            </div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Does he have a lawyer for this problem?
                                </label>
                                    <div style="width:80%"> </div>
                                <select style="height:25px;font-size:10px;width:20%;" class="form-control col-md-2" name="lawyerForProblem">
                                    <option value="l1" >Y</option>
                                    <option value="l2" >N</option>

                                </select>
                            
                            </div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    Name of law firm (60)
                                </label>
                                <input style="height:25px;" type="text" class="form-control"name="lawFirmName">
                            </div>
                    

                    </td>

                    <td class="container11">
                    </td>


                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7" valign="top"> <%--container7 --%>

                            <div style="font-family: arial;font-size:13px; font-weight:bold; margin-top:10px;margin-left:10px;">Complement: Injury history</div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Date of injury (dd-mm-yyyy)
                                </label>
                                <input style="height:25px;width:50%;" type="date" class="form-control"name="injuryDate">
                            </div>
                            
                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    Body part(s) injured (500)
                                </label>
                                <input style="height:140px;" type="text" class="form-control"name="bodyPartInjured">
                            </div>
                            
                            
                            <div style="font-family: arial;font-size:13px; font-weight:bold; margin-top:10px;margin-left:10px;">Complement: Hospital</div>

                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Hospital, date of update (dd-mm-yyyy)
                                </label>
                                <input style="height:25px;width:50%;" type="date" class="form-control"name="hospitalDateOfUpdate">
                            </div>
                            
                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    <span class="asterick">*</span>Current hospital
                                </label>
                                    <div style="width:80%"> </div>
                                <select style="height:25px;font-size:10px;width:40%;" class="form-control col-md-2" name="hospital">
                                    <!-- get list of hospital from DB --> 
                                    <option value="h1" >H1</option>
                                    <option value="h2" >H2</option>

                                </select>
                            
                            </div>
                            
                                    
                            <div class="col-md-10">
                                <label style="margin:0px;">
                                    Explain if above is 'Other' (60)
                                </label>
                                <input style="height:25px;" type="text" class="form-control"name="otherAggravatingIssue">
                            </div>

                            
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
                        <div style="font-size:16px; font-weight:bold;color:black; margin-left:20px;">Problem Stub</div>
                        <div style="height:10px;"></div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Problem registration date</label>
                            <p class="form-control" style="left:25px; height:25px;width:80%;margin:0"> <%=session.getAttribute("problemRegistrationDate")%></p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Chief problem</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"> <%=session.getAttribute("chiefProblem")%>  </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Date of injury</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=session.getAttribute("dateOfInjury")%> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Lead caseworker</label>
                            <p class="form-control" style="left:25px;height:25px;width:80%;margin:0"><%=session.getAttribute("leadCaseworker")%></p>
                        </div>
                        <div style="margin-left:5px;"> 
                            <div class="col-md-7">
                                <a href="/ViewProblemProfile.jsp" >View full profile</a>
                            </div>
                            <div class="col-md-5">
                                <a onclick="goBack()">Not this problem</a>
                            </div>
                        </div> 

                    </td>

                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="3" class="container9">
                        <div style="float:left;margin-left:20px"> <a type="button" class="btn btn-primary btn-large"onclick="onSubmit()"><span style="font-family:arial;font-size:13px;">SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& go to Case Menu</span> </a></div>
                        <a type="button" style="float:left;margin-left:20px;" class="btn btn-primary btn-large" href="/TWC2-CaseManagementSystem/CaseMenu.jsp"><span style="font-family:arial;font-size:13px;">DO NOT SAVE</span><br/> <span style="font-family:arial;font-size:11px;">Go to Case Menu</span> </a>
                        <div style ="float:left;margin-left:20px"> <a type="button" class="btn btn-primary btn-large" href="SpecialistHomePage.jsp"><span style="font-family:arial;font-size:13px;">DO NOT SAVE</span><br/> <span style="font-family:arial;font-size:11px;">& return to Welcome</span></a></div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
                        </form>
</html>
