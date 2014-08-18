<%-- 
    Document   : ViewProfile
    Created on : Jun 13, 2014, 5:27:55 PM
    Author     : keemin.chew.2010
--%>


<%@page import="java.util.Date"%>
<%@page import="src.DBConnect"%>
<%@page import="src.ChiefProblem"%>
<%@page import ="java.text.SimpleDateFormat"%>

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
        
           <script>
                function onSubmit(){
                   document.location.href="AssociateMenu.jsp";
                }
               function onLogout(){
                  document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
               }
           </script>
           <!--database-->
          <%
               SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
               SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
          %>
        <title> View Profile</title>
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
                <td class="containerB" valign="top" style="height:10%">
                    <div class="worker-details-associate">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br/>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br/>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br/>
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
            <% String FIN = (String)session.getAttribute("FIN");
             %>
            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <h4><strong>Worker Profile:</strong></h4> 
                     <div class="form-group-associate">
                        <label>Registration date(dd/mm/yyyy)</label><br/>
                      
                        <div class="form-control-associate"><%=DBConnect.getRegistrationDate(FIN)%></div>
                    </div> 
                    <div class="form-group-associate">
                        <label>Created by</label>
                        <div class="form-control-associate"><%=DBConnect.getCreatedBy(FIN)%></div>
                    </div> 
                    <div class="form-group-associate">
                        <label>Created for</label>
                        <% String createdFor=DBConnect.getCreatedFor(FIN);
                           if(createdFor!=null){
                              createdFor="";
                            %>
                        <div class="form-control-associate"><%=createdFor%></div>
                    </div> 
                        <%}%>
                    <div class="form-group-associate">
                        <label>Name of worker</label>
                        <div class="form-control-associate" style="height:50px;"><%=DBConnect.getWorkername(FIN)%></div>
                    </div> 
    
                    <div class="form-group-associate">
                         <label>FIN Number</label>
                         <div class="form-control-associate"><%=(String)session.getAttribute("FIN")%></div>
                    </div>
                    <div class="form-group-associate">
                        <label >Gender</label>
                        <div class="form-control-associate"><%=DBConnect.getGender(FIN)%></div>
                    </div>
                    
                    <div class="form-group-associate">
                        <label>Nationality</label>
                        <div class="form-control-associate">
                            <%=DBConnect.getNationality(FIN)%>
                        </div>
                    </div>
                    
                    <div class="form-group-associate">
                        <label for="otherNationality">Explain if above is 'Other'</label>
                         <div class="form-control-associate" style="height:50px;"><%=DBConnect.getNationalityOther(FIN)%></div>
                    </div> 
                    
                     <div class="form-group-associate">
                         <label>Date of birth(dd/mm/yyyy)</label>
                         <div class="form-control-associate"><%=DBConnect.getDateOfBirth(FIN)%></div>
                    </div> 
                    <br><br>
                    
                    <h4><strong>Job profile :</strong></h4>
                    <div class="form-group-associate" >
                        <label>Name of employer</label>
                        <div class="form-control-associate" style="height:50px;"><label><%=session.getAttribute("employerName")%></label></div>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label>Workpass type that came with the job</label>
                        <div class="form-control-associate"><%=DBConnect.getWorkpassType(FIN)%></div>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="otherWorkpass">Explain if above is 'Other'</label>
                        <div class="form-control-associate" style="height:50px;"><%=DBConnect.getWorkpassTypeOther(FIN)%></div>
                       
                    </div> 
                    
                    <div class="form-group-associate">
                        <label>Job sector</label>
                        <div class="form-control-associate "><%=DBConnect.getJobSector(FIN)%></div>
                    </div> 
                    
                     <div class="form-group-associate">
                        <label for="otherJobSector">Explain if above is 'Other'</label>
                         <div class="form-control-associate" style="height:50px;"><%=DBConnect.getJobSectorOther(FIN)%></div>
                        
                    </div>
                    
                    <div class="form-group-associate">
                        <label>Occupation</label>
                        <div class="form-control-associate" style="height:50px;"><%=DBConnect.getOccupation(FIN)%></div>
                    </div> 
                    
                    <div class="form-group-associate" >
                        <label>When commenced this job</label>
                        <div class="form-control-associate" style="height:50px;"><%=DBConnect.getCommencedDate(FIN)%></div>
                    </div> 
                    
                     <div class="form-group-associate" >
                        <label>When ended this job</label>
                        <div class="form-control-associate" style="height:50px;"><%=DBConnect.getEndDate(FIN)%></div>
                    </div> 
                    
                    
                    <div class="form-group-associate" >
                        <label>Is this a TJS job?</label>
                        <div class="form-control-associate"><%=DBConnect.getStatus(FIN)%> </div>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label>Remarks about job</label>
                        <div class="form-control-associate" style="height:100px;"><%=DBConnect.getRemarks(FIN)%></div>
                    </div> 
                    
                    <br><br>
                    
                    <h4 align="left"><strong>Problem profile:</strong></h4>
                    <%
                      ChiefProblem currentProblem=null;
                      currentProblem=DBConnect.getAssociateProblemDetails(FIN); 
                      //System.out.println(FIN);
                    %>
                    <div class="form-group-associate">
                         <label>Problem registration date(dd/mm/yyyy)</label>
                         <%if(currentProblem != null){%>
                         <div class="form-control-associate"><%=currentProblem.getProblemRegDate()%></div>
                         <%} else {%>
                         <div class="form-control-associate"></div>
                         <%}%>
                    </div>
                    <div class="form-group-associate">
                        <label>Chief problem presented</label>
                        <%if(currentProblem != null){%>
                        <div class="form-control-associate"><%=DBConnect.getChiefProblem(FIN)%></div>
                        <%} else {%>
                        <div class="form-control-associate"></div>
                        <%}%>
                    </div> 
                    
                     <div class="form-group-associate">
                        <label for="otherProblem">Explain if above is 'Other'</label>
                         <%if(currentProblem != null){%>
                        <div class="form-control-associate" style="height:50px;"><%=currentProblem.getOtherProblem()%></div>
                        <%} else {%>
                        <div class="form-control-associate"></div>
                        <%}%>
                    </div>
                    
                    <div class="form-group-associate">
                        <label>Remarks about chief problem</label>
                        <%if(currentProblem != null){%>
                        <div class="form-control-associate" style="height:100px;"><%=currentProblem.getProblemRemarks()%></div>
                         <%} else {%>
                        <div class="form-control-associate"></div>
                        <%}%>
                   </div> 
                 </div><!--end of main content-->
                    
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
                    <div class="btn-associate-landscape btn-associate">
                      <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MENU</button>
                       <br>
                       If anything above needs to be amended,please inform a social worker or senior volunteer
                      </td> 
                    </div>  
                  
            </tr>
        </table>

    </body>
</html>
