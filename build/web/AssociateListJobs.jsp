<%-- 
    Document   : ListJobs
    Created on : Jun 20, 2014, 12:31:29 AM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--stylesheets-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
      
         <!--stylesheet-->
        <style>
            @media (min-width: 1024px){
                .headertitle-associate{
                    margin-left:34%;
                }
                .maincontent-associate{
                    margin-left:34%;
                }
                .btn-associate-landscape{
                       margin-left:34%;
                }
            }  
        </style>
        
      <!--javascript-->  
        <script>
            function onCancel(){
               document.location.href="AssociatePreMenu.jsp";
            }
              function onExit(){
               document.location.href="AssociateWelcome.jsp";
            }
            function onSubmitToAddJobNProblem(){
                document.location.href="/TWC2-CaseManagementSystem/AssociateAddJobnProblem.jsp";
            }
            function onSubmitToSelectedJob(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateSwitchToSelectedJobServlet";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>

        <title>List Jobs</title>
    </head>
    <body>
        
        
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                   <div class="header-associate">
                        <div class="col-xs-5" align="right" >
                            <img src="image/logo_camans_180w.gif" width="100" />
                        </div>  
                        <div class="username-background-associate col-xs-6" style="margin-top:20px;" align="center" >
                            <%
                                if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                    String user = (String) request.getSession().getAttribute("username");
                            %>
                            <strong><%=user%></strong>
                            <%
                                }
                            %>
                            </br>
                            <button type="submit" class="btn-logout-associate" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                       </div><!--end of div header-->
                   
                </td> 
            </tr>
            <tr>
                <td class="containerB" style="height:10%" >
                     <div class="worker-details-associate">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%></span><br>
                            <hr class="redline-associate">
                    </div>
                
                </td> 
            </tr>
            
            <%ArrayList<String> employers = DBConnect.getEmployers((String)session.getAttribute("FIN"));
            %>
            <tr>
                <td class="containerC" style="height:10%" >

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                    <div class="headertitle-associate">LIST JOBS</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                           <strong>Select relevant job</strong><br>
                   <div class="form-group-associate">
                       <% 
                        //out.println(employers.size());
                        //get the entry date to align the employer information
                        
                        for(int i =0; i<employers.size();i++) { 
                         String checkedJob="";
                         if(session.getAttribute("employerName").equals(employers.get(i))){
                             checkedJob="checked";
                         }
                       %>
                       <form method="post" name="form1">
                        <input type = "radio" name = "radJob" id = "sizeSmall" value = "<%=employers.get(i)%>" <%=checkedJob%> />
                       <label for = "sizeSmall">
                        <%=employers.get(i)%></label><br>
                       <%}%>
                           
                   </div>
                    </div><!--end of div maincontent-->
                </td> 
             
            </tr>


            <tr>
                <td class="containerF" style="height:10%" valign="center">
                    <br><br>
                     <div class="btn-associate-landscape btn-associate">
                       <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToSelectedJob()">SWITCH<br/>to selected job</button>
                       &nbsp;&nbsp;
                      </form>

                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToAddJobNProblem()"style="width:115px;">ADD<br/>new job</button>
                    </div>
                    <br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()" style="width:115px; height:50px;">CANCEL</button>
                         &nbsp;&nbsp;
                       <button type="Submit" class="btn btn-primary btn-large" onClick="onExit()" style="width:115px;">EXIT<br/>this worker</button>
                    </div>
                    
                         
                </td> 
            </tr>
        </table>

    </body>
</html>
