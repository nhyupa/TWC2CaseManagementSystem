<%-- 
    Document   : AssociateWelcome
    Created on : Jun 14, 2014, 12:17:29 AM
    Author     : keemin.chew.2010
--%>


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
            .box{
                display:none;
            }
            
            @media (max-width: 767px) {
                .associate-button{
                    margin-top:15%;
                }
            }
         @media (min-width: 1200px) {
                .associate-button{
                    margin-top:4%;
                }
               
            }
        </style>

        <!--jquery-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
    
        
        <!--javascript-->
        <script>
              function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
              }
              function onFind(){
                 document.form.action="/TWC2-CaseManagementSystem/AssociateFindFINServlet";
              }
        </script>
        <!--jquery-->
        <script>
           
            $(document).ready(function(){
                   
                    $('input[name$="searchRadio"]').click(function(){
     
                        if($(this).attr("value")=="searchFIN"){
                            $(".box").hide();
                            $(".showFIN").show();
                            $(".form-control-associate").removeClass('has-error');
                          
                            $("label[for=FIN]").remove();
          
                        }
                        if($(this).attr("value")=="searchSpecialPass"){
                            $(".box").hide();
                            $(".showSpecialPass").show();
                             $(".form-control-associate").removeClass('has-error');
                 
                            $("label[for=specialPass]").remove();
                        }
                });
                
           
                $("#findworker").validate({
                  rules: {
                      FIN:{  
                          required:true,
                          minlength:8
                          
                      },
                      specialPass:{
                          required:true,
                          minlength:8
                      }
                  },
                   highlight: function(element) {
                        $(element).closest('.form-control-associate').removeClass('has-success').addClass('has-error');
                        
                    },
     
                });//end findworker validaton
            });//end document.ready
            
            
        </script>
        <title>Associate Welcome</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision" >
            <tr>
                <td class="containerA"  style="height:10%">
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
                            <br>
                            <button type="submit" class="btn-logout-associate" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                    
                    </div> <!--end of div header-->
                   
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
                <td class="containerD"style="height:10%">
                    <div class="headertitle-associate">WELCOME</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <!--database-->
                    <%
                        String errorMsg = null; 
                       
                        if (session.getAttribute("errMsg") != null) {
                           errorMsg = (String) session.getAttribute("errMsg");
                         
                        }
                   %>
                    <div class="maincontent-associate">
                        <strong style="font-size:18px;">Find worker</strong> <br><br>
                        
                        <form name="form" id="findworker" method="post">
                            <div class="form-group-associate">
                                <input type="radio" name="searchRadio" value="searchFIN" checked="checked" > Search by FIN number <br>
                               <input type="radio" name="searchRadio" value="searchSpecialPass"> Search by Special Pass number
                            </div>
                         
                            <div class="showFIN box" style="display:block;" >
                                <div class="form-group-associate  ">
                                   <label class="control-label"> 
                                    <span style ="color:red">*</span>Enter FIN number in full (no spaces)
                                 </label>
                                 <input type="text" name="FIN" class="form-control-associate col-xs-2">
                                </div> 
                            </div><!--end of div box-->
                            <div class="showSpecialPass box" >
                                 <div class="form-group-associate">
                                   <label class="control-label"> 
                                    <span style ="color:red">*</span>Enter Special Pass number in full(no spaces)
                                   </label>
                                 <input type="text" name="specialPass" class="form-control-associate col-xs-2">
                                </div>  
                            </div> <!--end of div box-->
                      <div class="form-group-associate associate-button">
                            
                                    <button type="Submit" class="btn btn-primary btn-large" style="margin-left:1%;" onclick="onFind();">GO FIND</button>

                                <% if (errorMsg!=null) {%>
                                <a type =" button" class ="btn btn-primary btn-large create-associateworker-btn" href="AssociateCreateWorker.jsp">CREATE WORKER</a>
                                <%} %>

                            </form>
                      </div>
                    </div><!--end of--maincontent-->
                    <br>
                    
                    <% if (errorMsg!=null){ 
                    %>
                    <label style="color:red; margin-left:2%;"><%=errorMsg%></label> <%}%>
                    
                    <% session.removeAttribute("errMsg"); 
                    %>
                    <hr class="blackline-associate">     
                </td> 
            </tr>


            <tr>
                <td class="containerF" valign="top" style="height:10%">
                    <div class="menucontentlinks-associate">
                        <strong>Other options</strong>
                        <br>
                        <a href="AssociateOverviewTCRP.jsp">TCRP overview</a><br>
                        <a href="AssociateOverviewFareGo.jsp">FareGo overview</a><br>
                        <a href="AssociateOverviewKarunya.jsp">Karunya overview</a><br>
                        <a href="AssociateOverviewR2R.jsp">R2R overview</a><br>
                        <a href="AssociateViewAssociateProfile.jsp">My profile</a><br>
                        <a href="AssociateViewAllUsers.jsp">Users gallery</a><br>
                    </div> 
                 
                </td> 
            </tr>
        </table>

    </body>
</html>

