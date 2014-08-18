<%-- 
    Document   : ViewProfile
    Created on : Jun 13, 2014, 5:27:55 PM
    Author     : keemin.chew.2010
--%>


<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
           <script>
                function onSubmit(){
                   document.location.href="AssociateMenu.jsp";
                }
           </script>

        <title> View Profile</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                   <div class="col-xs-5 col-md-5" align="right" >
                        <img src="image/logo_camans_180w.gif" width="100" />
                    </div>  
                    <div class="username-background-associate col-xs-6 col-md-1" style="margin-top:20px;" >
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
                <td class="containerB" valign="top" style="height:10%">
                    Name:<%=(String)session.getAttribute("workerName")%><br/>
                    FIN:<%=(String)session.getAttribute("FIN")%><br/>
                    Emp'yr:<br/>
                    Prob:<br/>
                    Inj dt:<br/>
                </td> 
            </tr>
            <tr>
                <td class="containerC">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                      <div class="headertitle">VIEW</div>
                </td> 
            </tr>
            <% String FIN = (String)session.getAttribute("FIN");
             %>
            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <h4 align="left"><strong>Worker Profile:</strong></h4> 
                     <div>
                        <label>Registration date(dd/mm/yyyy)</label><br/>
                        <div class="form-control"><label><%=DBConnect.getRegistrationDate(FIN)%></label></div>
                    </div> 
                    <div>
                        <label>Created by</label>
                        <div class="form-control"><label><%=DBConnect.getCreatedBy(FIN)%></label> </div>
                    </div> 
                    
                    <div>
                        <label>Name of worker</label>
                        <div class="form-control"><label><%=DBConnect.getWorkername(FIN)%> </label></div>
                    </div> 
                    
                     <div>
                         <label>FIN Number</label>
                         <div class="form-control"><%=(String)session.getAttribute("FIN")%></div>
                    </div>
                    <div>
                        <label >Gender</label>
                        <div class="form-control"><label><%=DBConnect.getGender(FIN)%> </label></div>
                    </div>
                    
                    <div>
                        <label>Nationality</label>
                        <div class="form-control"><label><%=DBConnect.getNationality(FIN)%> </label></div>
                    </div>
                    
                    <div>
                        <label for="otherNationality">Explain if above is 'Other'</label>
                         <div class="form-control" style="height:80px;"> </div>
                    </div> 
                    
                     <div>
                         <label>Date of birth(dd/mm/yyyy)</label>
                         <div class="form-control"><label><%=DBConnect.getDateOfBirth(FIN)%> </label></div>
                    </div> 
                    <br><br>
                    <h4 align="left"><strong>Job profile :</strong></h4>
                    <div >
                        <label>Name of employer</label>
                        <div class="form-control"><label><%=session.getAttribute("employerName")%> </label></div>
                    </div> 
                    
                    <div>
                        <label>Workpass type that came with the job</label>
                        <div class="form-control "><label><%=DBConnect.getWorkpassType(FIN)%> </label></div>
                    </div> 
                    
                    <div>
                        <label for="otherWorkpass">Explain if above is 'Other'</label>
                        <div class="form-control" style="height:80px;"></div>
                       
                    </div> 
                    
                    <div>
                        <label>Job sector</label>
                        <div class="form-control "><label><%=DBConnect.getJobSector(FIN)%> </label></div>
                    </div> 
                    
                     <div>
                        <label for="otherJobSector">Explain if above is 'Other'</label>
                         <div class="form-control" style="height:80px;"></div>
                        
                    </div>
                    
                    <div>
                        <label>Occupation</label>
                        <div class="form-control "><label><%=DBConnect.getOccupation(FIN)%> </label></div>
                    </div> 
                    
                    <div >
                        <label>When commenced this job?</label>
                        <div class="form-control "><label><%=DBConnect.getCommencedDate(FIN)%></label></div>
                    </div> 
                    
                    <div >
                        <label>Is this a TJS job?</label>
                        <div class="form-control"><%=DBConnect.getStatus(FIN)%> </div>
                    </div> 
                    
                    <div >
                        <label>Remarks about job</label>
                        <div class="form-control" style="height:80px;"><label><%=DBConnect.getRemarks(FIN)%> </label></div>
                    </div> 
                    
                    <br><br>
                    
                    <h4 align="left"><strong>Problem profile:</strong></h4>
                    <div>
                         <label>Problem registration date(dd/mm/yyyy)</label>
                         <div class="form-control"></div>
                         
                    </div>
                    <div >
                        <label>Chief problem presented</label>
                        <div class="form-control"></div>
                    </div> 
                    
                     <div >
                        <label for="otherProblem">Explain if above is 'Other'</label>
                        <div class="form-control" style="height:80px;"></div>
                    </div>
                    
                    <div >
                        <label>Remarks about chief problem</label>
                        <div class="form-control" style="height:80px;"></div>
                    </div> 
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                  <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MENU</button>
                  <br/>
                  If anything above needs to be amended,please inform a social worker or senior volunteer
                </td> 
            </tr>
        </table>

    </body>
</html>
