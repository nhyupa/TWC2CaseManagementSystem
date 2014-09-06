<%-- 
    Document   : AssociateViewR2R
    Created on : Aug 1, 2014, 4:09:07 PM
    Author     : keemin.chew.2010
--%>


<%@page import="src.R2R"%>
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
         
        
     
          <script>
             function onCancel(){
               document.location.href="AssociateWelcome.jsp";
             }
             function onSubmit(){
                  document.location.href="/TWC2-CaseManagementSystem/AssociateEditR2R.jsp";
             }
             
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        


        <title>View R2R</title>
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
                        <%
                                DBConnect.connectDB();
                                
                                        String id1 = (String)request.getParameter("testing");
                                        request.getSession().setAttribute("id",id1);
                                        System.out.println(id1);
                                        
                                       R2R r2r =DBConnect.getR2RRecords2(id1);
                                        String FIN = r2r.getFIN();
                                        
                                %>
                    <div class="maincontent-associate">
                        <strong>R2R appointment</strong>
                        <br><br>
                     
                        <div class="form-group-associate">
                            Name of worker
                            <div class="form-control-associate" style="height:50px;"><%=DBConnect.getWorkername(FIN) %></div>
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
                            Date of appointment
                            <div class="form-control-associate"><%=r2r.getR2RDate() %></div>
                        </div>
                         <div class="form-group-associate">
                            Time of appointment
                            <div class="form-control-associate"><%=r2r.getR2RTime() %></div>
                         </div>
                         <div class="form-group-associate">
                            Hospital for appointment
                            <div class="form-control-associate"><%= r2r.getR2RHosp() %></div>
                        </div>
                         <div class="form-group-associate">
                            Dept/doctor for appointment
                            <div class="form-control-associate" style="height:50px;"><%=r2r.getR2RDept()  %></div>
                        </div>
                         <div class="form-group-associate">
                            R2R first volunteer
                            <div class="form-control-associate"><%=r2r.getR2R1() %></div>
                         </div>
                        <div class="form-group-associate">
                            R2R second volunteer
                            <div class="form-control-associate"><%=r2r.getR2R2() %></div>
                         </div>
                        <div class="form-group-associate">
                            Purpose of appointment
                            <div class="form-control-associate" style="height:50px;"><%=r2r.getR2RPurpose() %></div>
                        </div>
                        <div class="form-group-associate">
                            Pre-appt notes
                            <div class="form-control-associate" style="height: 80px;"><%= r2r.getR2RPreApptNotes() %></div>
                        </div>
                          <div class="form-group-associate">
                            Post-appt notes
                            <div class="form-control-associate" style="height: 80px;"><%= r2r.getR2RPostApptNotes() %></div>
                        </div>
                          <div class="form-group-associate">
                            Feedback
                            <div class="form-control-associate" style="height: 80px;"><%= r2r.getR2RFeedback() %></div>
                        </div>
                          <div class="form-group-associate">
                            Medical cost of this appt
                            <div class="form-control-associate"><%= r2r.getR2RMedCost() %></div>
                         </div>
                          <div class="form-group-associate">
                            How much paid by volunteer
                            <div class="form-control-associate"><%= r2r.getR2ROutlay() %></div>
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


