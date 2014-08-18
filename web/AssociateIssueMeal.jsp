<%-- 
    Document   : IssueMeal
    Created on : Jun 13, 2014, 1:50:32 AM
    Author     : keemin.chew.2010
--%>

<%@page import="src.DBConnect"%>
<%@page import="src.Benefaction"%>
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
                $("#appendissuemealform").validate({
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
        
        <!--javascript-->
        <script>
            function onCancel(){
               document.location.href="AssociateMenu.jsp";
            }
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
           function onSubmit(){
               document.form1.action="/TWC2-CaseManagementSystem/AssociateIssueMealServlet"
           }
        </script>
        
        <!--database-->
        <% 
              ArrayList<Benefaction> benefitList = null;
              benefitList = new ArrayList<Benefaction>(); 
              String FIN = (String)session.getAttribute("FIN");
              benefitList=DBConnect.getBenefactionRecordsMealcard(FIN);
   
        %>

        <title>Issue Meal</title>
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
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br/>
                        Prob:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("problemNameShow")%><br>
                        Inj dt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryDate")%><br>
                        Inj bp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryBodyPart")%><br>
                        Hosp:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentHospitalName")%><br>
                        Law:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentLawyer")%><br>
                      
                       <hr class="redline-associate">  
                    </div>  
                </td> 
            </tr>
            <tr>
                <td class="containerC"style="height:10%">

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                           <div class="headertitle-associate">ISSUE MEAL CARD</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                   <div class="maincontent-associate">
                    <table class="table" style="text-align: center;">
                        
                       <thead>
                           <tr>                            
                               <th style="text-align: center; ">Date given</th>
                               <th style="text-align: center;">Type of benefit</th>
                           </tr>
                       <br>
                         </thead>
                       <tbody>
                           <%
                               if (benefitList != null) {
                                   // System.out.println("size" + benefitList.size());
                                   for (Benefaction benefaction1 : benefitList) {
                                       if (benefaction1.getBeneType().equalsIgnoreCase("Meal Card")
                                           || benefaction1.getBeneType().equalsIgnoreCase("Meal Card R")
                                           || benefaction1.getBeneType().equalsIgnoreCase("Cash meal")) {

                           %>
                           <tr>
                               <td> <%=benefaction1.getBeneDate()%></td>
                               <td> <%=benefaction1.getBeneType()%></td>
                           </tr>
                            
                           
                          <%}} }%>
                                 
                       </tbody>
                       <tfoot>
                           <tr>
                               <td colspan="2" >
                                   <hr class="blackline-associate">
                               </td>
                           </tr>
                             
                       </tfoot>
                     
                  </table>
                         
                       <form id="appendissuemealform" name="form1" method="post">
                    <div class="form-group-associate">
                        <span style="color:red">*</span>New issue date(dd/mm/yyyy)
                        <input type="date" class="form-control-associate col-xs-2"style="background-color:yellow;" name="registerdate">
                    </div>
                           <br><br>
                    <div class="form-group-associate">
                        <span style="color:red">*</span>Type of benefit issued
                        <select class="form-control-associate" style="background-color:yellow;" name="benefitoption" >
                             <option value="Meal Card" >Meal Card</option>
                             <option value="Meal Card R" >Meal Card R</option>
                             <option value="Cash meal" >Cash meal</option>
                          </select>
                    </div>
                    <div class="form-group-associate">
                        Serial number(30)
                        <input type="text" class="form-control-associate" style="background-color:yellow;" name="serialnum" maxlength=30">
                    </div>
                  </div>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                     <br><br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">ISSUE card <br/>Go to Menu</button>
                         </form>
                    &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()">DON'T ISSUE <br/>Go to Menu</button>
                        <br><br>
                        To edit a record, go to TCRP overview
     
                    </div>
                </td> 
            </tr>
        </table>

    </body>
</html>
