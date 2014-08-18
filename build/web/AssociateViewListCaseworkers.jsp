<%-- 
    Document   : ListCaseworkers
    Created on : Jun 13, 2014, 5:28:49 PM
    Author     : keemin.chew.2010
--%>

<%@page import="src.AuxillaryCaseWorker"%>
<%@page import="src.CaseWorker"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
           <script>
            function onSubmit(){
               document.location.href="AssociateMenu.jsp";
            }
        </script>
        <!--database-->
        <%
           String FIN=(String)session.getAttribute("FIN");
           ArrayList<CaseWorker> lead=DBConnect.getLeadCaseWorkers(FIN);
           ArrayList<AuxillaryCaseWorker> auxiliary=DBConnect.getAuxillaryWorker (FIN);
        %>

        <title>List Caseworkers</title>
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
                            <br>
                            <button type="submit" class="btn-logout-associate" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                         
                    </div> <!--end of div header-->
                </td>
            </tr>
            <tr>
                <td class="containerB" valign="top" style="height:10%">
                      <div class="worker-details-associate">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br>
                        Prob:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("problemNameShow")%><br>
                        Inj dt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryDate")%><br>
                            <hr class="redline-associate">
                    </div>
                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD"  style="height:10%">
                  <div class="headertitle-associate">LIST</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <h4 align="left" style="margin-left:4px;"><b>Lead caseworkers</b></h4>
                        <hr class="blackline" style="background-color:black; height:0.2em;">
                          <label>Lead caseworker</label><br/>
                          <label>Start date</label><br/>
                          <label>End date</label><br/>
                        <hr style="background-color:black; height:0.2em;">
                        
                        <%for(CaseWorker caseworker:lead){%>
                         <%=caseworker.getLeadCaseWorker()%><br>
                         <%=caseworker.getCaseWorkerStartDate()%><br>
                         <%=caseworker.getCaseWorkerEndDate()%><br>
                         <br>
                         <%}%>
                        <hr class="blackline" style="background-color:black; height:0.2em;">
                        <br/>
                        <h4 align="left" style="margin-left:4px;"><b>Auxiliary caseworkers</b></h4>
                        <hr class="blackline" style="background-color:black; height:0.2em;">
                          <label>Auxiliary caseworker</label><br/>
                          <label>Start date</label><br/>
                          <label>End date</label><br/>
                         <hr class="blackline" style="background-color:black; height:0.2em;">
                         <%for(AuxillaryCaseWorker caseworker:auxiliary){%>
                         <%=caseworker.getAuxCaseWorkerName()%><br>
                         <%=caseworker.getAuxStartDate()%><br>
                         <%=caseworker.getAuxEndDate()%><br>
                         <br>
                         <%}%>
                         
                         <hr class="blackline" style="background-color:black; height:0.2em;">
                    </div>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                  <div class="btn-associate-landscape btn-associate">
                    <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MENU</button>
                    <br>
                    If anything above needs to be amended,please inform a social worker or senior volunteer
                    </div>
                  </td> 
            </tr>
        </table>

    </body>
</html>
