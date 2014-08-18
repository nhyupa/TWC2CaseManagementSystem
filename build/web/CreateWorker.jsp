<%-- 
    Document   : CreateWorker
    Created on : Jun 20, 2014, 12:07:53 AM
    Author     : keemin.chew.2010
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <script>
            function onCancel(){
               document.location.href="AssociateWelcome.jsp";
            }
            
            function onSubmit() {
                document.form.action="AssociateCreateWorkerServlet";
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

        <title>Create Worker</title>
    </head>
    <body>
        <%
              DBConnect dbConnect = new DBConnect();
              dbConnect.connectDB();
          //dropdown menu            
         // retrieve a list of worker pass type
             ArrayList<String> passlists = new ArrayList<String>();
             passlists = dbConnect.getWorkerPasslists();
             
             //retrive a list of natioalities
             ArrayList<String> nationalitieslists = new ArrayList<String>();
             nationalitieslists= dbConnect.getNationalitieslists();
                              
           %>
    
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
                   <div class="headertitle">CREATE WORKER</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top">
                   <h4 align="left" valign='top'><strong>Worker profile</strong></h4>     
                   <form id="createworkerform" name="form" method="post">  
                       <div class="form-group"  >
                           <label><span style="color:red;">*</span>Registration date(dd/mm/yyyy)</label>
                           <input type="date" class="form-control" name="registerDate">
                       </div>       

                       <div class="form-group">
                           <label ><span style="color:red;">*</span>Created by(20)</label>
                           <input type="text"  class="form-control" name="creator" maxlength="20">
                           `</div>  
                       <div class="form-group">
                           <label >Name of worker(50)</label>   
                           <input type="text" name="workerCreator" class="form-control" maxlength="50">
                       </div> 

                       <div class="form-group">
                           <label for="passNumber"><span style="color:red;">*</span>FIN Number(20)</label><span style="color:red;font-size: 9"  id="errorTxt"></span></label>
                                <input type="text" id="passnumber" name="FIN" class="form-control" maxlength="20"> 
                                <button type="button" class="btn btn-primary btn-xs" >VALIDATE</button> 
                           <br/>Use a paper or if he has no FIN
                        
                       </div> 
                          
                    <div class="form-group">
                        <label>Gender</label>
                        <select class="form-control" name="gender">
                           <option value="male" selected>M</option> 
                           <option value="female">F</option>
                        </select>
                     </div>
                    
                    <div class="form-group">
                        <label >Nationality</label>
                        <select class="form-control" placeholder="select from list" name="nationality">
                            <option value="">Select from list  </option> 
                             <% for(int i=0;i<nationalitieslists.size();i++){
                                String country=nationalitieslists.get(i);
                             %>
                             <option><%=country%></option>
                             <%}%>
                        </select>
                   </div>    
                    
                    <div class="form-group">
                        <label for="other explanation for nationality">Explain if above is 'Other'(50)</label>
                        <textarea rows="3" id="otherExplanation2" maxlength="50" class="form-control" name="workerExplain1"></textarea>
                    </div>
                    
                    <div class="form-group">
                         <label>Date of birth(dd/mm/yyyy)</label>
                         <input type="date" class="form-control" name="dateOfBirth">
                      </div>
                     
                    <h4>Pass currently held</h4>
                    
                    <div class="form-group">
                        <label ><span style="color:red;">*</span>Pass type currently held</label>
                      <select class="form-control" name="currentPassType">
                            <option value="">select from list</option>
                            <%
                              for (int i = 0; i < passlists.size(); i++) {
                                  String passtype = passlists.get(i);
                            %>
                            <option><%=passtype%></option>
                                <% } %>
                      </select>
                    </div>
                    <div class="form-group">
                        <label for="otherexplanation for pass type">Explain if above is 'Other'(50)</label>
                   
                    <textarea rows="3" id="otherexplanation" maxlength="50" class="form-control" name="passExplain1"></textarea>            
                      </div>

                    <div class="form-group">
                        <label for="passNumber"><span style="color:red;">*</span>Pass Number(20)</label>
                        <input type="text" name="passnumber" maxlength=20 class="form-control" id="passNum">                        
                    </div>
                    
                    <div class="form-group">
                        <label >Pass issue date(dd/mm/yyyy)</label>
                    
                        <input type="date" class="form-control">
                    </div>
                    <br>
                    
                    
                    <h4>Job profile</h4>
                    <div class="form-group">
                        <label for="employer name"><span style="color:red;">*</span>Name of employer(50)</label>                   
                        <textarea id="employer name" maxlength="50" class="form-control" name="employerName"></textarea> 
                    </div>
                    
                    <div class="form-group">
                        <label><span style="color:red;">*</span>Workpass type that came with the job</label>   
                        <select class="form-control" name="passTypeWithJob" >
                            <option value="">select from list</option>
                            <%
                              for (int i = 0; i < passlists.size(); i++) {
                                  String passtype = passlists.get(i);
                            %>
                            <option><%=passtype%></option>
                                <% } %>
                            
                        </select>
                    </div>    
                    
                    
                    <div class="form-group">
                        <label for="other explanation2">Explain if above is 'Other'(50)</label>
                    </div>
                        <textarea id="otherExplanation2" maxlength="50" class="form-control"></textarea>
                    
                    
                    <div class="form-group">
                        <label for="jobSector">Job sector(50)</label>
                    </div>
                        <textarea id="otherExplanation2" maxlength="50" class="form-control"></textarea>
                    
                    
                     <div class="form-group">
                        <label for="other explanation2">Explain if above is 'Other'(50)</label>
                    </div>
                        <textarea id="otherExplanation2" maxlength="50" class="form-control"></textarea>
                                       
                    
                    <div class="form-group">
                        <label for="occupation">Occupation(50)</label>
                    </div>
                        <textarea id="occupation" maxlength="50" class="form-control"></textarea>
                    
                    
                    <div class="form-group">
                        <label for="job start">When commenced this job?(50)</label>
                    </div>
                        <textarea id="job start" maxlength="50" class="form-control"></textarea>
                     
                    
                    <div class="form-group">
                        <label for="tjs job">Is this a TJS job?</label>
                    </div>
                        <select class="form-control"> 
                            <option value="true">Y</option>
                            <option value="false" selected>N</option>
                        </select>                      
                     
                    
                    <div class="form-group">
                        <label for="remarks">Remarks about job(200)</label>
                    </div>
                        <textarea id="remarks" maxlength="200" class="form-control"></textarea>
                     
                    <br/>
                    
                    <h4>Problem profile</h4>
                    <div class="form-group">
                        <label for="chief prob"><span style="color:red;">*</span>Chief problem presented</label>                    
                        <select class="form-control" name="chiefProb"> 
                            <option value="">select from list </option>
                            <option value="Contract dispute">Contract dispute</option>
                            <option value="Criminal investigation/charges">Criminal investigation/charges</option>
                            <option value="Denial of medical treatment">Denial of medical treatment</option>
                            <option value="Forced repat/transportation">Forced repat/transportation</option>
                            <option value="Housing">Housing</option>
                            <option value="Illegal deployment">Illegal deployment</option>
                            <option value="Illegal working">Illegal working</option>
                            <option value="Illness">Illness</option>
                            <option value="Injury, non-work">Injury, non-work</option>
                            <option value="Injury, work">Injury, work</option>
                            <option value="Insufficient work assigned">Insufficient work assigned</option>
                            <option value="Kickbacks">Kickbacks</option>
                            <option value="Loss/retention of personal docs">Loss/retention of personal docs</option>
                            <option value="Mistreatment">Mistreatment</option>
                            <option value="No rest day or excessive hours">No rest day or excessive hours</option>
                            <option value="Overstay social visit pass">Overstay social visit pass</option>
                            <option value="Overstay work pass/special pass">Overstay work pass/special pass</option>
                            <option value="Premature termination">Premature termination</option>
                            <option value="Recruitment fail, not scam">Recruitment fail, not scam</option>
                            <option value="Recruitment fail, scam/misrepresent">Recruitment fail, scam/misrepresent</option>
                            <option value="Reimbursement unsatisfied">Reimbursement unsatisfied</option>
                            <option value="Resignation/Change of employer">Resignation/Change of employer</option>
                            <option value="Run away">Run away</option>
                            <option value="Safety violation">Safety violation</option>
                            <option value="Salary/deductions">Salary/deductions</option>
                            <option value="Work pass revoked by MOM">Work pass revoked by MOM</option>
                            <option value="Oher">Other</option>
                        </select>
                    </div>
                    
                     <div class="form-group">
                        <label for="other explanation3">Explain if above is 'Other'(50)</label>
                    </div>
                        <textarea id="other explanation3" maxlength="50" class="form-control"></textarea>
                    
                    
                    <div class="form-group">
                        <label for="chief prob remarks">Remarks about chief problem(200)</label>
                    </div>
                        <textarea id="chief prob remarks" maxlength="200" class="form-control"></textarea>
                    
                    
                    <br/>
                    <h4>Other</h4>
                    <div class="form-group">
                        <label >Injury date(dd/mm/yyyy)</label>
                    </div>
                        <input type="date" class="form-control">
                    
                    
                    <div class="form-group">
                        <label for="injured body parts">Injured body parts(500)</label>
                    </div>
                        <textarea maxlength="500" class="form-control"></textarea>
                    
                    
                    <div class="form-group">
                        <label >Current hospital</label>
                    </div>
                        <select name="hospital"  class="form-control">
                            <option value="0">select from list</option>
                            <option value="Alexandra">Alexandra</option>
                            <option value="CGH">CGH</option>
                            <option value="Gleneagles">Gleneagles</option>
                            <option value="KTPH">KTPH</option>
                            <option value="Mt Alvernia">Mt Alvernia</option>
                            <option value="Mt Eliz - Mt Eliz">Mt Eliz - Mt Eliz</option>
                            <option value="Mt Eliz - Novena">Mt Eliz - Novena</option>
                            <option value="Ng Teng Fong">Ng Teng Fong</option>
                            <option value="NUH">NUH</option>
                            <option value="Raffles">Raffles</option>
                            <option value="SGH">SGH</option>
                            <option value="TTSH">TTSH</option>
                            <option value="Westpoint">Westpoint</option>
                            <option value="Other">Other</option>
                        </select>
                     
                    
                     <div class="form-group">
                        <label for="hospital other explanation">Explain if above is 'Other'(50)</label>
                    </div>
                        <textarea id="hospital other explanation" maxlength="50" class="form-control"></textarea>
                    
                    
                    <div class="form-group">
                        <label for="have lawyer">Does worker have lawyer for this problem?</label>
                    </div>
                        <select class="form-control">
                            <option value="true" selected>Y</option>
                            <option value="false">N</option>
                        </select>
                     
                    
                    <div class="form-group">
                        <label for="law firm"> Name of law firm(50)</label>
                    </div>   
                        <textarea id="lawFirm" name="lawfirmname" maxlength="50" class="form-control"></textarea>
                </td> 
            </tr>

            <tr>
                <td class="containerF" style="height:10%">
                     <div align="center">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE &<br/>Go to Menu</button>
                             </form> 

                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to Welcome</button>
                    </div>
                </td> 
            </tr>
      
        </table>
    </body>
</html>
