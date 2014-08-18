<%-- 
    Document   : AssociateEditKarunya
    Created on : Aug 1, 2014, 4:39:29 PM
    Author     : keemin.chew.2010
--%>


<%@page import="src.Benefaction"%>
<%@page import="java.util.ArrayList"%>
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
                $("#editkarunyaform").validate({
                    rules:{
                     
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
        
     
          <script>
             function onCancel(){
                  document.location.href="AssociateOverviewKarunya.jsp";
             }
             
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            
              function onSubmit(){
                 document.form1.action="/TWC2-CaseManagementSystem/AssociateEditKarunyaServlet";
             }
        </script>
        <!--database-->
        <%
           DBConnect.connectDB();
          String id2 = (String)request.getSession().getAttribute("id");
          
          Benefaction bene1=DBConnect.getBenefactionRecordsFareGo2(id2);
           String FIN=bene1.getFIN();
          String workerName = DBConnect.getWorkername(FIN);
      %>



        <title>Edit Karunya</title>
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
                        <strong>Benefaction (Karunya)</strong>
                        <br><br>
                        <form id="editkarunyaform" name="form1" method="post">
                        <div class="form-group-associate">
                             <span style="color:red">*</span> Date benefit given (dd/mm/yyyy)
                            <input type="date" class="form-control-associate" style="background-color:yellow;"name="DateBenefitGiven" value="<%=bene1.getBeneDate()%>">
                        </div>
                        <div class="form-group-associate">
                            Name of worker
                            <div class="form-control-associate" name="TypeOfBenefit" style="height:50px;"><%=workerName%></div>
                        </div>
                        <div class="form-group-associate">
                            FIN
                            <div class="form-control-associate"><%=bene1.getFIN()%></div>
                        </div>
                        <div class="form-group-associate">
                             <span style="color:red">*</span> Type of benefit
                          <select class="form-control-associate" style="background-color:yellow;" name="TypeOfBenefit" >
                                   <option value="karunya" >Karunya</option>
                                   <option value="cashmedical" >Cash medical</option>
                                </select>
                          </div>
                       
                        <div class="form-group-associate">
                            Serial number (30)
                            <input type="text" class="form-control-associate" style="background-color:yellow;" name="SerialNumber" maxlength="30" value="<%=bene1.getBeneSerial()%>">
                        </div>
                          
                           <div class="form-group-associate">
                            Remarks, conditions or time frame attached to benefit (500)
                            <textarea rows="5" class="form-control-associate" style="background-color:yellow;" name="remarks" maxlength="500" value=""></textarea>
                        </div>
                     </div><!--end of main content-->
                       
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <br><br>
                    <div class="btn-associate-landscape btn-associate">
                                <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE &<br/>Go back to Karunya Overview</button>
                         </form>
                    &nbsp;&nbsp;
              <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()"style="height:55px;">BACK TO HOMEPAGE</button>
                        
            
                  </div>   
                </td> 
            </tr>
        </table>

    </body>
</html>

