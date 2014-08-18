<%-- 
    Document   : ViewnUpdateTransfer
    Created on : Jun 13, 2014, 2:48:42 PM
    Author     : keemin.chew.2010
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.TTR"%>
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
                $("#appendtjsform").validate({
                    rules:{
                         tjsstatus:{
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
                document.form1.action="/TWC2-CaseManagementSystem/AssociateViewnUpdateTransferServlet"
            }
        </script>

           <!--database-->  
                 <%            
                      String currentWorkerFIN=(String)session.getAttribute("FIN");
                      System.out.println(currentWorkerFIN);
                      //out.println(currentWorkerFIN);
                      DBConnect dbConnect = new DBConnect();
                      dbConnect.connectDB();

                      TTR currentWorkerttrDetails=null;
                      currentWorkerttrDetails=dbConnect.getTtrDetails(currentWorkerFIN);
                      
                      //retrieve worker pass type dropdownmenu
                      ArrayList<String> Ttrslists = new ArrayList<String>();
                      Ttrslists= dbConnect.getTtrs();
                  %>
        <title>View & Update TJS</title>
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
                        <% if(currentWorkerttrDetails!=null){%>
                        <strong>Most recent record</strong> 
                        <div class="form-group-associate">
                            Date of update(dd/mm/yyyy)
                            <div class="form-control-associate"><%=currentWorkerttrDetails.getTtrUpdateDate()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                            Transfer,TJS or repat status
                            <div class="form-control-associate"><%=currentWorkerttrDetails.getTtrStatus()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                            Explain if above is "Other"
                            <div class="form-control-associate" style="height:80px;"><%=currentWorkerttrDetails.getTtrStatusMore()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                            Date of departure from Singapore
                            <div class="form-control-associate"><%=currentWorkerttrDetails.getDepartureDate()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                           Name of TJS or new employer
                            <div class="form-control-associate"><%=currentWorkerttrDetails.getNewEmployerName()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                            Description of TJS or new job
                            <div class="form-control-associate" style="height:80px;"><%=currentWorkerttrDetails.getNewJob()%></div>
                        </div>
                        
                        <div class="form-group-associate">
                             Remarks re transfer,TJS, or repat 
                            <div class="form-control-associate" style="height:80px;">
                               <%=currentWorkerttrDetails.getTtrRemarks()%>
                            </div>
                        </div>
                        <%}%>
                        <br><br>
                        <strong>Enter update:</strong>
                        <form id="appendtjsform" name="form1" method="post">
                        <div class="form-group-associate">
                            <span style="color:red">*</span>Date of update(dd/mm/yyyy)                          
                            <input type="date" class="form-control-associate col-xs-2"  style="background-color:yellow;" name="registerdate">
                        </div>
                            <br><br>
                         <div class="form-group-associate">
                            <span style="color:red">*</span>Transfer,TJS or repat status
                            <select class="form-control-associate col-xs-2" style="background-color:yellow;" name="tjsstatus" >
                                <option value=""> select from list</option>
                                <%
                                for (int i = 0; i < Ttrslists.size(); i++) {
                                    String milestonetype = Ttrslists.get(i);
                              %>
                              <option><%=milestonetype%></option>
                                  <% } %>
                           </select>
                        </div>
                            <br><br>
                        <div class="form-group-associate">
                              Explain if above is "Other"(200)
                            <textarea rows="4" class="form-control-associate" style="background-color:yellow;" name="othertjsstatus" maxlength="200"></textarea>
                        </div>
                        
                        <div class="form-group-associate">
                            Date of departure from Singapore(50)
                            <input type="text" class="form-control-associate"  style="background-color:yellow;" name="departuredate" maxlength="50">
                        </div>
                        
                        <div class="form-group-associate">
                            Name of TJS or new employer(50)
                            <input type="text" class="form-control-associate"  style="background-color:yellow;" name="employername" maxlength="50">
                        </div>
                        
                        <div class="form-group-associate">
                            Description of TJS or new job(200)
                            <textarea rows="4" class="form-control-associate" style="background-color:yellow;" name="tjsdescription" maxlength="200"></textarea>
                        </div>
                        
                        <div class="form-group-associate">
                            Remarks re transfer,TJS, or repat(200)
                            <textarea rows="4" class="form-control-associate" style="background-color:yellow;" name="tjsremarks" maxlength="200"></textarea>
                        </div>
                    </div>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                   <br><br>
                   <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()"style="width:115px;">SAVE &<br/>Go to Menu</button>
                        </form>
                        &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to Menu</button>
                    </div>
                </td> 
            </tr>
        </table>

    </body>
</html>
