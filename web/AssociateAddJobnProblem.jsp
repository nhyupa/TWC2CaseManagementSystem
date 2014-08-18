<%-- 
    Document   : AddJobnProblem
    Created on : Jun 19, 2014, 11:29:53 PM
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
            .form-control-associate{
                width:95%;
                margin-left:1%;
            }
        </style>
        
         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <!--javascript-->
        <script>
            function onCancel(){
               document.location.href="AssociateWelcome.jsp";
            }
            
            function onSubmit() {
              document.form1.action="/TWC2-CaseManagementSystem/AssociateAddJobAndProblemServlet"
            }
            
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        <script>
             $(document).ready(function(){
              $("#addjobform").validate({
                rules: {
                     registerDate:{
                       required:true  
                     },
                     currentpasstype: {
                         required:true                            
                     },
                      passNumber: {
                         required:true
                        
                      },
                       employerName: {
                           required:true                         
                       },
                       passTypeWithJob: {
                           required:true                           
                       },
                       chiefProb: {
                           required:true
                       }
                      
           
        },
        highlight: function (element) {
            $(element).closest('.form-group-associate').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group-associate').removeClass('has-error').addClass('has-success');
        }
    });
}); //end document.ready

        </script>

        
         <!--Database-->
                      <%
              DBConnect dbConnect = new DBConnect();
              dbConnect.connectDB();
          //dropdown menu            
         // retrieve a list of worker pass type
             ArrayList<String> passlists = new ArrayList<String>();
             passlists = dbConnect.getWorkerPasslists();
         
                   //retrieve a list of job sectors
             ArrayList<String>jobSectorLists= new ArrayList<String>();
             jobSectorLists =dbConnect.getJobSectorlists();
                              
             //retrieve a list of chief problems
             ArrayList<String>chiefProblemLists= new ArrayList<String>();
             chiefProblemLists =dbConnect.getChiefProblems();
             
             //retrieve a list of hospital
             ArrayList<String>hospitalLists= new ArrayList<String>();
             hospitalLists =dbConnect.getHospitals();
          
           %>
        <title>Add Job and Problem</title>
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
                <td class="containerB" valign="top" style="height:10%">
                    <div class="worker-details-associate">
                       Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=session.getAttribute("workerName")%><br>
                       FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br>
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
                   <div class="headertitle-associate"> ADD JOB & PROBLEM</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top"style="height:10%">
                    <div class="maincontent-associate">
                    <h4 align="left"><b>Pass currently held</b></h4>  
                 <form id="addjobform" method="post" name="form1">
                        <div class="form-group-associate" >
                            <label><span style="color:red;">*</span>Registration date(dd/mm/yyyy)</label>
                            <input type="date" class="form-control-associate col-xs-2" name="registerDate">
                       </div>
                     <br><br>
                        <div class="form-group-associate">
                            <label ><span style="color:red;">*</span>Pass type currently held</label>                            
                            <select name="currentPassType" class="form-control-associate col-xs-2">
                                <option value="">Select from list</option> 
                                <% for(int i=0;i<passlists.size();i++){
                                   String passtype = passlists.get(i);
                                %>
                                <option><%=passtype%></option>
                                <%}%>
                            </select>                            
                        </div> 
                            <br><br>
                        <div class="form-group-associate">
                            <label for="other explanation for pass type">Explain if above is 'Other'(50)</label>                            
                            <textarea rows="2" id="otherexplanation" name="passExplain" class="form-control-associate" maxlength="50"></textarea>
                        </div> 

                        <div class="form-group-associate">
                            <label for="passNumber"><span style="color:red;">*</span>Pass number(20)</label>                            
                            <input type="text" name="passnumber" maxlength=20 class="form-control-associate col-xs-2" id="classNum">                            
                        </div>
                        <br><br>
                        <div class="form-group-associate">
                            <label >Pass issue date(dd/mm/yyyy)</label>                            
                            <input type="date" class="form-control-associate" name="passIssueDate">                            
                        </div>

                            <br><br>
                    <h4><b>Job profile</b></h4>
                    <div class="form-group-associate">
                        <label for="employer name"><span style="color:red;">*</span>Name of employer(50)</label>
                        <textarea rows="2" id="employer name" maxlength="50" class="form-control-associate col-xs-2" name="employerName"></textarea>
                    </div> 
                    <br><br><br>
                    <div class="form-group-associate">
                        <label ><span style="color:red;">*</span>Workpass type that came with the job</label>
                        <select name="passTypeWithJob" class="form-control-associate col-xs-2" >
                            <option value="">Select from list</option> 
                             <% for(int i=0;i<passlists.size();i++){
                                   String passtype = passlists.get(i);
                                %>
                                <option><%=passtype%></option>
                                <%}%>
                        </select>
                        </div>
                    <br><br>
                    
                    <div class="form-group-associate">
                        <label for="other explanation2">Explain if above is 'Other'(50)</label>
                        <textarea rows="2" id="otherExplanation2" maxlength="50" class="form-control-associate" name="otherPassExplanation"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="jobsector">Job sector</label>
                           <select name="jobsector" class="form-control-associate" >
                            <option value="">Select from list</option> 
                             <% for(int i=0;i<jobSectorLists.size();i++){
                                   String jobtype = jobSectorLists.get(i);
                                %>
                                <option><%=jobtype%></option>
                                <%}%>
                        </select>
                       
                    </div> 
                    
                     <div class="form-group-associate">
                        <label for="other explanation2">Explain if above is 'Other'(50)</label>
                        <textarea rows="2" id="otherExplanation for job sector" maxlength="50" class="form-control-associate" name="jobothersector"></textarea>
                    </div>                    
                    
                    <div class="form-group-associate">
                        <label for="occupation">Occupation(50)</label>
                        <textarea rows="2" id="occupation" maxlength="50" class="form-control-associate" name="occupation"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="job start">When commenced this job?(50)</label>
                        <textarea rows="2" id="job start" maxlength="50" class="form-control-associate" name="commencement"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="tjs job">Is this a TJS job?</label>
                        <select class="form-control-associate" name="tjs"> 
                            <option value="Y">Y</option>
                            <option value="N"selected>N</option>
                        </select>                      
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="remarks">Remarks about job(200)</label>
                        <textarea rows="4" id="remarks" maxlength="200" class="form-control-associate" name="remarks"></textarea>
                    </div> 
                    <br>
                    
                    <h4>Problem profile</h4>
                    <div class="form-group-associate">
                        <label for="chief prob"><span style="color:red;">*</span>Chief problem presented</label>
                        <select class="form-control-associate col-xs-2" name="chiefProb">     
                            <option value="">select from list </option>
                             <% for(int i=0;i<chiefProblemLists.size();i++){
                                   String problemtype =chiefProblemLists.get(i);
                                %>
                                <option><%=problemtype%></option>
                                <%}%>             
                        </select>
                    </div> 
                    <br><br>
                     <div class="form-group-associate">
                        <label for="other explanation3">Explain if above is 'Other'(50)</label>
                        <textarea rows="2" id="other explanation for chief problem" maxlength="50" class="form-control-associate" name="chiefProbOthers"></textarea>
                    </div>
                    
                    <div class="form-group-associate">
                        <label for="chief prob remarks">Remarks about chief problem(200)</label>
                        <textarea rows="4" name="chiefProbRemarks" maxlength="200" class="form-control-associate"></textarea>
                    </div> 
                    
                    <br/>
                    <h4>Other</h4>
                    <div class="form-group-associate">
                        <label >Injury date(dd/mm/yyyy)</label>
                        <input type="date" class="form-control-associate" name="InjuryDate">
                    </div>
                    
                    <div class="form-group-associate">
                        <label for="injured body parts">Injured body parts(500)</label>
                        <textarea rows="5" maxlength="500" class="form-control-associate" name="InjuredBodyParts"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label >Current hospital</label>
                        <select name="hospital"  class="form-control-associate col-xs-2">
                            <option value="">select from list</option>
                             <% for(int i=0;i<hospitalLists.size();i++){
                                   String hospitaltype=hospitalLists.get(i);
                                %>
                                <option><%=hospitaltype%></option>
                                <%}%>   
                        </select>
                    </div> 
                        <br><br>
                    
                     <div class="form-group-associate">
                        <label for="hospital other explanation">Explain if above is 'Other'(50)</label>
                        <textarea rows="2" id="hospital other explanation" maxlength="50" class="form-control-associate"  name="hospitalOther"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="have lawyer">Does worker have lawyer for this problem?</label>
                        <select class="form-control-associate" name="Lawyer">
                            <option value="Y">Y</option>
                            <option value="N">N</option>
                        </select>
                    </div> 
                    <div class="form-group-associate">
                        <label for="law firm"> Name of law firm(50)</label>
                        <textarea rows="2" id="lawFirm" maxlength="50" class="form-control-associate" name="LawFirm"></textarea>
                    </div>
                  </div><!--end of div maincontent-->
                </td> 
            </tr> 
                   
            
            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
                   <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()"style="width:115px;">SAVE &<br/>Go to Menu</button>
                         </form>
                        &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to HOMEPAGE</button>
                    </div>                                     
                  
                </td> 
            </tr>
        </table>
    </body>
</html>
