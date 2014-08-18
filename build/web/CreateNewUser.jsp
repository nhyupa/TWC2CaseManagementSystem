<%-- 
    Document   : CreateNewUser
    Created on : May 19, 2014, 10:39:32 PM
    Author     : keemin.chew.2010
    Revised by : Sion
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Create New User</title>

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>


        <!--custom stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/style.css"/>

        <!--jasny-bootstrap v3.1.3-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/jasny-bootstrap.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>


        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  
        <script>
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onSubmit() {
                document.createform.action ="RegistrationServlet";
            }
             
        </script>
        <script>
            
            $(document).ready(function()
            {
                $('#createuser-form').validate(
                {
                    rules: {
                        username: {
                            minlength: 8,
                            required: true
                        },
                        realname: {
                            required: true
                        },
                        NRIC_No: {
                            required: true
                        },
                        contactnumber: {
                            required: true
                        }, 
                        gender: {
                            required: true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        position: {
                            required: true
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
                
                //FIN Validation (KEE MIN) (Jquery code
                $("input[name='NRIC_No']").keyup(function () {
                    var inputVal = $("input[name='NRIC_No']").val();
                    var inputLength =  $("input[name='NRIC_No']").val().length;
                    if(inputLength == 1){
                        // if(typeof inputVal == 'string' || inputVal instanceof String){
                        if(/^[a-z]+$/i.test (inputVal ) ){
                            console.log('valid');
                            $('#errorTxt').text('');
                        }else{
                            $('#errorTxt').text('Please enter valid FIN number.');
                        }
                    }
                    if(inputLength > 1 && inputLength < 9){
                        var numVal = inputVal.substring(inputLength-1,inputLength);
                        console.log(numVal);
                        
                        if(isInteger(parseInt(numVal))){
                            console.log('valid');
                            $('#errorTxt').text('');
                        }else{
                            console.log('Invalid.Please enter number');
                            $('#errorTxt').text('Please enter valid FIN number.');
                        }
                    }
                    if(inputLength == 9) {
                        var numVal = inputVal.substring(inputLength-1,inputLength);
                        if(/^[a-z]+$/i.test (numVal ) ){
                            console.log('valid');
                            $('#errorTxt').text('');
                        }else{
                            console.log('Please enter valid FIN number.');
                            $('#errorTxt').text('Please enter valid FIN number.');
                        }
                    }
                    
                    if(inputLength > 9) {
                        $('#errorTxt').text("Please enter valid FIN number.");
                    }
                });
                
                function isInteger(n) {
                    return n === +n && n === (n|0);
                }

                    
            });//end document.ready
             
             
             
        </script>	
    </head>
    
    <%
        DBConnect.connectDB();
        ArrayList<String> userRoles = DBConnect.getRoles();
    %>
    <body>
        <%-- left side menus--%>
        <table border ="2" align="center" class="leftDivision">
            <%--1st row--%>

            <tr>
                <td rowspan="3" class="container2">

                </td>
                <td rowspan="6" class="container10">

                </td>
                <td colspan="2" class="container5">
                    <strong class="headertitle">CREATE NEW USER</strong>

                </td>

                <td rowspan="2" class="container1">
                    <img src="image/logo_camans_180w.gif" width="100%"/>
                    <% if (session.getAttribute("username"
                            ) != null || session.getAttribute("username") != "") {
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

                    <br/><!--message-->
                    <% if (request.getAttribute("regMsg") != null) {
                                String regMsg = (String) request.getAttribute("regMsg");%>
                    <label><%=regMsg%></label> <%}%>


                    <form name="createform"  role="form" action ="RegistrationServlet"id="createuser-form"  method="post" enctype="multipart/form-data"> 

                        <div class="fileinput fileinput-new" data-provides="fileinput" style="float:right">
                            <div class="fileinput-new thumbnail" style="width: 150px; height: 200px;margin:0 auto;">
                                <img src="image/default.jpg"/>
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;margin:0 auto;"></div>
                            <div>
                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                        <span class="dot" style="margin-left:10px;">*Mandatory field</span><br/>
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="username" style="width:80%;">Username<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                                <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;margin:0 auto;" name="username">
                            </div>
                        </div> 
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="realname" style="width:80%;margin:0 auto;">Name<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;"  name="realname">
                            </div>
                       </div> 
                        
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="alias" style="width:80%;margin:0 auto;">Alias<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;"  name="alias">
                            </div> 
                        </div>
                        <div class="form-group NRIC_No" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="NRIC_No" style="width:80%;margin:0 auto;">Identification Number(NRIC/FIN)<span class="dot">*</span><br/><span style="color:red;font-size: 9"  id="errorTxt"></span></label>
                           <div style="text-indent:10px;margin:0 auto">
                            <input id="NIRC_No" type="text" class="form-control col-sm-6" style="width:80%;left:25px;" name="NRIC_No">
                        </div> 
                        </div>
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="gender" style="width:80%;margin:0 auto;">Gender<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <select class="form-control col-sm-6" style="width:80%;left:25px;" name="gender">
                                <option value="M">M</option>
                                <option value="F">F</option>
                            </select>
                            </div>
                            </div>
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="contactnumber" style="width:80%;margin:0 auto;">Contact Number (max: 10 characters)<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;" name="contactnumber">
                            </div>
                            </div>

                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="email" style="width:80%;margin:0 auto;">Email<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;" name="email">
                            </div>
                            </div>
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <label class="col-sm-3 control-label" for="position" style="width:80%;margin:0 auto;">Role<span class="dot">*</span></label>
                            <div style="text-indent:10px;margin:0 auto">
                            <select class="form-control col-sm-6" style="width:80%;left:25px;" id="position" name="position">
                                <option value="">Select an option</option>
                                <%for(int i =0 ; i < userRoles.size() ; i++){%>
                                <option value="<%=userRoles.get(i)%>"><%=userRoles.get(i)%></option>
                               <%}%>
                            </select>
                            </div>
                        </div> 
                        
                        <div class="form-group" style="margin-top:0px;margin-bottom:0px;">
                            <div style="text-indent:10px;margin:0 auto">
                            <% if (session.getAttribute("regMsg") != null) {
                            String regMsg = (String) session.getAttribute("regMsg");%>
                            <label class="col-sm-6 control-label" style="color:green; width:100%;"><br/><%=regMsg%></label> <%}%>
                            <%session.removeAttribute("regMsg");%>
                            
                            <% if (session.getAttribute("finExists") != null) {
                            String duplicateFin = (String) session.getAttribute("finExists");%>
                            <label class="col-sm-6 control-label" style="color:red; width:100%;"><br/><%=duplicateFin%></label> <%}%>
                            <%session.removeAttribute("finExists");%>
                            </div>
                        </div>
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

                <td colspan="3" class="container9">
                    <div class="form-actions" style="margin-left:10px;">
                        <button type="submit" class="btn btn-primary btn-large" onclick="onSubmit()">SUBMIT</button>
                        <a href="AdminHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>

                    </div>     
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
