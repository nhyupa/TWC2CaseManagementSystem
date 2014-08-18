<%-- 
    Document   : CreateWorker
    Created on : Jun 20, 2014, 12:07:53 AM
    Author     : keemin.chew.2010
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.User"%>
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
                margin-left:1%;
                width:95%;
            }
        </style>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <script>
             function onSubmit() {
                document.form1.action="AssociateCreateWorkerServlet";
            }
            
            function onCancel(){
               document.location.href="AssociateWelcome.jsp";
            }
            
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
         
        </script>
        
        <script>
             $(document).ready(function(){
                $("#createworkerform").validate({
                  rules: {

                      registerDate:{  
                          required: true,
                          date:true
                      },  
                       creator:{
                       
                          required: true
                      },
                    
                       FIN: {
                       
                            required:true
                       },
                       nationality:{
                         required:true  
                       },
                       currentPassType: {
                          required:true                            
                       },
                       passnumber: {
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
              $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
          },
          unhighlight: function (element) {
           
              $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
          }
      });


                 $("input[name='FIN']").keyup(function () {
                      var inputVal = $("input[name='FIN']").val();
                      var inputLength =  $("input[name='FIN']").val().length;
                      if(inputLength == 1){
                          // if(typeof inputVal == 'string' || inputVal instanceof String){
                          if(/^[a-z]+$/i.test (inputVal ) ){
                              console.log('valid');
                              $('#errorTxt').text('');
                          }else{
                              $('#errorTxt').text('Error: Please enter alphabet.');
                          }
                      }
                      if(inputLength > 1 && inputLength < 9){
                          var numVal = inputVal.substring(inputLength-1,inputLength);
                          console.log(numVal);
                        
                          if(isInteger(parseInt(numVal))){
                              console.log('valid');
                              $('#errorTxt').text('');
                          }else{
                              console.log('Invalid.Please enter number');
                              $('#errorTxt').text('Error: Please enter number.');
                          }
                      }
                      if(inputLength == 9) {
                          var numVal = inputVal.substring(inputLength-1,inputLength);
                          if(/^[a-z]+$/i.test (numVal ) ){
                              console.log('valid');
                              $('#errorTxt').text('');
                          }else{
                              console.log('invalid. pls enter alphabet.');
                              $('#errorTxt').text('Error: Please enter alphabet.');
                          }
                      }
                    
                      if(inputLength > 9) {
                          $('#errorTxt').text("Please enter valid FIN number.");
                      }
                  });
                
                  function isInteger(n) {
                      return n === +n && n === (n|0);
                  }

           }); //end of document.ready()           
        
          
             
        </script>
        <!--database-->
            <%
              DBConnect dbConnect = new DBConnect();
              dbConnect.connectDB();
          //dropdown menu            
         // retrieve a list of worker pass type
             ArrayList<String> passlists = new ArrayList<String>();
             passlists = DBConnect.getWorkPassList();
             
             //retrive a list of natioalities
             ArrayList<String> nationalitieslists = new ArrayList<String>();
             nationalitieslists= dbConnect.getNationalitieslists();
             
             //retrieve a list of job sectors
             ArrayList<String>jobSectorLists= new ArrayList<String>();
             jobSectorLists =dbConnect.getJobSectorlists();
             
              //retrieve a list of chief problems
             ArrayList<String>chiefProblemLists= new ArrayList<String>();
             chiefProblemLists = DBConnect.getProblemLists();
             
             //retrieve a list of hospital
             ArrayList<String>hospitalLists= new ArrayList<String>();
             hospitalLists =dbConnect.getHospitals();
             
             /**to find the name of the social worker(created by)**/
             ArrayList<User> userList = new ArrayList<User>();
             userList = dbConnect.getUsers();
            
              // to find currently login user
             User loginUser = null;
            try{
               
                for (int i = 0; i < userList.size(); i++) {
                    User user1 = userList.get(i);
                    if (user1.getUsername().equals(request.getSession().getAttribute("username").toString())) {  //Find loginUser by using session user information
                        loginUser = user1;
                    }
                }
            }catch(Exception ex){   

            }
                              
        %>
        <title>Create Worker</title>
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
                <td class="containerB" style="height:10%">
                    
                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%">
                    
                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                    <div class="headertitle-associate">CREATE WORKER</div>
                </td> 
            </tr>
            
            <tr>
                <td class="containerE" valign="top" style="height:10%" >
                     <%    if (loginUser==null){response.sendRedirect("index.jsp"); return;} %> 
                    <div class="maincontent-associate">
                          <h4 align="left" valign='top'><strong>Worker profile</strong></h4>     
                    <form id="createworkerform" name="form1" method="post"> 
                        <div class="form-group-associate">
                            <label><span style="color:red;">*</span>Registration date(dd/mm/yyyy)</label>
                            <input type="date" class="form-control-associate col-xs-2" name="registerDate">
                        </div>       
                        <br><br>
                            <div class="form-group-associate">
                                <label><span style="color:red;"></span>Created by</label>   
                                <div class="form-control-associate"><%=loginUser.getfullName()%></div>
                                <%session.setAttribute("creator",loginUser.getfullName());%>
                        </div> 
                        
                        <div class="form-group-associate">
                            <label>Name of worker(50)</label>   
                            <textarea rows="2" name="workerCreator" class="form-control-associate" maxlength="50"></textarea>
                        </div> 
                        
                        <div class="form-group-associate">
                            <label for="passNumber"><span style="color:red;">*</span>FIN Number(20)</label><span style="color:red;font-size: 9"  id="errorTxt"></span></label>
                        <input type="text" id="passnumber" name="FIN" class="form-control-associate col-xs-2" maxlength="20">
                        <br><br>
                           <!-- <button type="button" class="btn btn-primary btn-xs" style="margin-top:1%; margin-left:1%;" >VALIDATE</button>-->
                            <br>&nbsp;&nbsp;&nbsp;Use a paper or if he has no FIN
                            
                        </div> 
                        
                        <div class="form-group-associate">
                            <label>Gender</label>
                            <select class="form-control-associate" name="gender">
                                <option value="M" selected>M</option> 
                                <option value="F">F</option>
                            </select>
                        </div>
                        
                        <div class="form-group-associate">
                            <label >Nationality</label>
                            <select class="form-control-associate col-xs-2" name="nationality">
                                <option value="">Select from list  </option> 
                                <% for(int i=0;i<nationalitieslists.size();i++){
                                   String country=nationalitieslists.get(i);
                                %>
                                <option><%=country%></option>
                                <%}%>
                            </select>
                        </div>   
                            <br><br>
                        <div class="form-group-associate">
                            <label for="otherExplanation2">Explain if above is 'Other'(50)</label>
                            <textarea rows="2" id="otherExplanation2" maxlength="50" class="form-control-associate" name="nationalityMore"></textarea>
                        </div>
                        
                        <div class="form-group-associate">
                            <label>Date of birth(dd/mm/yyyy)</label>
                            <input type="date" class="form-control-associate" name="dateOfBirth">
                        </div>
                        <br><br>
                        
                        
                        
                        <h4>Pass currently held</h4>
                        
                        <div class="form-group-associate">
                            <label ><span style="color:red;">*</span>Pass type currently held</label>
                            <select class="form-control-associate col-xs-2" name="currentPassType">
                                <option value="">select from list</option>
                                <%
                                  for (int i = 0; i < passlists.size(); i++) {
                                      String passtype = passlists.get(i);
                                %>
                                <option><%=passtype%></option>
                                <% } %>
                            </select>
                        </div>
                            <br><br>
                        <div class="form-group-associate">
                            <label for="otherexplanation for pass type">Explain if above is 'Other'(50)</label>
                            <textarea rows="2" id="otherexplanation" maxlength="50" class="form-control-associate" name="passExplain"></textarea>        
                        </div>
                        
                        <div class="form-group-associate">
                            <label for="passNumber"><span style="color:red;">*</span>Pass Number(20)</label>
                            <input type="text" name="passnumber" maxlength=20 class="form-control-associate col-xs-2" id="passNum">                        
                        </div>
                        <br><br>
                        <div class="form-group-associate">
                            <label >Pass issue date(dd/mm/yyyy)</label>  
                            <input type="date" name="passIssueDate" class="form-control-associate">
                        </div>
                        <br><br>
                         <h4><b>Job profile</b></h4>
                    <div class="form-group-associate">
                        <label for="employer name"><span style="color:red;">*</span>Name of employer(50)</label>
                        <textarea rows="2"  id="employer name" maxlength="50" class="form-control-associate col-xs-2" name="employerName"></textarea>
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
                        <label for="jobSector">Job sector</label>
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
                        <input type="text" id="occupation" maxlength="50" class="form-control-associate" name="occupation">
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="job start">When commenced this job?(50)</label>
                        <textarea rows="2" id="job start" maxlength="50" class="form-control-associate" name="commencedDate"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="tjs job">Is this a TJS job?</label>
                        <select class="form-control-associate" name="TJS"> 
                            <option value="Y">Y</option>
                            <option value="N" selected>N</option>
                        </select>                      
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="remarks">Remarks about job(200)</label>
                        <textarea rows="4" id="remarks" maxlength="200" class="form-control-associate" name="remarks"></textarea>
                    </div> 
                        <br><br>
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
                        <textarea rows="2" id="other explanation for chief problem" maxlength="50" class="form-control-associate" name="otherchiefproblem"></textarea>
                    </div>
                    
                    <div class="form-group-associate">
                        <label for="chief prob remarks">Remarks about chief problem(200)</label>
                        <textarea rows="4" name="chief prob remarks" maxlength="200" class="form-control-associate"></textarea>
                    </div> 
                    
                    <br/>
                    <h4>Other</h4>
                    <div class="form-group-associate">
                        <label >Injury date(dd/mm/yyyy)</label>
                        <input type="date" class="form-control-associate" name="injuryDate">
                    </div>
                    
                    <div class="form-group-associate">
                        <label for="injured body parts">Injured body parts(500)</label>
                        <textarea rows="5" maxlength="500" class="form-control-associate" name="injuryBodyPart"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label >Current hospital</label>
                        <select name="hospital"  class="form-control-associate">
                            <option value="">select from list</option>
                             <% for(int i=0;i<hospitalLists.size();i++){
                                   String hospitaltype=hospitalLists.get(i);
                                %>
                                <option><%=hospitaltype%></option>
                                <%}%>   
                        </select>
                    </div> 
                        
                     <div class="form-group-associate">
                        <label for="hospital other explanation">Explain if above is 'Other'(50)</label>
                        <textarea rows="2" id="hospital other explanation" maxlength="50" class="form-control-associate" name="otherhospitalexplanation"></textarea>
                    </div> 
                    
                    <div class="form-group-associate">
                        <label for="have lawyer">Does worker have lawyer for this problem?</label>
                        <select class="form-control-associate" name="hasLawyer">
                            <option value="Y">Y</option>
                            <option value="N">N</option>
                        </select>
                    </div> 
                    <div class="form-group-associate">
                        <label for="law firm"> Name of law firm(50)</label>
                        <textarea rows="2" id="lawFirm" maxlength="50" class="form-control-associate" name="lawFirmName"></textarea>
                    </div>

                    </div>  <!--end of main content-->
                  
                        
                </td> 
            </tr>
             
            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
                   <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit();" style="width:115px;">SAVE &<br/>Go to Menu</button>
                        </form>
                       &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to HOMEPAGE</button>
                    </div>
                    
                </td> 
            </tr>
            
        </table>
    
</body>
</html>
