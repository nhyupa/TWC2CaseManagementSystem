<%-- 
    Document   : PreMenu
    Created on : Jun 21, 2014, 6:34:52 PM
    Author     : keemin.chew.2010
--%>
<%@page import="src.InjuryDetail"%>
<%@page import ="java.text.SimpleDateFormat"%>
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
            
             function onSubmitToCaseMenu(){
                 document.location.href="AssociateMenu.jsp";
             }
             
           function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
     
         </script>
        <title>Pre Menu</title>
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
                        <div class="username-background-associate col-xs-6" style="margin-top:20px;" align="center">
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
                <td class="containerC" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                   <div class="headertitle-associate">IS THIS THE CASE?</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                           <div class="form-group-associate">
                             Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)session.getAttribute("workerName")%><br>
                             FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%> </span><br>
                        
                       &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<a href="AssociateWelcome.jsp">NOT THIS WORKER</a>
                       <!--remove error message-->
                       <% session.removeAttribute("errMsg");%>
                    </div> 
                    <div class="form-group-associate">
                        Emp'yr:&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)session.getAttribute("employerName") %><br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AssociateListJobs.jsp">NOT THIS JOB</a>
                        
                    </div> 
                    <div class="form-group-associate">
                       Prob: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)session.getAttribute("problemNameShow")%><br>
                       <%InjuryDetail currentInjury=(InjuryDetail)session.getAttribute("injury");
                          String currentInjuryDate="";
                          
                          if(currentInjury != null){
                           if (currentInjury.getInjuryDate()!=null){
                               currentInjuryDate = currentInjury.getInjuryDate();
                           }else{
                              currentInjuryDate="";
                           }
                         }
                       %>
                       Inj dt: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=currentInjuryDate%><br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AssociateListProblems.jsp">NOT THIS PROBLEM</a>
                      
                    </div> 
                     <div class="form-group-associate">
                         Yes, this is the correct worker job,and problems<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="Submit" class="btn btn-primary btn-large" onClick="onSubmitToCaseMenu()">GO TO CASE MENU</button>
                    </div> 
                </div><!--end div content-->
                 
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">

                </td> 
            </tr>
        </table>

    </body>
</html>

