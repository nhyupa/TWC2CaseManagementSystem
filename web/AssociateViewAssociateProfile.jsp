<%-- 
    Document   : AssociateViewMyProfile
    Created on : Jul 19, 2014, 8:15:33 AM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.User"%>
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
        
        <!--jasny-bootstrap v3.1.3-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/jasny-bootstrap.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>


        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  
       
        <style>
            .form-control-associate{
                width:95%;
                margin-left:1%;
            }
        </style>
        
        <!--javascript-->
          <script language="javascript">
            function onEditPassword()  {
                document.location.href= "/TWC2-CaseManagementSystem/AssociateChangeAssociatePassword.jsp";
            }
            function onEdit() {
                document.location.href = "/TWC2-CaseManagementSystem/AssociateEditAssociateProfile.jsp";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        
        <!--Database-->
           <%
            DBConnect database = new DBConnect();
            DBConnect.connectDB();
            ArrayList<User> userList = new ArrayList<User>();
            userList = database.getUsers();
            //User currentUser = null;

            // to find currently login user
             User loginUser = null;
            try{
               
                for (int i = 0; i < userList.size(); i++) {
                    User user1 = userList.get(i);
                    if (user1.getUsername().equals(request.getSession().getAttribute("username").toString())) {  //Find loginUser by using session user information
                        loginUser = user1;
                    }
                }
            }catch(Exception ex){   
                
            }

        %> 
        
        <title>AssociateViewAssociateProfile</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%;">
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
                <td class="containerB" style="height:10%;">

                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%;" >

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%; text-indent:10px;">
                     <div class="headertitle-associate"> VIEW MY PROFILE </div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%; text-indent:10px;">
                  <div class="maincontent-associate">
                      <% if(loginUser!=null){%>
                            <div style="float:left;margin-right:20px;margin-top:10px;" >
                           
                                <% if (loginUser.getPhoto() != null) {%>  
                                <img style="width:150px;height:200px" src="image/<%=loginUser.getPhoto()%>">
                                <% } else {%> 
                                <img style="width:150px;height:200px" src="image/default.jpg"/>                                     
                                <% }%> 
                            
                            </div>
                            <div style="float:left">  
                                
                            <div class="form-group-associate">
                                <label class="control-label" for="username">Username</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getUsername()%></p>
                            </div> 
                            
                      


                            <div class="form-group-associate">
                                <label class="control-label" for="fullName">Name</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getfullName()%></p>
                            </div> 
                             <div class="form-group-associate">
                                <label class="control-label" for="fullName">Alias</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getAlias()%></p>
                            </div>
                            <div class="form-group-associate">
                                <label class="control-label" for="FIN">Identification Number(NRIC/FIN)</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getNRICNum()%></p>
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="Gender"> Gender </label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getGender()%></p>
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="ContactNumber" style="width:80%;"> Contact Number </label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getMobileNumber()%>  </p>
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="Email"> Email</label>
                                <p style="margin-left:10px;" class="form-control-associate" ><%=loginUser.getEmailAddress()%></p>  
                            </div>
                            <div class="form-group-associate">
                                <label class="control-label" for="Position">Role</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getJobTitle()%> </p>
                            </div>
                            </div>
                  </div><!--end of main content-->
                  <%}else{
                            response.sendRedirect("index.jsp");
                           return;
                    
                      }%>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                   <div class="btn-associate-landscape btn-associate">
                        <button style="margin-left:10px" type="submit" form ="userInfo-form" class="btn btn-primary btn-large" onClick="onEditPassword()">CHANGE PASSWORD</button>
                        <button style="margin-left:10px" type="button" class="btn btn-primary btn-large" onclick="onEdit()">EDIT</button>
                        <br> <br>
                        <a type="button" style="margin-left:10px" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                    </div>     
                </td> 
            </tr>
        </table>

    </body>
</html>
