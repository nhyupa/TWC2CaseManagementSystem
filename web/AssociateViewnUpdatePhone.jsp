<%-- 
    Document   : ViewnUpdatePhone
    Created on : Jun 13, 2014, 1:10:18 PM
    Author     : keemin.chew.2010
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.User"%>
<%@page import ="java.text.SimpleDateFormat"%>
<%@page import ="java.util.Date"%>

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
                $("#appendphonenumberform").validate({
                    rules:{
                         contactnumber:{
                             required:true
                             
                         },
                        registerdate:{
                             date:true
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
            function onSubmit(){
                document.form.action="AssociateUpdatePhoneDetailsServlet";
            }
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
              function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        
        <%
                        //DBConnect database= new DBConnect();
                        DBConnect.connectDB();


                        String currentWorkerFIN=(String)session.getAttribute("FIN");
                        String workerPhoneNumbers=DBConnect.getPhoneNumber(currentWorkerFIN);

                        String currentPhoneNumber=workerPhoneNumbers;



                         String currentPhoneNumberObsoleteDate ="";
                        Date PhoneNumberObsoleteDate= DBConnect.getSGPhoneNumberObsoleteDate(currentWorkerFIN);
                        System.out.println(PhoneNumberObsoleteDate);
                        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                        if (PhoneNumberObsoleteDate!=null){
                             currentPhoneNumberObsoleteDate=dateFormatter.format(PhoneNumberObsoleteDate);
                        }else{
                            currentPhoneNumberObsoleteDate="";

                        }
                     %>

        <title>View updated phone number</title>
    </head>
   <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA"style="height:10%">
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
                <td class="containerB" style="height:10%"> 
                     <div class="worker-details-associate">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br/>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br/>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br/>
                        Prob:<br>
                        Inj dt:


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
                             <% if (currentPhoneNumber!=null){%>
                             <strong>Most recent record:</strong>
                    
                    <div class="form-group-associate">Sg phone number
             
                        <div class="form-control-associate">
                            <%=currentPhoneNumber%>

                        </div>
                    </div>


                    <div class="form-group-associate">
                        Date discovered to be obsolete(dd/mm/yyyy)
                        <div class="form-control-associate"><%=currentPhoneNumberObsoleteDate%></div>

                     </div>
                        
                       <%}%>
                        <br> <br>


                    <strong>Enter update:</strong>
                    <br>
                    <form id="appendphonenumberform" name="form" method="post">
                         <div class="form-group-associate"> <span class="asterick">*</span>Sg phone number(12)
                           <input type="text" class="form-control-associate col-xs-2" name="contactnumber" maxlength=12 style="background-color: yellow;">
                         </div>

                        <div class="form-group-associate">
                           Date discovered to be obsolete(dd/mm/yyyy)
                           <input type="date" name="registerdate" class="form-control-associate" style="background-color: yellow;">
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
