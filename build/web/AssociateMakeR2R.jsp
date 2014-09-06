<%-- 
    Document   : Make r2r
    Created on : Jun 13, 2014, 1:52:12 AM
    Author     : keemin.chew.2010
--%>
<%@page import="src.DBConnect"%>
<%@page import="src.R2R"%>
<%@page import="java.util.ArrayList"%>
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
        
      
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
          <!--jquery-->
         <script>
            $(document).ready(function(){
                $("#appendmaker2rform").validate({
                    rules:{
                     
                        registerdate:{
                             date:true,
                             required:true
                        },
                        hospital:{
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
        
          <script>
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateMakeR2RServlet"
            }
        </script>
        
        <!--database-->
        <% 
            
            DBConnect dbConnect = new DBConnect();
              dbConnect.connectDB();
              
              ArrayList<R2R> r2rList = null;
              r2rList = new ArrayList<R2R>(); 
              String FIN = (String)session.getAttribute("FIN");
              r2rList=dbConnect.getR2RRecords(FIN);
              
              //retrieve a list of hospital
             ArrayList<String>hospitalLists= new ArrayList<String>();
             hospitalLists =dbConnect.getHospitals();
        %>
        
        <title>Make R2R</title>
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
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br>
                        Prob:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("problemNameShow")%><br>
                        Inj dt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryDate")%><br>
                        Inj bp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryBodyPart")%><br>
                        Hosp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentHospitalName")%><br>
                        Law:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentLawyer")%><br>
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
                    <div class="headertitle-associate" >MAKE R2R APPT</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <div class="form-group-associate">
                            <hr class="blackline-associate" style="margin-bottom:0.05%">
                            <label>Date of appt</label><br/>
                            <label>Time of appt</label><br/>
                            <label>Hosptial for appt</label><br/>
                            <label>Dept/doctor for appt</label><br/>
                            <label>R2R first volunteer</label><br/>
                            <label>R2R second volunteer</label><br/>
                            <label>Purpose of appt</label><br/>
                            <label>Pre-appt notes</label>
                                 
                          </div>
                          
                        <div class="form-group-associate">
                            <hr class="blackline-associate" style="margin-bottom:0.05%">
                             <%
                               if (r2rList != null) {
                                   // System.out.println("size" + benefitList.size());
                                for (R2R r2r1 : r2rList) {

                           %>
                             <%= r2r1.getR2RDate()%><br>
                             <%= r2r1.getR2RTime()%><br>
                             <%= r2r1.getR2RHosp()%><br>
                             <%= r2r1.getR2RDept() %><br>
                             <%= r2r1.getR2R1()%><br>
                             <%= r2r1.getR2R2()%><br>
                             <%= r2r1.getR2RPurpose()%><br>
                            <%= r2r1.getR2RPreApptNotes()%>
                            <br><br>
                             <%}}%>
                            <hr class="blackline-associate" style="margin-bottom:0.05%">
                        </div>
                        
                        
                        <form id="appendmaker2rform"  name="form1" method="post">
                        <div class="form-group-associate">
                           <span style="color:red">*</span>Date of appointment(dd/mm/yyyy)
                           <input type="date" class="form-control-associate col-xs-2" style="background-color:yellow;" name="registerdate">  
                         </div>
                            <br><br>
                        <div class="form-group-associate">
                            Time of appointment(20)
                            <input type="text" class="form-control-associate" style="background-color:yellow;" name="appttime" maxlength="20">
                       </div>

                        <div class="form-group-associate">
                            <span style="color:red">*</span>Hospital for appt (20)
                           <select name="hospitalappt"  class="form-control-associate col-xs-2" style="background-color:yellow;">
                            <option value="">select from list</option>
                              <% for(int i=0;i<hospitalLists.size();i++){
                                   String hospitaltype=hospitalLists.get(i);
                                %>
                                <option value="<%=hospitaltype%>"><%=hospitaltype%></option>
                                <%}%>   
                        </select>
                         </div>
                       <br><br>
                       <div class="form-group-associate">
                          Dept/doctor for appt (50)
                          <textarea rows="2" class="form-control-associate" style="background-color:yellow;" name="doctorappt" maxlength="50"></textarea>
                       </div>

                       <div class="form-group-associate">
                           R2R first volunteer(20)
                           <input type="text" class="form-control-associate" style="background-color:yellow;" name="r2r1stvolunteer" maxlength="20">
                       </div>

                       <div class="form-group-associate">
                           R2R second volunteer(20)
                           <input type="text" class="form-control-associate" style="background-color:yellow;" name="r2r2stvolunteer" maxlength="20">
                       </div>

                        <div class="form-group-associate">
                            Purpose of appt(50)
                            <textarea rows="2" class="form-control-associate" style="background-color:yellow;" name="apptpurpose" maxlength="50"></textarea>
                       </div>

                         <div class="form-group-associate">
                           Pre-appt notes(200)</label>
                           <textarea rows="4" class="form-control-associate" style="background-color:yellow;"name="note" maxlength="200"></textarea>
                         </div>
                    </div>       
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <br><br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MAKE APPT<br/>Go to Menu</button>
                         </form>
                    &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DON'T MAKE <br/>Go to Menu</button>
                        <br><br>
                 To edit a record, go to R2R overview
                  </div>   
                </td> 
            </tr>
        </table>

    </body>
</html>

