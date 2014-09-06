<%-- 
    Document   : AssociateEditR2R
    Created on : Aug 1, 2014, 4:50:19 PM
    Author     : keemin.chew.2010
--%>



<%@page import="src.R2R"%>
<%@page import="src.DBConnect"%>
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
                $("#editr2rform").validate({
                    rules:{
                     
                        apptdate:{
                             date:true,
                             required:true
                        },
                        appthospital:{
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
                  document.location.href="AssociateOverviewR2R.jsp";
             }
             
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateEditR2RServlet"
            }
        </script>
        
    <!--database-->
      <%
          DBConnect.connectDB();
          String id2 = (String)request.getSession().getAttribute("id");
          R2R r2r=DBConnect.getR2RRecords2(id2);
          String FIN=r2r.getFIN();
          String workerName = DBConnect.getWorkername(FIN);
      %>

        <title>Edit R2R</title>
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
                    <div class="headertitle-associate" >EDIT RECORD</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <strong>R2R appointment</strong>
                        <br><br>
                        <form id="editr2rform" name="form1" method="post">
                        
                        <div class="form-group-associate">
                            Name of worker
                            <div class="form-control-associate" style="height:50px;"><%=workerName%></div>
                        </div>
                        <div class="form-group-associate">
                            FIN
                            <div class="form-control-associate"><%=FIN%></div>
                        </div>
                        <div class="form-group-associate">
                            Phone
                            <div class="form-control-associate"><%=DBConnect.getPhoneNumber(FIN) %></div>
                        </div>
                        <div class="form-group-associate">
                             <span style="color:red">*</span>Date of appointment
                             <input type="date" class="form-control-associate"style="background-color:yellow" name="apptdate" value="<%=r2r.getR2RDate() %>">
                        </div>
                            
                         <div class="form-group-associate">
                            Time of appointment (20)
                            <input type="text" class="form-control-associate"style="background-color:yellow" name=appttime" maxlength="20" value="<%=r2r.getR2RTime() %>">
                         </div>
                         <div class="form-group-associate">
                             <span style="color:red">*</span>Hospital for appointment (20)
                            <input type="text" class="form-control-associate"style="background-color:yellow" name="appthospital" maxlength="20" value="<%=r2r.getR2RHosp() %>">
                        </div>
                         <div class="form-group-associate">
                            Dept/doctor for appointment (50)
                            <textarea rows="2" class="form-control-associate"style="background-color:yellow" name="apptdoctor" maxlength="50" value="<%=r2r.getR2RDept() %>"></textarea>
                        </div>
                         <div class="form-group-associate">
                            R2R first volunteer(20)
                            <input type="text" class="form-control-associate"style="background-color:yellow" name="r2r1stvolunteer" maxlength="20" value="<%=r2r.getR2R1() %> ">
                         </div>
                        <div class="form-group-associate">
                            R2R second volunteer(20)
                            <input type="text" class="form-control-associate"style="background-color:yellow" name="r2r2ndvolunteer" maxlength="20" value="<%=r2r.getR2R2() %>">
                         </div>
                        <div class="form-group-associate">
                            Purpose of appointment(50)
                            <textarea rows="2" class="form-control-associate"style="background-color:yellow" name="purpose" maxlength="50" value="<%=r2r.getR2RPurpose()%> "></textarea>
                        </div>
                        <div class="form-group-associate">
                            Pre-appt notes (200)
                            <textarea rows="4" class="form-control-associate"style="background-color:yellow" name="preapptnotes" maxlength="200" value="<%=r2r.getR2RPreApptNotes() %>"></textarea>
                        </div>
                          <div class="form-group-associate">
                            Post-appt notes (200)
                              <textarea rows="4" class="form-control-associate"style="background-color:yellow" name="postapptnotes" maxlength="200" value="<%=r2r.getR2RPostApptNotes() %>"></textarea>
                        </div>
                          <div class="form-group-associate">
                            Feedback (200)
                             <textarea rows="4" class="form-control-associate"style="background-color:yellow" name="feedback" maxlength="200" value="<%=r2r.getR2RFeedback() %>"></textarea>
                        </div>
                          <div class="form-group-associate">
                            Medical cost of this appt (number,2)
                            <input type="text" class="form-control-associate" style="background-color:yellow" name="medicalcost" value="<%=r2r.getR2RMedCost()%>" >
                         </div>
                          <div class="form-group-associate">
                            How much paid by volunteer (number,2)
                            <input type="text" class="form-control-associate" style="background-color:yellow" name="amtpaidbyvolunteer" value="<%=r2r.getR2ROutlay() %>">
                         </div>
                     </div><!--end of main content-->
                       
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <br><br>
                    <div class="btn-associate-landscape btn-associate">
            <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE &<br/>Go back to R2R Overview</button>
                         </form>
                    &nbsp;&nbsp;
             <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()"style="height:55px;">BACK TO HOMEPAGE</button>
                        
            
                  </div>   
                </td> 
            </tr>
        </table>

    </body>
</html>

