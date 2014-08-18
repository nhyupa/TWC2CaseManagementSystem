<%-- 
    Document   : AssociateListR2R
    Created on : Aug 1, 2014, 3:48:59 PM
    Author     : keemin.chew.2010
--%>
<%@page import="src.DBConnect"%>
<%@page import="src.R2R"%>
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
            @media (max-width: 767px){
                .form-table-associate{
                    margin-left:7%;
                }
            } 
            @media (min-width: 1200px) {
                 .form-table-associate{
                    margin-left:1.5%;
                }
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
               document.form1.action="/TWC2-CaseManagementSystem/AssociateViewR2R.jsp";
            }
             function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        


        <title>List R2R</title>
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
                    <div class="headertitle-associate" >LIST RECORDS</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    
                    <div class="maincontent-associate">
                        <strong>List R2R appointments</strong>
                         <hr class="blackline-associate" style="margin-bottom:0.05%">
                        <div class="form-group-associate"style="margin-left:1%">
                           
                            <label>Date of appointment </label><br/>
                            <label>Name</label><br/>
                            <label>FIN</label><br/>
                            <label>Hospital for appointment</label>
                               
                          </div>
                         <hr class="blackline-associate" style="margin-bottom:2%"> 
                        <div class="form-group-associate">
                            <form method="post" name="form1" id="listForm">
                                
                                
                                  <%
                                   ArrayList<R2R> results = new ArrayList<R2R>();
                                   results=(ArrayList<R2R>)session.getAttribute("selectedR2R");
                                       // out.println(results.size());
                                        //get the entry date to align the employer information
                                   
                                        for(int i =0; i<results.size();i++) { 
                                %>
                                //r2r does not have an id
                                <input type="radio" name="testing"value="<%=results.get(i)%>">
                                     <%=results.get(i).getR2RDate()%><br/>
                                    <div class="form-table-associate">
                                   <%=DBConnect.getWorkername(results.get(i).getFIN())%><br/>
                                    <%=results.get(i).getFIN()%><br/>
                                    <%=results.get(i).getR2RHosp()%><br/>
                                    <br>
                                    </div>
                                   
                            <%}%>
                                </div>                           
                                <hr class="blackline-associate" style="margin-bottom:0.05%">
                        </div>
                       
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <br><br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">VIEW<br/>selected record</button>
                         </form>
                    &nbsp;&nbsp;
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onCancel()"style="height:55px;" >BACK TO HOMEPAGE</button>
                        
            
                  </div>   
                </td> 
            </tr>
        </table>

    </body>
</html>

