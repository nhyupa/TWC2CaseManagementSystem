<%-- 
    Document   : ViewOtherUser
    Author     : Sion
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.User"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title> View User </title>

        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>

        <script>
            function onSubmit(){
                document.form1.action="ResetPasswordServlet";
            }
            function onForgetPassword(){
                document.form1.action="DeleteUserServlet";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
            function onEdit(){
                document.location.href="/TWC2-CaseManagementSystem/EditUserProfile.jsp";
            }
            function onDelect(){
                document.location.href="/TWC2-CaseManagementSystem/DeleteUserServlet";
            }
           
         
        </script>

    </head>

    <body>

        <%

            if (request.getParameter("userToView") == null) {
            } else {
                String userToView = request.getParameter("userToView");
                
                session.setAttribute("userToView", userToView);

            }

        %>

        <%-- left side menus--%>
        <table align="center" class="leftDivision">
            <%--1st row--%>

            <tr>
                <td rowspan="3" class="container2">

                </td>
                <td rowspan="6" class="container10">

                </td>
                <td colspan="2" class="container5">
                    <strong class="headertitle"> VIEW USER </strong>

                </td>

                <td rowspan="2" class="container1" >
                    <img src="image/logo_camans_180w.gif" style="width:100%"/>

                    <%
                        if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                            String user = (String) request.getSession().getAttribute("username");
                    %>
                    <div class="username-background">
                        <strong class="word" style="margin-left:8px;"> Hello <%= user%></strong>
                        </br>
                        <button style="margin-left:2px;" type="Submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                    </div>
                    <%
                        }
                    %>
                </td>

            </tr>
            <%--2nd row--%>

            <tr>

                <td valign="top" rowspan="4" class="container6" > <%--container6 --%>
                    <!--content-->
                    <%


                        DBConnect database = new DBConnect();
                        DBConnect.connectDB();
                        ArrayList<User> userList = new ArrayList<User>();
                        
                        userList = database.getUsers();
                        
                        ArrayList<String> realNames = DBConnect.retrieveSortedRealNames(userList);
                        ArrayList<User> sortedUsers = DBConnect.retrieveSortedUsers(userList,realNames);
                        // to find the person whom you want to view
                        User currentUser = sortedUsers.get(Integer.parseInt(session.getAttribute("userToView").toString()));
                        // to find currently login user
                        User loginUser = null;
                        for (int j = 0; j < userList.size(); j++) {
                            User user1 = userList.get(j);
                            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                                loginUser = user1;
                            }
                        }

                    %> 

                    <br/>
                    <!--show message-->
                    <% if (request.getAttribute("lockedNotificationMsg") != null) {
                                String msg = (String) request.getSession().getAttribute("lockedNotificationMsg");%>
                    <label><%=msg%></label> <%}%>
                    <% if (request.getAttribute("deleteNotificationMsg") != null) {
                                String msg = (String) request.getAttribute("deleteNotificationMsg");%>
                    <label><%=msg%></label> <%}%>

                    <form action="#" name="form1" role="form" id="userInfo-form"  method="post"> 

                        <div class="fileinput fileinput-new" style="float:right" >
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 220px;">
                                <% if (currentUser.getPhoto() != null) {%>  
                                <img style="width:150px;height:160px" src="image/<%=currentUser.getPhoto()%>">
                                <% } else {%> 
                                <img style="width:150px;height:160px" src="image/default.jpg"/>                                     
                                <% }%> 
                            </div>

                            <!-- photosize 150x200-->
                        </div>
                        <section id="left">

                            <div class="form-group">
                                <label for="username" class="col-sm-3 control-label">Username</label>
                                <p class="form-control col-sm-6 " style="width:80%;left:25px;"> <%=currentUser.getUsername()%></p>
                            </div> 
                            <%session.setAttribute("currentUsername", currentUser.getUsername());%>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="fullName">Name</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%= currentUser.getfullName()%></p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="FIN" style="width:80%">NRIC/FIN Number</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%= currentUser.getNRICNum()%> </p>
                            </div> 
                            <%session.setAttribute("currentUserFIN", currentUser.getNRICNum());%>
                            
                            <%
                                String currentUserGender = currentUser.getGender();
                                String formattedGender = currentUserGender.substring(0,1);
                            %>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Gender"> Gender </label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=formattedGender%> </p>
                            </div> 

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="ContactNumber" style="width:80%;"> Contact Number </label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%= currentUser.getMobileNumber()%> </p>

                            </div> 

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Email"> Email </label>
                                <p class="form-control col-sm-6 " style="width:80%;left:25px;"> <%= currentUser.getEmailAddress()%> </p>

                            </div>
                            <%session.setAttribute("currentUserEmailAddress", currentUser.getEmailAddress());%>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Position"> Role </label>
                                <p class="form-control col-sm-6"  style="width:80%;left:25px;"> <%= currentUser.getJobTitle()%> </p>

                            </div>
                                
                                <div class="form-group">
                                <% if (session.getAttribute("resetSuccessMsg") != null) {
                                String resetMsg = (String) session.getAttribute("resetSuccessMsg");%>
                                <label class="col-sm-12 control-label" style="color:green"><%=resetMsg%></label> <%}%>
                                <%session.removeAttribute("resetSuccessMsg");%>

                            </div>
                        </section>
                                

                    </form>
                                
                                

                </td>

                <td class="container11" >

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
                        <%if(jobPosition.equalsIgnoreCase("Administrator") && !currentUser.getJobTitle().equalsIgnoreCase("Administrator")){%>
                        <button type="submit" form ="userInfo-form" class="btn btn-primary btn-large" onClick="onSubmit()">RESET PASSWORD</button>
                        
                        <button type="button" class="btn btn-primary btn-large" onclick="onEdit()">EDIT</button>
                       
                        <%}%>
                        <a type="button" href="ViewAllUsers.jsp" class="btn btn-primary btn-large">CANCEL</a>
                        <%if(jobPosition.equalsIgnoreCase("Administrator")){%>
                        <a type="button" href="AdminHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("Management")){%>
                        <a type="button" href="ManagerHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Restricted Specialist")){%>
                        <a type="button" href="SpecialistHomePage.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%} else if(jobPosition.equalsIgnoreCase("Associate")){%>
                        <a type="button" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <%}%>
                        
                        

                    </div>    
                </td>
            </tr>
        </table>

    </body>
</html>

