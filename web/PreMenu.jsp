<%-- 
    Document   : PreMenu
    Created on : Jun 21, 2014, 6:34:52 PM
    Author     : keemin.chew.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
         <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
         
         <script>
             function onSubmitToAssociateWelcomePage(){
                 document.location.href="AssociateWelcome.jsp";
             }
             function onSubmitToListJobsPage(){
                  document.location.href="ListJobs.jsp";
             } 
             function onSubmitToCaseMenu(){
                 document.location.href="AssociateMenu.jsp";
             }
         </script>
        <title>Pre Menu</title>
    </head>
    <body>
        
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                     <div class="col-xs-5 col-md-5" align="right" >
                        <img src="image/logo_camans_180w.gif" width="100" />
                    </div>  
                    <div class="username-background-associate col-xs-6 col-md-1"style="margin-top:20px;" >
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <strong class="word"><%=user%></strong>
                        <%
                            }
                        %>
                        </br>
                        <button type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                    </div>
                   
                    
                </td> 
            </tr>
            <tr>
                <td class="containerB" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                   <div class="headertitle">IS THIS THE CASE?</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top">
                    <div class="form-group">
                        Name: <%=(String)session.getAttribute("workerName")%><br/>
                        FIN: <%=(String)session.getAttribute("FIN")%><br/>
                        <%
                           String selectedWorkerName="Chew Kee Min";
                           session.setAttribute("selectedWorkerName", selectedWorkerName);
                           
                           String selectedWorkerFIN="F123456G";
                           session.setAttribute("selectedWorkerFIN", selectedWorkerFIN);
                        %>
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToAssociateWelcomePage()">NOT THIS WORKER</button>
                    </div> 
                    <div class="form-group">
                        Emp'yr:Chew Ah Chew Pte Ltd<br/>
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToListJobsPage()">NOT THIS JOB</button>
                        <%
                           String selectedEmployerName="Chew Ah Chew Pte Ltd";
                           session.setAttribute("selectedEmployerName", selectedEmployerName);
                        %>
                    </div> 
                    <div class="form-group">
                        Prob:<br/>
                        Inj dt:<br/>
                        <button type="Submit" class="btn btn-primary btn-large" onClick="">NOT THIS PROBLEM</button>
                    </div> 
                     <div class="form-group">
                        Yes, this is the correct worker job, and problems<br/>
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToCaseMenu()">GO TO CASE MENU</button>
                    </div> 
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">

                </td> 
            </tr>
        </table>

    </body>
</html>

