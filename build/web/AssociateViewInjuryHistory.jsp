<%-- 
    Document   : ViewInjuryHistory
    Created on : Jun 13, 2014, 5:28:22 PM
    Author     : keemin.chew.2010
--%>

<%@page import="src.InjuryDetail"%>
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
        
        <style>
               
             .form-control-associate{
                width:95%;
                margin-left:1%;
            }
                  
        
        </style>
        
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
         InjuryDetail currentInjury=DBConnect.getAssociateInjuryDetails(FIN);
          System.out.println(FIN);
        %>

        <title>View Injury History</title>
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
                <td class="containerD" style="height:10%">
                    <div class="headertitle-associate">VIEW</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">    
                        <strong>Most recent record:</strong>
                               
                        <div class="form-group-associate">
                            Date of update(dd/mm/yyyy)       
                            <%if(currentInjury != null) {%>
                            <div class="form-control-associate"><%=currentInjury.getInjuryDate()%></div> 
                            <%} else {%>
                            <div class="form-control-associate"></div> 
                            <%}%>
                        </div>
                                
                        <div class="form-group-associate">
                            Body part(s) injured
                            <%if(currentInjury != null) {%>
                            <div class="form-control-associate" style="height:200px;">
                                <%=currentInjury.getBodyPartsInjured()%>
                            </div>
                            <%} else {%>
                            <div class="form-control-associate" style="height:200px;"></div>
                            <%}%>
                        </div>
                    </div>
                </td> 
            </tr>

            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
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
