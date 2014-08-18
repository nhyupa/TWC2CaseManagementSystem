<%-- 
    Document   : AssociateAddProblem
    Created on : Jul 19, 2014, 4:53:33 PM
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
                margin-left:1%;
                width:95%;
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
              function onSubmit(){
               document.form1.action="/TWC2-CaseManagementSystem/AssociateAddProblemServlet";
            }
        </script>
        <script>
             $(document).ready(function(){
              $("#addjobform").validate({
                rules: {
                    registerDate:{  
                        required: true,
                        date:true
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
}); 

        </script>

         <!--Database-->
                      <%
              DBConnect dbConnect = new DBConnect();
              dbConnect.connectDB();
          //dropdown menu            
             //retrieve a list of chief problems
             ArrayList<String>chiefProblemLists= new ArrayList<String>();
             chiefProblemLists =dbConnect.getChiefProblems();
             
             //retrieve a list of hospital
             ArrayList<String>hospitalLists= new ArrayList<String>();
             hospitalLists =dbConnect.getHospitals();
          
           %>
        <title>Add Problem</title>
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
                        Emp'yr:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("employerName") %><br>
                   
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
                     <div class="headertitle-associate">ADD PROBLEM</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top"style="height:10%">
                    <div class="maincontent-associate">
                         <h4>Problem profile</h4>
                        <form id="addjobform" name="form1" method="post">
                         <div class="form-group-associate" >
                            <label><span style="color:red;">*</span>Registration date(dd/mm/yyyy)</label>
                            <input type="date" class="form-control-associate col-xs-2" name="registerDate">
                       </div>
                            <br><br>
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
                        <textarea rows="2" id="hospital other explanation" maxlength="50" class="form-control-associate" name="hospitalOther"></textarea>
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
                        
                    </div> <!--end of maincontent-->
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

