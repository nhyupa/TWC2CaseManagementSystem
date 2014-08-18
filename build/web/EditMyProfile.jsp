<%-- 
    Document   : EditMyProfile
    Created on : Jun 3, 2014, 7:51:15 PM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.User"%>
<%@page import="src.User"%>
<%@page import="src.DBConnect"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit My Profile</title>
        
        
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>
        
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.min.css"/>
        
        <!--custom stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/style.css"/>
        
        <!--jasny-bootstrap v3.1.3-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/jasny-bootstrap.css"/>
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        
        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>
        
        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  
        
        <script language="javascript">
            function doit() {
                form1.submit();
            }
            function onSubmit() {
                document.form1.action = "/TWC2-CaseManagementSystem/EditUserProfileServlet";
            }
           
            function onUploadImage() {
                document.form1.action = "/TWC2-CaseManagementSystem/UploadDownloadFileServlet";
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onCancel(){
                document.location.href="/TWC2-CaseManagementSystem/ViewMyProfile.jsp";
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
                       
                        FIN: {
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

            });//end document.ready
        </script>
        
    </head>
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
                    <strong class="headertitle">EDIT MY PROFILE </strong>
                    
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
                    
                    <%
                        DBConnect database = new DBConnect();
                        DBConnect.connectDB();
                        ArrayList<User> userList = new ArrayList<User>();
                        userList = database.getUsers();
                        User currentUser = null;

                        // to find current login user
                        User loginUser = null;
                        for (int i = 0; i < userList.size(); i++) {
                            User user1 = userList.get(i);
                            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                                loginUser = user1;
                            }
                        }

                    %> 
                    <!--content-->
                    
                    <%if (session.getAttribute("notificationMsg") == null) {
                            session.setAttribute("FIN", loginUser.getNRICNum());
                        }%>
                    <!--message-->
                    
                    <br>
                    <form name="form1"  role="form" id="createuser-form"  method="post" enctype="multipart/form-data">
                        
                        <div class="fileinput fileinput-new" data-provides="fileinput" style="float:right">
                            <div class="fileinput-new thumbnail">
                                <img style="width:170px;height:160px" src="image/<%=loginUser.getPhoto()%>">
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;"></div>
                            <div>
                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                        
                        <span class="dot">*Mandatory field</span><br/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="username" style="width:80%;padding-top:5px !important;">User name<span class="dot">*</span></label>
                            <p class="form-control col-sm-6" style="width:80%;left:25px;" name="username" > <%=loginUser.getUsername()%> </p>
                        </div> 
                        
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="realname" style="padding-top:5px !important;">Name<span class="dot">*</span></label>
                            <input type="text" value="<%=loginUser.getfullName()%>"class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="realname" placeholder="<%=loginUser.getfullName()%>">
                        </div> 
                        
                         <div class="form-group">
                            <label class="col-sm-3 control-label" for="alias" style="padding-top:5px !important;">Alias<span class="dot">*</span></label>
                            <input type="text" value="<%=loginUser.getAlias()%>"class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="alias" placeholder="<%=loginUser.getfullName()%>">
                        </div> 
                       
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="FIN" style="width:80%;padding-top:5px;">NRIC/FIN Number<span class="dot">*</span></label>
                            <p class="form-control col-sm-6" style="width:80%;left:25px;" name="FIN" > <%=loginUser.getNRICNum()%> </p>
                        </div> 
                            <%
                              String gender = loginUser.getGender();
                              String formattedGender = gender.substring(0,1);
                            %>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="gender" style="width:80%;">Gender<span class="dot">*</span></label>
                            <p class="form-control col-sm-6" style="width:80%;left:25px;" name="gender" > <%=formattedGender%> </p>
                        </div> 
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="contactnumber" style="width:80%">Contact Number<span class="dot">*</span></label>
                            <input type="text" value="<%=loginUser.getMobileNumber()%>" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="contactnumber" placeholder="<%=loginUser.getMobileNumber()%>">
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="email" style="width:80%;">Email<span class="dot">*</span></label>
                            <p class="form-control col-sm-6" style="width:80%;left:25px;" name="email" > <%=loginUser.getEmailAddress()%> </p>
                        </div> 
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="email">Position<span class="dot">*</span></label>
                            <p class="form-control col-sm-6" style="width:80%;left:25px;" > <%=loginUser.getJobTitle()%> </p>
                            
                        </div>
                            
                                <% if (session.getAttribute("notificationMsg") != null) {
                            String msg = (String) session.getAttribute("notificationMsg");%>
                                <label class="col-sm-7 control-label" style="color:green"><%=msg%></label> <%}%>
                                <%session.removeAttribute("notificationMsg");%>
                            
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
           <%
                String jobPosition = loginUser.getJobTitle();%>
            <tr>
                
                <td colspan="3" class="container9">
                    <div class="form-actions" style="margin-left:10px;">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE</button>
                        <a type="button" href="ViewMyProfile.jsp" class="btn btn-primary btn-large">CANCEL</a>
                        <%if(jobPosition.equalsIgnoreCase("Administrator")){%>
                        <a type="button" href="AdminHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("Management")){%>
                        <a type="button" href="ManagerHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Restricted Specialist")){%>
                        <a type="button" href="SpecialistHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("Associate")){%>
                        <a type="button" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%}%>
                        <!-- <button type="Submit" value="Upload" onclick="onUploadImage()">Upload</button> -->
                    </div>     
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
