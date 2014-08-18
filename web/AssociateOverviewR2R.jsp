<%-- 
    Document   : OverviewR2R
    Created on : Jun 14, 2014, 12:45:53 AM
    Author     : keemin.chew.2010
--%>
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
      
            .form-control-associate{
                width:95%;
                margin-left:1%;
            }
          
        </style>
        
        <!--javascript-->
           <script>
            function onCancel(){
               document.location.href="AssociateWelcome.jsp";
            }
             function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateOverviewR2RServlet";
            }
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>

        <title>R2R Overview</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA"style="height:10%">
                <div class="header-associate" >
                        <div class="col-xs-5" align="right" >
                            <img src="image/logo_camans_180w.gif" width="100" />
                        </div>  
                        <div class="username-background-associate col-xs-6"style="margin-top:20px;" align="center" >
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
                <td class="containerB" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerC"style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD"style="height:10%">
                    <div class="headertitle-associate">R2R OVERVIEW</div>
                   <hr class="blackline-associate" style="width:90%;margin-left:2%;"> 
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%" valign="top">
                      <div class="maincontent-associate">
                        <div class="form-group-associate"> <strong>Define period</strong></div>
                        <form method="post" name="form1">
                            <div class="form-group-associate">
                                From(dd/mm/yyyy)
                                <input type="date" class="form-control-associate" name="fromDate">
                                <p name="leave a space"></p>
                                To (dd/mm/yyyy)
                                <input type="date" class="form-control-associate" name="toDate">
                                  Both dates included
                            </div>
                      
                        Depending on the dates chosen,resulting list may be long.
                    </div><!--end of maincontent-->
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <br>
                   <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" style="width:150px;"onClick="onSubmit()">LIST<br>records</button>
                   </form>
                        &nbsp;&nbsp:
                        <button type="Submit" class="btn btn-primary btn-large" style="height:55px;"  onClick="onCancel()">BACK TO HOMEPAGE</button>
                    </div>
                </td> 
            </tr>
        </table>

    </body>
</html>

