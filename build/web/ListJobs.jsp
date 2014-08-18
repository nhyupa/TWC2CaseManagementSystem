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
        
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        <script>
            function onCancel(){
               document.location.href="AssociateWelcome.jsp";
            }
        </script>

        <title>List Jobs</title>
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
                    Name:<%=(String)session.getAttribute("workerName")%> <br>
                    FIN: <%=(String)session.getAttribute("FIN")%>
                </td> 
            </tr>
            
            <%ArrayList<String> employers = DBConnect.getEmployers((String)session.getAttribute("FIN"));%>
            <tr>
                <td class="containerC">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                    <div class="headertitle">LIST JOBS</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <strong>Select relevant job</strong><br>
                   <div class="form-group">
                       <% out.println(employers.size());
                        for(int i =0; i<employers.size();i++) { %>
                       <input type = "radio" name = "radSize" id = "sizeSmall" value = "small" checked = "checked" />
                       <label for = "sizeSmall"><%=employers.get(i)%></label>
                       
                       <%}%>
                   </div>
                      
                   
                </td> 
             
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                     <div class="form-group" align="center">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SWITCH<br/>to selected job</button>
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">ADD<br/>new job</button>
                    </div>
                    <div class="form-group" align="center">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">EXIT<br/>this worker</button>
                        
                    </div>
                         
                </td> 
            </tr>
        </table>

    </body>
</html>
