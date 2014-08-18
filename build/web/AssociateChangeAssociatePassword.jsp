<%-- 
    Document   : AssociateChangeAssociatePassword
    Created on : Jul 19, 2014, 9:44:16 AM
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
         
            
        <style>
            .form-control-associate{
                width:95%;
                margin-left:1%;
            }
        </style>
   
        <!--javascript-->
         <script language="javascript">
            function onSubmit(){
                document.form1.action="/TWC2-CaseManagementSystem/AssociateChangePasswordServlet";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onViewMyProfile(){
                document.location.href="/TWC2-CaseManagementSystem/AssociateViewAssociateProfile.jsp"
            }
        </script>
        
         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        
        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jquery-->
         <script>
           $(document).ready(function() {
               
                $.validator.addMethod("pwcheck", function(value) {
                    return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
                        && /[A-Za-z]/.test(value) // has a letter
                        && /\d/.test(value) // has a digit
                 });

                $('#changepw-form').validate(
                {

                    rules: {
                        inputNewPassword: {
                            minlength: 8,
                            required: true,
                            pwcheck: true
                        },
                        
                        inputOldPassword: {
                            minlength: 8,
                            required: true
                            
                        },
                        inputConfirmPassword: {
                            required: true,
                            equalTo: inputNewPassword
                        }

                    },
                     messages: {
                       inputNewPassword:  {
                         pwcheck: "Error: Invalid Password"
                      }
                  },
                    highlight: function(element) {
                        $(element).closest('.form-group-associate').removeClass('has-success').addClass('has-error');
                    },
                    success: function(element) {
                        element
                        .text('OK!').addClass('valid')
                        .closest('.form-group-associate').removeClass('has-error').addClass('has-success');
                        } 
                  
                });
                
                
            }); // end document.ready
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
            for (int i = 0; i < userList.size(); i++) {
                User user1 = userList.get(i);
                if (user1.getUsername().equals(request.getSession().getAttribute("username").toString())) {  //Find loginUser by using session user information
                    loginUser = user1;
                }
            }
        %> 
        
        <title>AssociateChangeAssociatePassword</title>
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
                <td class="containerD" style="height:10%;">
                    <div class="headertitle-associate">CHANGE MY PASSWORD</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%;">
                  <div class="maincontent-associate">
                     <form name="form1" id="changepw-form" role="form" method="post" autocomplete="off">      
                         <div class="form-group-associate">
                             <label class="control-label"  for="inputOldPassword" >Enter old password</label>                            
                             <input type="password" value="" class="form-control-associate col-xs-2" name="inputOldPassword" id="inputOldPassword" >
                         </div>
                  
                        
                         <div class="form-group-associate">
                             <label class="control-label"for="inputNewPassword" >Enter new password
                             </label>
                             <input type="password" value="" class="form-control-associate col-xs-2"name="inputNewPassword" id="inputNewPassword" >
                         </div>
                       
                         <div class="form-group-associate">
                             <label class="control-label"for="confirmPassword" >Confirm new password</label>
                             <input type="password" class="form-control-associate col-xs-2" name="inputConfirmPassword" id="confirmPassword">
                         </div>
                         
                         <!--display successful message-->
                          <% if (session.getAttribute("successMsg") != null) {
                              String successMsg = (String) session.getAttribute("successMsg");%>
                              <label class="col-sm-7 control-label" style="color:green"><%=successMsg%></label> <%}%>
                              <%session.removeAttribute("successMsg");%>
                              
                               <% if (session.getAttribute("errMsg") != null) {
                              String errorMsg = (String) session.getAttribute("errMsg");%>
                              <label class="col-sm-7 control-label" style="color:red"><%=errorMsg%></label> <%}%>
                              <%session.removeAttribute("errMsg");%>
                  </div><!--end of main content-->
                  <br>
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
                    <div class="btn-associate-landscape btn-associate">
                        <button type="submit" class="btn btn-primary btn-large" onClick="onSubmit()">SUBMIT</button>
                        </form>               
                        <button type="button" class="btn btn-primary btn-large" onclick="onViewMyProfile()">CANCEL</button>
                    </div>
                </td> 
            </tr>
        </table>

    </body>
</html>
