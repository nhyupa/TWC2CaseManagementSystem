<%-- 
    Document   : ViewnUpdatePassDetails
    Created on : Jun 13, 2014, 1:10:43 PM
    Author     : keemin.chew.2010
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.Pass"%>
<%@page import ="java.text.SimpleDateFormat"%>
<%@page import ="java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>


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
                $("#appendworkpassform").validate({
                    rules:{
                        passtype:{
                             required:true
                         },
                         passnumber:{
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
            });
        </script>

        <!--javascript-->
        <script>
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
            function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateUpdatePassDetailsServlet";
            }
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        
           <!--database-->  
                    
                 <%            
                      String currentWorkerFIN=(String)session.getAttribute("FIN");
                      System.out.println(currentWorkerFIN);
                      //out.println(currentWorkerFIN);
                      DBConnect dbConnect = new DBConnect();
                      dbConnect.connectDB();
                      
                      Pass currentWorkerPass=null;
                      currentWorkerPass=dbConnect.getPassDetails2(currentWorkerFIN);
                      
                      //retrieve worker pass type dropdownmenu
                      ArrayList<String> passlists = new ArrayList<String>();
                      passlists = dbConnect.getWorkPassList();
                  %>

        <title> View & Update pass details</title>
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
                <td class="containerE" valign="top" style="height:700px">
               
                  <div class="maincontent-associate">
                    <% if (currentWorkerPass!=null){%>
                        <strong>Most recent record:</strong>
                      
                      <div class="form-group-associate">Pass type
                           <div class="form-control-associate"><%=currentWorkerPass.getPassType()%></div>
                      </div>
                      <div class="form-group-associate">Explain if above is "Other"
                         <div class="form-control-associate" style="height:50px;"><%=currentWorkerPass.getPassTypeMore()%></div>
                      </div>
                      <div class="form-group-associate">Pass number
                        <div class="form-control-associate"><%=currentWorkerPass.getPassNumber()%></div>
                      </div>
                      <div class="form-group-associate">
                        Pass issue date(dd/mm/yyyy)
                          <div class="form-control-associate"><%=currentWorkerPass.getPassIssueDate()%></div>
                       </div>
                       <%}%>
                      <br><br>
                         
                        <strong>Enter update:</strong>
                       
                        <form id="appendworkpassform" method="post" name="form1">
                        <div class="form-group-associate"><span class="asterick">*</span>Pass type

                          <select class="form-control-associate col-xs-2" style="background-color:yellow;" name="passtype" >
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
                      <div class="form-group-associate">Explain if above is "Other"(50)
                        <textarea rows="2" class="form-control-associate" name="otherpass" style="background-color:yellow;" maxlength="50"></textarea>
                      </div>
                      <div class="form-group-associate"><span class="asterick">*</span>Pass number(20)
                        <input type="text" class="form-control-associate col-xs-2" name="passnumber" style="background-color: yellow;" maxlength="20">
                      </div>
                          <br><br>
                      <div class="form-group-associate">
                        Pass issue date(dd/mm/yyyy)
                      
                      <input type="date" class="form-control-associate" name="date" style="background-color: yellow;">
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
