<%-- 
    Document   : EditUserProfile
    Created on : May 19, 2014, 6:14:01 PM
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
        <title>Edit User Profile</title>



        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

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

        <!-- Bootstrap v3.1.1 -->
        <script src="javascript/bootstrap.min.js"></script>

        <script language="javascript">
            function onSubmit() {
                document.form1.action = "/TWC2-CaseManagementSystem/AdminEditUserProfileServlet";
            }
           
            function onUploadImage() {
                document.form1.action = "/TWC2-CaseManagementSystem/UploadDownloadFileServlet";
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
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
                        FIN: {
                            required: true
                        },
                        gender: {
                            required: true
                        },
                        contactnumber: {
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
    
    <%
        DBConnect.connectDB();
        ArrayList<String> userRoles = DBConnect.getRoles();
        
    %>
    <body>
        <%-- left side menus--%>
        <div class="leftDivision">
            <table border ="2">
                <%--1st row--%>

                <tr>
                    <td rowspan="3" class="container2">

                    </td>
                    <td rowspan="6" class="container10">

                    </td>
                    <td colspan="2" class="container5">
                        <strong class="headertitle">EDIT USER PROFILE </strong>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif"/>
                        <% if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
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

                            ArrayList<String> realNames = DBConnect.retrieveSortedRealNames(userList);
                            ArrayList<User> sortedUsers = DBConnect.retrieveSortedUsers(userList, realNames);
                            User currentUser = null;
                            if(session.getAttribute("userToView") != null){
                                currentUser = sortedUsers.get(Integer.parseInt(session.getAttribute("userToView").toString()));    
                                session.setAttribute("editedUserFIN", currentUser.getNRICNum());
                                session.removeAttribute("userToView");
                            }
                            String newUserFin = null;
                            User editedUser = null;
                            if(session.getAttribute("editedUserFINNo") != null){
                                newUserFin  = (String)session.getAttribute("editedUserFINNo");
                                editedUser = DBConnect.getUser(newUserFin);
                                
                            }
                           // out.println(editedUser.getUsername());
                            //out.println(session.getAttribute("editedUserFIN"));
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
                        <br/>
                        <!--message-->
                        <% if (session.getAttribute("notificationMsg") != null) {
                                String msg = (String) session.getAttribute("notificationMsg");%>
                        <label style="color:green;"><%=msg%></label> <%}%>
                        <%session.removeAttribute("notificationMsg");%>

                        <form name="form1"  role="form" id="createuser-form"  method="post" enctype="multipart/form-data"> 
            
                        <div class="fileinput fileinput-new" data-provides="fileinput" style="float:right">
                            <div class="fileinput-new thumbnail" style="max-width: 150px; max-height: 200px;">
                                <% if (currentUser!= null) {%>  
                                <img style="width:150px;height:200px" src="image/<%=currentUser.getPhoto()%>">
                               
                                <%} else if(editedUser != null){
                                    if(editedUser.getPhoto() != null){
                                %>
                                    
                                <img style="width:150px;height:200px" src="image/<%=editedUser.getPhoto()%>"/>
                                <%}else {%>
                                <img style="width:150px;height:200px" src="image/default.jpg%>"/>
                                <%}} else{%>
                                <img style="width:150px;height:200px" src="image/default.jpg"/>                                     
                                <% }%> 
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;"></div>
                            <div>
                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                            

                            <section id="left">

                                <span class="dot" style="margin-left:10px;">*Mandatory field</span><br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="username">Username<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="username" placeholder="<%=currentUser.getUsername()%>">
                                    <%}else if(editedUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="username" placeholder="<%=editedUser.getUsername()%>">
                                    <%} else{%>
                                     <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="username">
                                     <%}%>
                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="realname">Name<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="realname" placeholder="<%=currentUser.getfullName()%>">
                                    <%}else if(editedUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="realname" placeholder="<%=editedUser.getfullName()%>">
                                    <%} else{%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="realname" placeholder="<%=currentUser.getfullName()%>">
                                    <%}%>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="alias">Alias<span class="dot">*</span></label>
                                    <%if(currentUser !=null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="alias" placeholder="<%=currentUser.getAlias()%>">
                                    <%} else if(editedUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="alias" placeholder="<%=editedUser.getAlias()%>">
                                    <%} else{%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="alias" placeholder="<%=currentUser.getAlias()%>">
                                    <%}%>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="FIN" style="width:80%;">Identification Number(NRIC/FIN)<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <p class="form-control col-sm-6" style="width:80%;left:25px;" > <%=currentUser.getNRICNum()%> </p>
                                    <%} else if(editedUser != null) {%>
                                    <p class="form-control col-sm-6" style="width:80%;left:25px;" > <%=editedUser.getNRICNum()%> </p>
                                    <%} else{%>
                                    <p class="form-control col-sm-6" style="width:80%;left:25px;" > <%=currentUser.getNRICNum()%> </p>
                                    <%}%>
                                </div> 
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="gender">Gender<span class="dot">*</span></label>
                                    <%if(currentUser != null) {%>
                                    <select class="form-control col-sm-6" name="gender" style="width:80%;left:25px; background-color:yellow;">
                                        <option value=""><%=currentUser.getGender()%></option>
                                        <option value="M" >M</option>
                                        <option value="F" >F</option>
                                    </select>
                                    <%} else if(editedUser != null) {%>
                                      <select class="form-control col-sm-6" name="gender" style="width:80%;left:25px; background-color:yellow;">
                                        <option value=""><%=editedUser.getGender()%></option>
                                        <option value="M" >M</option>
                                        <option value="F" >F</option>
                                    </select>
                                    <%} else {%>
                                    <select class="form-control col-sm-6" name="gender" style="width:80%;left:25px; background-color:yellow;">
                                        <option value=""><%=currentUser.getGender()%></option>
                                        <option value="M" >M</option>
                                        <option value="F" >F</option>
                                    </select>
                                    <%}%>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="contactnumber" style="width:100%">Contact Number<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="contactnumber" placeholder="<%=currentUser.getMobileNumber()%>">
                                    <%} else if(editedUser != null) {%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="contactnumber" placeholder="<%=editedUser.getMobileNumber()%>">
                                    <%} else {%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px;background-color:yellow;" name="contactnumber" placeholder="<%=currentUser.getMobileNumber()%>">
                                    <%}%>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="email">Email<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="email" placeholder="<%=currentUser.getEmailAddress()%>" >
                                    <%} else if(editedUser != null) {%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="email" placeholder="<%=editedUser.getEmailAddress()%>" >
                                    <%} else {%>
                                    <input type="text" class="form-control col-sm-6" style="width:80%;left:25px; background-color:yellow;" name="email" placeholder="<%=currentUser.getEmailAddress()%>" >
                                    <%}%>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="position">Role<span class="dot">*</span></label>
                                    <%if(currentUser != null){%>
                                    <select class="form-control col-sm-6" style="background-color:yellow;width:80%;left:25px;" id="position" name="position">
                                        <option value="<%=currentUser.getJobTitle()%>"><%=currentUser.getJobTitle()%></option>
                                        <%for (int i = 0; i < userRoles.size(); i++){%>
                                        <option value="<%=userRoles.get(i)%>"><%=userRoles.get(i)%></option>
                                        <%}%>
                                        
                                    </select>
                                        <%} else if(editedUser != null){%>
                                         <select class="form-control col-sm-6" style="background-color:yellow;width:80%;left:25px;" id="position" name="position">
                                        <option value="<%=editedUser.getJobTitle()%>"><%=editedUser.getJobTitle()%></option>
                                        <%for (int i = 0; i < userRoles.size(); i++){%>
                                        <option value="<%=userRoles.get(i)%>"><%=userRoles.get(i)%></option>
                                        <%}%>
                                        
                                        </select>
                                        <%} else {%>
                                         <select class="form-control col-sm-6" style="background-color:yellow;width:80%;left:25px;" id="position" name="position">
                                        <option value="<%=currentUser.getJobTitle()%>"><%=currentUser.getJobTitle()%></option>
                                        <%for (int i = 0; i < userRoles.size(); i++){%>
                                        <option value="<%=userRoles.get(i)%>"><%=userRoles.get(i)%></option>
                                        <%}%>
                                        
                                    </select>
                                        <%}%>
                                </div>


                            </section>

                            <section id="right">


                            </section>
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
                            <a type="button" href="ViewAllUsers.jsp" class="btn btn-primary btn-large">CANCEL</a>                            <!-- <button type="Submit" value="Upload" onclick="onUploadImage()">Upload</button> -->
                            <%if (jobPosition.equalsIgnoreCase("Administrator")) {%>
                            <a type="button" href="AdminHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                            <%} else if (jobPosition.equalsIgnoreCase("Management")) {%>
                            <a type="button" href="ManagerHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                            <%} else if (jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Restricted Specialist")) {%>
                            <a type="button" href="SpecialistHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                            <%} else if (jobPosition.equalsIgnoreCase("Associate")) {%>
                            <a type="button" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                            <%}%>
                        </div>     
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
