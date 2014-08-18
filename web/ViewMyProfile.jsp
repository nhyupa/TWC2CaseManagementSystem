<%-- 
    Document   : ViewMyProfile
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
        <!-- Bootstrap v3.1.1 -->

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <!--javascript-->
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>

        <script language="javascript">
            function onEditPassword()  {
                document.form1.action = "/TWC2-CaseManagementSystem/ChangeMyPassword.jsp";
            }
            function onEdit() {
                document.location.href = "/TWC2-CaseManagementSystem/EditMyProfile.jsp";
            }
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        <title> View My Profile</title>
    </head>

    <body style ="width:100%">

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

        <%-- left side menus--%>
        <table border ="2" align="center" class="leftDivision">
            <%--1st row--%>

            <tr>
                <td rowspan="3" class="container2">

                </td>
                <td rowspan="6" class="container10">

                </td>
                <td colspan="2" class="container5">
                    <strong class="headertitle"> VIEW MY PROFILE </strong>

                </td>

                <td rowspan="2" class="container1">
                    <img src="image/logo_camans_180w.gif" style="width:100%"/>
                    <% if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                            String user = (String) request.getSession().getAttribute("username");
                    %>
                    <div style="height:12%"></div>
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
            <%
                String gender = loginUser.getGender();
                String formattedGender = gender.substring(0, 1);
            %>
            <tr>
             
                <td valign="top" rowspan="4" class="container6"> <%--container6 --%>

                    <form action="#" name="form1" role="form" id="userInfo-form"  method="post"> 
                        <div class="fileinput fileinput-new" style="float:right" >
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;">
                                <img src="image/<%=loginUser.getPhoto()%>">
                                
                            </div>
                                
                            <!-- photosize 150x200-->
                        </div>
                        <section id="left">
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="username">Username</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=loginUser.getUsername()%></p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="fullName">Name</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=loginUser.getfullName()%></p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="FIN" style="width:80%;"> NRIC/FIN Number</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;" > <%=loginUser.getNRICNum()%> </p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Gender"> Gender </label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=formattedGender%> </p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="ContactNumber" style="width:80%;"> Contact Number </label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=loginUser.getMobileNumber()%> </p>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Email"> Email</label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=loginUser.getEmailAddress()%> </p>  
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="Position"> Position </label>
                                <p class="form-control col-sm-6" style="width:80%;left:25px;"> <%=loginUser.getJobTitle()%> </p>
                            </div>

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
                        <button type="submit" form ="userInfo-form" class="btn btn-primary btn-large" onClick="onEditPassword()">CHANGE PASSWORD</button>
                        <button type="button" class="btn btn-primary btn-large" onclick="onEdit()">EDIT</button>
                        
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
    </form>

</body>
</html>
