<%--
    Document   : ChangeMyPassword
    Created on : May 19, 2014, 5:11:49 PM
    Author     : keemin.chew.2010
--%>

<%@page import="src.DBConnect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Change My Password</title>
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.min.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>
        
        <!--custom stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/style.css"/>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        
        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>
        
        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        <!-- password validation-->
        <script>
            $(document).ready(function() {

                $('#changepw-form').validate(
                {

                    rules: {
                        inputNewPassword: {
                            minlength: 8,
                            required: true
                        },
                        
                        inputOldPassword: {
                            minlength: 8,
                            required: true
                        },
                        confirmPassword: {
                            required: true,
                            equalTo: "#inputNewPassword"
                        }

                    },
                    highlight: function(element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    success: function(element) {
                        element
                        .text('OK!').addClass('valid')
                        .closest('.form-group').removeClass('has-error').addClass('has-success');
                    }
                });
                
                $("input[name='inputNewPassword']").keyup(function(){
                    
                    var inputVal = $("input[name='inputNewPassword']").val();
                    if(inputVal.match(/[a-zA-Z]/) && inputVal.match(/[0-9]/)){
                        console.log("Valid");
                        $('#errorTxt').text('');
                    }
                    else{
                        console.log("Invalid");
                        $('#errorTxt').text('Error: Please enter at least one number.');
                    }  
                });
            }); // end document.ready
        </script>
        
        <script language="javascript">
            function onSubmit(){
                document.form1.action="ChangePasswordServlet";
            }
            function onForgetPassword(){
                document.form1.action="ForgetPasswordServlet";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onViewMyProfile(){
                document.location.href="/TWC2-CaseManagementSystem/ViewMyProfile.jsp"
            }
        </script>
    </head>
    <body>
        
        <%
            // retrieve users from database    
            ArrayList<User> users = new ArrayList<User>();
            DBConnect database = new DBConnect();
            DBConnect.connectDB();

            users = database.getUsers();

            User loginUser = null;
            for (int i = 0; i < users.size(); i++) {
                User user1 = users.get(i);
                if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                    loginUser = user1;
                }
            }

        %>
        
        <%-- left side menus--%>
   
            <table border ="2" align="center" class="leftDivision">
                <%--1st row--%>
                
                <tr>
                    <td rowspan="3" class="container2">
                        
                    </td>
                    <td rowspan="6" class="container10">
                        
                    </td>
                    <td colspan="2" class="container5">
                        <strong class="headertitle">CHANGE MY PASSWORD</strong>
                        
                    </td>
                    
                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif" style="width:100%"/>
                        <% if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div style="height:12%"> </div>
                        <div class="username-background">
                            <strong class="word" style="margin-left:8px;"> Hello <%= user%></strong>
                            </br>
                            <button style="margin-left:2px;" type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                        </div>
                        <%
                            }
                        %>
                    </td>
                    
                </tr>
                <%--2nd row--%>
                
                <tr>
                    
                    <td rowspan="4" class="container6" valign="top"> <%--container6 --%>
                        
                        </br>
                        <div align="left">
                            <form name="form1" id="changepw-form" role="form" method="post" autocomplete="off">
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" style ="width:100%" for="inputOldPassword" >Enter old password</label>
                                    <input type="password" value="" class="form-control col-sm-6" style="width:80%;left:25px;" name="inputOldPassword" id="inputOldPassword" >
                                    <br/>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" style ="width:100%" for="inputNewPassword" >Enter new password
                                    <span style="color:red;font-size: 9"  id="errorTxt"></span></label></label>
                                    <input type="password" value="" class="form-control col-sm-6" style="width:80%;left:25px;" name="inputNewPassword" id="inputNewPassword" >
                                    <br/>
                                </div>
                                <div class="form-group">
                                    <br/>
                                    <label class="col-sm-3 control-label" style="width:100%" for="confirmPassword" style="width:45%;">Confirm new password</label>
                                    
                                    <input type="password" class="form-control col-sm-6" style="width:80%;left:25px;" name="confirmPassword" id="confirmPassword">
                                </div>
                                
                                <% if (session.getAttribute("successMsg") != null) {
                              String successMsg = (String) session.getAttribute("successMsg");%>
                              <label class="col-sm-7 control-label" style="color:green"><%=successMsg%></label> <%}%>
                              <%session.removeAttribute("successMsg");%>
                              
                               <% if (session.getAttribute("errMsg") != null) {
                              String errorMsg = (String) session.getAttribute("errMsg");%>
                              <label class="col-sm-7 control-label" style="color:green"><%=errorMsg%></label> <%}%>
                              <%session.removeAttribute("errMsg");%>
                              
                        
                                
                        </div>
                        </br> 
                        <!--message-->
                       
                        
                    </td>
                    
                    <td class="container11">
                        
                    </td>
                    
                    
                </tr>
                <%--3rd row--%>
                <tr>
                    <td rowspan="3" colspan="2" class="container7"> <%--container7 --%>
                        
                    </td>
                    
                    
                </tr>
                <%--4th row--%>
                <tr>
                    <td class="container3">
                        
                    </td>
                    
                </tr>
                <%--5th row--%>
                <tr>
                    <td rowspan="2" class="container4">
                    </td>
                    
                    
                </tr>
                <%--6th row--%>
                <tr>
                    
                    <td colspan="3" class="container9" style="border:none;">
                        <div class="form-actions" style="margin-left:10px;">
                            <button type="submit" class="btn btn-primary btn-large" onClick="onSubmit()">SUBMIT</button>
                            <button type="button" class="btn btn-primary btn-large" onclick="onViewMyProfile()">CANCEL</button>
                        </div>
                    </td>
                </tr>
            </table>
       
    </form>
</body>
</html>
