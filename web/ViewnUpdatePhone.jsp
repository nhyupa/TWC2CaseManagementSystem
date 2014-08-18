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
        
         <!--stylesheets-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
       
         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <script>
            function onSubmit(){
                document.form.action="AssociateUpdatePhoneDetailsServlet";
            }
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
        </script>
        
        <script>
            $(document).ready(function(){
                $("#appendphonenumberform").validate({
                    rules:{
                         contactnumber:{
                             required:true,
                             number:true
                         },
                        date:{
                            date:true
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

        <title>View updated phone number</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA"style="height:10%">
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
                <td class="containerB" valign="top" style="height:10%">
                    Name:<%=session.getAttribute("selectedWorkerName")%><br/>
                    FIN:<%=session.getAttribute("selectedWorkerFIN")%><br/>
                    Employer:<%=session.getAttribute("selectedEmployerName")%><br/>
                    Prob:<br/>
                    Inj dt:<br/>
                </td> 
            </tr>
            <tr>
                <td class="containerC">

                </td> 
            </tr>
            <tr>
                <td class="containerD"  style="height:10%">
                    <div class="headertitle">VIEW & UPDATE</div>
                </td> 
            </tr>

            <tr>
                <%
                    //DBConnect database= new DBConnect();
                    DBConnect.connectDB();
                    String currentWorkerFIN=(String)session.getAttribute("selectedWorkerFIN");
                    String currentPhoneNumber=DBConnect.getPhoneNumber(currentWorkerFIN);
                    String currentPhoneNumberObsoleteDate= "";
                    Date PhoneNumberObsoleteDate= DBConnect.getSGPhoneNumberObsoleteDate(currentWorkerFIN);
                    SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
                    if (PhoneNumberObsoleteDate!=null){
                     currentPhoneNumberObsoleteDate =dateFormatter.format(PhoneNumberObsoleteDate);
                    }
                     
                    
                %>
                <td class="containerE" valign="top"  style="height:10%" >
                    <strong>Most recent record:</strong>
                    <br>
                    <div class="form-group">Sg phone number</div>
             
                    <div class="form-control">
                        <%=currentPhoneNumber%>
                   
                    </div>
                    <div class="form-group">
                      Date discovered to be obsolete(dd/mm/yyyy)
                      </div>
                     
                      <div class="form-control"><%=currentPhoneNumberObsoleteDate%></div>
                    <% if (currentPhoneNumberObsoleteDate == null){
                     %>   
                       <%="This Message will show" %> 
                     <%
                    } %>
                    
                    <br> <br>
                    <strong>Enter update:</strong>
                    <br>
                    <form id="appendphonenumberform" name="form" method="post">
                         <div class="form-group"> <span class="asterick">*</span>Sg phone number(12)</div>
                        <input type="text" class="form-control" name="contactnumber" maxlength=12 style="background-color: yellow;">
                        <div class="form-group">
                           Date discovered to be obsolete(dd/mm/yyyy)
                        </div>
                          <input type="date"  name="date" class="form-control" style="background-color: yellow;">
                                         
                </td> 
                   
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                   <div align="center">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE &<br/>Go to Menu</button>
                                </form>

                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DO NOT SAVE <br/>Go to Menu</button>
                    </div>
                  
                </td> 
            </tr>
        </table>
    </body>
</html>
