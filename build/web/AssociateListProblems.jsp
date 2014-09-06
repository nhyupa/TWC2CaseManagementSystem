<%-- 
    Document   : ListProblems
    Created on : Jul 20, 2014, 2:47:37 PM
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
       
         <style>
            @media (min-width: 1024px){
                .headertitle-associate{
                    margin-left:34%;
                }
                .maincontent-associate{
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
            function onSubmitToAddProblem(){
                document.location.href="AssociateAddProblem.jsp";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmitToSelectedProblem(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateSwitchToSelectedProblemServlet";
            
            }
        </script>

        <title>List Problems</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                    <div class="header">
                        <div class="col-xs-5" align="right" >
                            <img src="image/logo_camans_180w.gif" width="100" />
                        </div>  
                        <div class="username-background-associate col-xs-6" style="margin-top:20px;" align="center">
                            <%
                                if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                    String user = (String) request.getSession().getAttribute("username");
                            %>
                            <strong class="word"><%=user%></strong>
                            <%
                                }
                            %>
                            <br>
                            <button type="submit" class="btn-logout-associate" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                       </div><!--end of div header-->
                </td> 
            </tr>
            <tr>
                <td class="containerB" style="height:10%">
                    <div class="worker-details-associate">
                   
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%></span><br>
                        Emp'yr:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("employerName") %><br>
                   
                         <hr class="redline-associate">
                    </div>
                  
                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%;">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                    <div class="headertitle-associate">LIST PROBLEMS</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                        <% String FIN=(String)session.getAttribute("FIN");
                        String JobKey = (String)request.getSession().getAttribute("JobKey");
                        ArrayList<String> problems = DBConnect.getChiefProblems(FIN, JobKey);
                        System.out.println(FIN);
                        System.out.println(JobKey);
                        %>
                    <div class="maincontent-associate">
                        
                        <strong>Select relevant problem</strong><br>
                        <div class="form-group-associate">
                               <% 
                        //out.println(employers.size());
                        //get the entry date to align the employer information
                        for(int i =0; i<problems.size();i++) { 
                         String checkedProblem="";
                         if(session.getAttribute("problemNameShow").equals(problems.get(i))){
                             checkedProblem="checked";
                         }
                       %>
                       <form method="post" name="form1">
                        <input type = "radio" name = "radProblem" id = "sizeSmall" value = "<%=problems.get(i)%>" <%=checkedProblem%> />
                       <label for = "sizeSmall">
                        <%=problems.get(i)%></label><br>

                        <%}%>
                        </div>
                    </div><!--end of maincontent-->
                </td> 
            </tr>
            <tr>
                <td class="containerF" style="height:10%" valign="center">
                    <br><br>
                    <div class="btn-associate-landscape btn-associate">
                       <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToSelectedProblem()">SWITCH<br>to selected prob</button>
                      &nbsp;
                    </form>
                       
                       <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToAddProblem()" style="width:115px;">ADD<br>new problem</button>
                    </div>
                      &nbsp;&nbsp;
                    <div class="btn-associate-landscape btn-associate">
                      <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()" style="width:125px; height:52px;">CANCEL</button>
                         &nbsp;&nbsp;
                       <button type="Submit" class="btn btn-primary btn-large" onClick="onExit()" style="width:115px;">EXIT<br>this worker</button>
                    </div>
                </td> 
            </tr>
        </table>

    </body>
</html>