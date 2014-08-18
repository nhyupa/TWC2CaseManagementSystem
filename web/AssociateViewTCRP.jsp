<%-- 
    Document   : AssociateViewTCRP
    Created on : Aug 1, 2014, 2:45:16 PM
    Author     : keemin.chew.2010
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.Benefaction"%>
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
         
        
     
          <script>
             function onCancel(){
                  document.location.href="AssociateWelcome.jsp";
             }
             function onSubmit(){
                  document.location.href="/TWC2-CaseManagementSystem/AssociateEditTCRP.jsp";
             }
             
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        


        <title> View TCRP</title>
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
                    <div class="headertitle-associate" >VIEW RECORD</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                             <%
                                
                                DBConnect.connectDB();
                                
                                        String id1 = (String)request.getParameter("testing");
                                        request.getSession().setAttribute("id",id1);
                                        System.out.println(id1);
                                       
                                        Benefaction bene3 =DBConnect.getBenefactionRecordsMealcard2(id1);
                                        
                                        String FIN = bene3.getFIN();
                                        Date benefitDate = bene3.getBeneDate();
                                        String beneType = bene3.getBeneType();
                                        String workerName = DBConnect.getWorkername(FIN);
                                        String serialNumber = bene3.getBeneSerial();
                                      
                                        System.out.println(FIN);
                                        System.out.println(benefitDate);
                                        System.out.println(beneType);
                                        System.out.println(workerName);
                                        System.out.println(serialNumber);
                                        Benefaction currentBenefaction = null; 
                                        
                                %>
                        <strong>Benefaction (TCRP)</strong>
                        <br><br>
                        <div class="form-group-associate">
                            Date benefit given
                            <div class="form-control-associate">
                                  <%=bene3.getBeneDate()%>
                            </div>
                        </div>
                        <div class="form-group-associate">
                            Name of worker
                            <div class="form-control-associate" style="height:50px;">
                              <%=workerName%>
                            </div>
                        </div>
                        <div class="form-group-associate">
                            FIN
                            <div class="form-control-associate"><%=bene3.getFIN()%></div>
                        </div>
                        <div class="form-group-associate">
                            Type of benefit
                            <div class="form-control-associate"><%=bene3.getBeneType()%></div>
                        </div>
                        <div class="form-group-associate">
                            Serial number
                            <div class="form-control-associate"><%=bene3.getBeneSerial()%></div>
                        </div>
                        
                     </div><!--end of main content-->
                       
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <br><br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">EDIT<br/>this record</button>
                    
                    &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()"style="height:55px;" >BACK TO HOMEPAGE</button>
            
                        
            
                  </div>   
                </td> 
            </tr>
        </table>

    </body>
</html>

