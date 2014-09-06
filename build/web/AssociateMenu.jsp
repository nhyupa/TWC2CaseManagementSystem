<%-- 
    Document   : AssociateMenu
    Created on : Jun 12, 2014, 9:29:42 PM
    Author     : keemin.chew.2010
--%>

<%@page import="src.Problem"%>
<%@page import="src.Lawyer"%>
<%@page import="src.Hospital"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="src.InjuryDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.Worker"%>
<%@page import="src.JobProfile"%>
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
            li{
                list-style-type: none;
            }

            @media (min-width: 1024px){
                .headertitle-associate{
                    margin-left:34%;
                }
                .maincontent-associate{
                    margin-left:34%;
                }
                .btn-associate-landscape{
                    margin-right:5%;
                }
            }  

            
        </style>
        <script>
            function onSubmit(){
                document.location.href="AssociateWelcome.jsp"
            }
            function onSubmit2(){
                document.location.href="AssociatePreMenu.jsp"
            }
              function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
      <!--database-->
      <%
          String FIN=(String)session.getAttribute("FIN");
          String workerName=DBConnect.getWorkername(FIN);
          String JobKey = (String)request.getSession().getAttribute("JobKey");
          String ProbKey = (String)request.getSession().getAttribute("ProbKey");
          JobProfile job = null;
          ArrayList<JobProfile> jobs = DBConnect.retrieveJobs(FIN);
          for(int i=0; i<jobs.size(); i++){
              if(jobs.get(i).getJobKey().equals(JobKey)){
                  job = jobs.get(i);
              }
          }
   
          InjuryDetail currentInjury=DBConnect.getAssociateInjuryDetails(FIN);
          String currentInjuryDate="";
          
          if(currentInjury != null){
              if(currentInjury.getInjuryDate()!=null){
                   currentInjuryDate = currentInjury.getInjuryDate();
              }else{
                    currentInjuryDate="";
               }
          }
          
          String currentInjuryBodyPart = "";
          if(currentInjury != null){
             currentInjuryBodyPart=currentInjury.getBodyPartsInjured();
          }
         
          
          Hospital currentHosp=DBConnect.getAssociateHospitalDetails(FIN);
          String currentHospitalName = "";
          if(currentHosp != null){
                 currentHospitalName=currentHosp.getHospitalName();
          
                if(currentHospitalName==null){
                    currentHospitalName="";
                }
           }
          Lawyer currentLaw=DBConnect.getAssociateLawyerDetails(FIN);
          String currentLawyer = "";
          if(currentLaw !=null){
                currentLawyer=currentLaw.getLawyerFirm();
         }
            if(currentLawyer==null){
             currentLawyer="";
          }
      %>
        
        <title>Associates' menu</title>
        <link rel ="stylesheet" media="screen and(mix-width:600px)" href="/TWC2-CaseManagementSystem/stylesheets/AssociateDesktopVersion/">
    </head>
    <body>
        
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision" >
            <tr>
                <td class="containerA" style="height:10%" >
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
                    <div class="worker-details-associate ">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=workerName%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)session.getAttribute("FIN")%><br>
                        Emp'yr:&nbsp;&nbsp;&nbsp;&nbsp; <%= job.getEmployerName() %><br>
                        Prob: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= DBConnect.getChiefProblem(FIN, JobKey) %><br> 
                        Inj dt: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=currentInjuryDate%><br>
                        Inj bp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=currentInjuryBodyPart%><br>
                        Hosp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=currentHospitalName%><br>
                        Law:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=currentLawyer%><br>
                         <hr class="redline-associate">
                    </div>  
                  <%
                    session.setAttribute("workerName",workerName);
                    session.setAttribute("currentInjuryDate",currentInjuryDate);
                    session.setAttribute("currentInjuryBodyPart",currentInjuryBodyPart);
                    session.setAttribute("currentHospitalName",currentHospitalName);
                    session.setAttribute("currentLawyer",currentLawyer);
                  %>
                   
                </td>     
            </tr>
            <tr>
                <td class="containerC" style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                    <div class="headertitle-associate">MENU</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <div class="form-group-associate">
                           Benefit
                            <ul> 
                                <li> <a href="AssociateIssueMeal.jsp">Issue meal card</a><li>
                                <li><a href="AssociateIssueFarego.jsp">Issue Fare Go</a></li>
                                <li><a href="AssociateReferKarunya.jsp">Refer Karunya</a></li>
                                <li> <a href="AssociateMakeR2R.jsp">Make R2R appt</a></li>
                            </ul>
                         
                        </div>
                        <div class="form-group-associate">
                            View & update
                            <ul>
                                <li><a href="AssociateViewnUpdatePhone.jsp">Phone number</a></li>
                                <li><a href="AssociateViewnUpdatePassDetails.jsp">Pass details</a></li>
                                <li><a href="AssociateViewnUpdateHospital.jsp">Hospital</a></li>
                                <li><a href="AssociateViewnUpdateMC.jsp">MC status</a></li>
                                <li><a href="AssociateViewnUpdateWICA.jsp">Wica status</a></li>
                                <li><a href="AssociateViewnUpdateLawyer.jsp">Lawyer</a></li>
                                <li><a href="AssociateViewnUpdateMilestone.jsp">Milestone</a></li>
                                <li><a href="AssociateViewnUpdateTransfer.jsp">Transfer,TJS,repatriation</a></li>
                            </ul>
                        </div>
                       
                        <div class="form-group-associate">
                               &nbsp;&nbsp;&nbsp;&nbsp;View
                            <ul>
                                <li><a href="AssociateViewProfile.jsp">Profiles</a></li>
                                <li><a href="AssociateViewInjuryHistory.jsp">Injury history</a></li>
                                <li><a href="AssociateViewListCaseworkers.jsp">Caseworkers</a></li>
                                <li><a href="AssociateViewFacePic.jsp">Face pic</a></li>
                            </ul>
                        
                        </div>

                   </div>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <div class="btn-associate-landscape">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit2()">Select<br/>Different Job & Problem</button>
                        
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">EXIT<br/>this worker</button>
                    </div>
                    
                </td> 
            </tr>
        </table>

    </body>
</html>
