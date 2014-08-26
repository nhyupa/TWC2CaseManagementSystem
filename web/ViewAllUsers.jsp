<%-- 
    Document   : AdminViewAllUsers
    Created on : May 19, 2014, 9:07:07 PM
    Author     : Sion
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page import="src.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Beatrice.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>

        <script src="holder.js"></script>

        <script type="text/javascript">
            function submit()
            {
                document.forms["form3"].submit();
            }
            
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>

        <script>
            $(document).ready(function(){

                var start = 0;
                var nb = 18;
                var end = start + nb;
                var length = $('.img-list div').length;
                var list = $('.img-list div');

                list.hide().filter(':lt('+(end)+')').show();


                $('.prev, .next').click(function(e){
                    e.preventDefault();

                    if( $(this).hasClass('prev') ){
                        start -= nb;
                    } else {
                        start += nb;
                    }

                    if( start < 0 || start >= length ) start = 0;
                    end = start + nb;       

                    if( start == 0 ) list.hide().filter(':lt('+(end)+')').show();
                    else list.hide().filter(':lt('+(end)+'):gt('+(start-1)+')').show();
                });
            });
                        
        </script>    

        <title> View All Users</title>
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
                <td class="container5">
                    <strong class="headertitle">VIEW ALL USERS</strong>
                </td>

                <td rowspan="2" class="container1">
                    <img src="image/logo_camans_180w.gif" style="width:100%;"/>

                    <%
                        if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                            String user = (String) request.getSession().getAttribute("username");
                    %>
                    <div style="height:31px;"> </div>
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
                        // retrieve users from database    
                        ArrayList<User> users = new ArrayList<User>();
                        DBConnect dbConnect = new DBConnect();
                        dbConnect.connectDB();

                        users = dbConnect.getUsers();
                        ArrayList<String> realNames = DBConnect.retrieveSortedRealNames(users);
                        ArrayList<User> sortedUsers = DBConnect.retrieveSortedUsers(users, realNames);
                        User loginUser = null;
                        for (int i = 0; i < sortedUsers.size(); i++) {
                            User user1 = sortedUsers.get(i);
                            if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                                loginUser = user1;
                            }
                        }

                        String loginUserPosition = loginUser.getJobTitle();
                    %>

                    <br/>
                    <div class="col-sm-6 col-md-4" style="width:100%;margin-bottom:10px;margin-left:10px;">
                        <a href="#" class="prev">Prev</a>
                        <a href="#" class="next">Next</a>
                    </div>

                    <div class="img-list">

                        <%
                            for (int i = 0; i < sortedUsers.size(); i++) {
                                User currentUser = sortedUsers.get(i);

                        %> 

                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" align ="center">
                                 <%if(currentUser.getPhoto().length() !=0){%>
                                <a href="/TWC2-CaseManagementSystem/ViewOtherUser.jsp?userToView=<%=(i)%>" > <img src ="image/<%=currentUser.getPhoto()%>" data-src="holder.js" style="height:160px;width:120px"></a>
                                <%} else{%>
                                <a href="/TWC2-CaseManagementSystem/ViewOtherUser.jsp?userToView=<%=(i)%>" > <img src ="image/default.jpg" data-src="holder.js" style="height:160px;width:120px"></a>
                                <%}%>
                                    <%if (loginUserPosition.equalsIgnoreCase("Associate")) {%>
                                <text><%=currentUser.getfullName()%></text><br/>
                                <text><%=currentUser.getAlias()%></text>
                                <p style="font-weight:bold;"><%=currentUser.getJobTitle()%></p>
                                <%} else {%>
                                <a href="/TWC2-CaseManagementSystem/ViewOtherUser.jsp?userToView=<%= (i)%>" > <%= currentUser.getfullName()%></a><br/>
                                <text><%=currentUser.getAlias()%></text>
                                <p style="font-weight:bold;"><%=currentUser.getJobTitle()%></p>

                                <%}%>
                            </div>
                        </div>

                        <%
                            }
                        %>
                    </div>

               
                </td>
            </tr>
            <%--3rd row--%>
            <tr>
                <td rowspan="3" class="container7"> <%--container7 --%>

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
            <% String jobPosition = loginUser.getJobTitle();%>
            <tr>

                <td colspan="2" class="container9">
                    <%if (jobPosition.equalsIgnoreCase("Administrator")) {%>
                    <a type="button" href="AdminHomePage.jsp" style="margin-left:10px;" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                    <%} else if (jobPosition.equalsIgnoreCase("Management")) {%>
                    <a type="button" href="ManagerHomePage.jsp" style="margin-left:10px;" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                    <%} else if (jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Restricted Specialist")) {%>
                    <a type="button" href="SpecialistHomePage.jsp" style="margin-left:10px;" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                    <%} else if (jobPosition.equalsIgnoreCase("Associate")) {%>
                    <a type="button" href="AssociateWelcome.jsp" style="margin-left:10px;" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                    <%}%>
                </td>
            </tr>
        </table>


    </body>
</html>
