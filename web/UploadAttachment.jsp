<%-- 
    Document   : ListExisitingJobProfile
    Created on : Jun 21, 2014, 12:33:17 PM
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
                document.getElementById('listForm').action="/TWC2-CaseManagementSystem/ViewRecord.jsp"; //pass to view page
            }
          
           
             
        </script>
        <script src="holder.js"></script>

        <title>List Records</title>
        
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
            
            String workerName = DBConnect.getWorkername((String)session.getAttribute("FIN"));
            String phoneNumber = null;

            // get lsit of workers
            

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
                                <p class="form-control" style="left:25px; height:20px;margin:0"> <% %> </p>
                            </div>
                            <div style="height:60px;"></div>
                            <a href="/TWC2-CaseManagementSystem/ViewWorkerProfile.jsp" style="margin-left:20px">View full profile</a>

                        </div>
                            
                            
                            <%String pictureName = DBConnect.getWorkerPicture((String)session.getAttribute("FIN"));
                                 
                            %>
                        <div class="col-md-5">
                            <div style="height:10px;"></div>
                            <div class="thumbnail" style="width: 150px; height: 100px;"><img src ="image/<%=pictureName%>"></div>
                        </div>
                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td class="container5">
                        <div class="headertitle"> List Records</div>
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
                        <form id ="listForm" name="form1" role="form" action="UploadAttachmentServlet" method="post" enctype="multipart/form-data"> 
                            <label class="col-sm-1 control-label" style="width:100%;padding-left:0;"> 
                                Upload Attachment for Worker:
                                <input type="file" name="uploadedFileName">
                            </label>

                         
                        </form>
                        
                            <% if (session.getAttribute("Uploadmsg") != null) {
                                String msg = (String) session.getAttribute("Uploadmsg");%>
                            <label style="color:green"><%=msg%></label> <%}%>
                            <%request.getSession().removeAttribute("Uploadmsg");%>
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
                            <p class="form-control" style="left:25px; height:20px;width:80%;margin:0"> <% %> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Workpass type that comes with this job</label>
                            <p class="form-control" style="left:25px;height:20px;width:80%;margin:0"> <% %> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">Occupation</label>
                            <p class="form-control" style="left:25px;height:20px;width:80%;margin:0"> <% %> </p>
                        </div>
                        <div style="margin-left:20px;"> 
                            <label style="margin:0">When commenced this job</label>
                            <p class="form-control" style="left:25px;height:20px;width:80%;margin:0"> <% %> </p>
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
                <tr>
                    <td rowspan="2" class="container4">

                    </td>


                </tr>
                <%--6th row--%>
                <tr>

                    <td colspan="2" class="container9">
                        <a type="button" class="btn btn-primary btn-large" style="margin-left:10px;" href="/TWC2-CaseManagementSystem/ListAttachment.jsp"><span style="font-size:13px;">View</span><br/> <span>Attachments</span></button>
                        <a type="button" class="btn btn-primary btn-large" style="margin-left:10px;" href='javascript:doit()'><span style="font-size:13px;">Upload</span><br/> <span>Attachment</span></a>
                        <a type="button" class="btn btn-primary btn-large" style="margin-left:10px;height:55px;vertical-align:central " href="/TWC2-CaseManagementSystem/CaseMenu.jsp" style="height:55px;text-align: center; vertical-align: middle;"><span style="font-size:13px;">CASE MENU</span></a>
                        <a type="button" class="btn btn-primary btn-large" style="margin-left:10px;" href="/TWC2-CaseManagementSystem/SpecialistHomePage.jsp"><span style="font-size:13px;">EXIT</span><br/> <span>this worker</span></a>
                    </td>
                </tr>
            
            </table>
        </div>
  
</body>
</html>
