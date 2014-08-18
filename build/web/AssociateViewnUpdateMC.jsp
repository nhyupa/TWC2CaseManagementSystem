<%-- 
    Document   : ViewnUpdateMC
    Created on : Jun 13, 2014, 1:11:41 PM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.MC"%>
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
        
        <!--jquery-->
         <script>
            $(document).ready(function(){
                $("#appendMCform").validate({
                    rules:{
                         MCstatus:{
                             required:true
                             
                         },
                        registerdate:{
                             date:true,
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
        <!--javascript-->
        <script>
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
              function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateViewnUpdateMCServlet";
            }
        </script>
         <!--database-->      
                 <%            
                      String currentWorkerFIN=(String)session.getAttribute("FIN");
                      //System.out.println(currentWorkerFIN);
                      //out.println(currentWorkerFIN);
                      DBConnect dbConnect = new DBConnect();
                      dbConnect.connectDB();
                      
                      //get MC details
                      MC currentMCDetails=null;
                      currentMCDetails=dbConnect.getAssociateMCDetails(currentWorkerFIN);
                    
                    
                  %>
        <title> View & Update MC</title>
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
                  <div class="headertitle-associate">VIEW & UPDATE</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <% if(currentMCDetails!=null){%>
                           <strong>Most recent record:</strong>
                        
                        <div class="form-group-associate">
                            Date of update(dd/mm/yyyy)                           
                              <div class="form-control-associate"><%=currentMCDetails.getMCUpdate()%></div>                            
                        </div>

                        <div class="form-group-associate">
                            Current MC/Light duty status
                            <div class="form-control-associate"><%=currentMCDetails.getMCStatus()%></div>
                        </div>

                        <div class="form-group-associate">
                            Explain if above is "Other"
                            <div class="form-control-associate" style="height:50px"><%=currentMCDetails.getMCStatusMore()%></div>
                        </div>

                        <div class="form-group-associate">
                            Latest known MC expiry date(dd/mm/yyyy)                        
                            <div class="form-control-associate"><%=currentMCDetails.getMCExpDate()%></div>                            
                        </div>

                        <div class="form-group-associate">
                            Cumulative MC days so far
                            <div class="form-control-associate"><%=currentMCDetails.getMCDaysCulmul()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                            Remarks about MC status
                            <div class="form-control-associate" style="height:80px"><%=currentMCDetails.getMCRemarks()%></div>
                        </div>
                         <%}%>
                           <br><br>

                         <strong>Enter update:</strong>
                         <form id="appendMCform" name="form1" method="post">
                         <div class="form-group-associate">
                            <span style="color:red;">*</span>Date of update(dd/mm/yyyy)                            
                            <input type="date" name="registerdate" class="form-control-associate col-xs-2" style="background-color:yellow;">                            
                        </div>
                             <br><br>
                        <div class="form-group-associate"> 
                            <span style="color:red;">*</span>Current MC/Light duty status
                            <select class="form-control-associate col-xs-2" name="MCstatus" style="background-color:yellow;" >
                                <option value="" >Select from list</option>
                                <option value="Medical Leave" >Medical Leave</option>
                                <option value="Light Duty" >Light Duty</option>
                                <option value="No MC,No LD" >No MC, No LD</option>
                                <option value="Don't Know" >Don't Know</option>
                                <option value="Other">Other</option>
                           </select>
                        </div>
                             <br><br>
                        <div class="form-group-associate">
                            Explain if above is "Other" (50)
                            <textarea rows="2" class="form-control-associate" style="background-color:yellow;" name="othermcstatus" maxlength="50"></textarea>
                        </div>
                         
                        <div class="form-group-associate">
                            Latest known MC expiry date(dd/mm/yyyy)                  
                            <input type="date" class="form-control-associate" style="background-color:yellow;" name="MCDate">                            
                        </div>

                        <div class="form-group-associate">
                           Cumulative MC days so far (number,0)
                            <input type="text" class="form-control-associate"  style="background-color:yellow;" name="MCdays">
                        </div>

                        <div class="form-group-associate">
                            Remarks about MC status (200)
                            <textarea rows="4" class="form-control-associate" style="background-color:yellow;" name="MCremarks" maxlength="200"></textarea>
                        </div>
                         
                    </div><!--end of main content-->
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                       <br><br>
                   <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()" style="width:115px;">SAVE &<br/>Go to Menu</button>
                        </form>
                        &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to Menu</button>
                    </div>
                   
                </td> 
            </tr>
        </table>

    </body>
</html>

