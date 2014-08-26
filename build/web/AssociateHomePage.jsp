<%-- 
    Document   : AssociateHomePage
    Created on : Jun 3, 2014, 12:03:07 PM
    Author     : keemin.chew.2010
--%>

<%@page import="src.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="stylesheets/Andrew.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>
        
        <!--javascript-->
        <script>
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>
        
        <title>Associate Home Page</title>
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
                    <strong class="headertitle"> HOME PAGE FOR ASSOCIATE</strong>
                </td>
                
                <td rowspan="2" class="container1">
                    <img src="image/logo_camans_180w.gif" style="width:100%;"/>
                    
                    <%
                        if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                            String user = (String) request.getSession().getAttribute("username");
                    %>
                    <div style="height:12%"></div>
                    <div class="username-background">
                        <strong class="word"> Hello <%= user%></strong>
                        </br>
                        <button type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                    </div>
                    <%
                        }
                    %>
                </td>
                
            </tr>
            <%--2nd row--%>
            <%
                String jobTitle = loginUser.getJobTitle();
                session.setAttribute("jobTitle",jobTitle);
                String errorMsg = null;                         
                if (session.getAttribute("errMsg") != null) {
                   errorMsg = (String) session.getAttribute("errMsg");}
            %>
            <tr>
                
                <td rowspan="4" class="container6" style="margin-left:10px;"> <%--container6 --%>
                    <strong>Find worker</strong>
                    <br>
                    <form name="find" action="FindFINServlet">
                        <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                            <span style ="color:red">*</span>Enter FIN number in full(no spaces)
                        </label>
                        <input type="text" name="FIN"><br><br>
                        
                        <label class="col-sm-3 control-label" style="width:80%;padding-left:0;"> 
                            <span style ="color:red">*</span>Or Special Pass number in full (no space)
                        </label>
                        <input type="text" name="speicalPass">
                        <button type="Submit" class="btn btn-primary btn-large">Go Find</button>
                        <hr style="background-color:black; height:0.2em;">
                    </form>
                   
                    
                    <strong>Other options</strong>
                    <br>
                    <a href="OverviewTCRP.jsp">TCRP overview</a><br>
                    <a href="OverviewFareGo.jsp">FareGo overview</a><br>
                    <a href="OverviewKarunya.jsp">Karunya overview</a><br>
                    <a href="OverviewR2R.jsp">R2R overview</a><br>
                    <a href="">My profile</a><br>
                    <a href="">Users gallery</a><br>
                    
                    <br/>
                     <% if (session.getAttribute("errMsg")!=null){ %>
                    <label style="color:red"><%=errorMsg%></label> <%}%>
                    <%session.removeAttribute("errMsg");%>
               
                </td>
              
              
                
                <td class="container11">
                    
                </td>
  
            </tr>
            
            <%String jobPosition = loginUser.getJobTitle();%>
            <%--3rd row--%>
            <tr>
                <td rowspan="3" colspan="2" class="container7"> <%--container7 --%>
                    
                        
                      <ul class="navigation-menu">
                            <li><a href="ViewAllUsers.jsp" class="menu-link">ALL USERS</a></li>
                            <li><a href="ViewMyProfile.jsp" class="menu-link">MY PROFILE</a></li>
                            
                          
                            <%if(jobPosition.equalsIgnoreCase("Administrator")) {%>
                            <li><a href="AdminHomePage.jsp" class="menu-link">ADMINISTRATORS' FORMS</a></li>
                            <%}%>
                            <%if(jobPosition.equalsIgnoreCase("Administrator") || jobPosition.equalsIgnoreCase("Management")){%>
                            <li><a href="ManagerHomePage.jsp" class="menu-link">MANAGERS' FORMS</a></li>
                            <%}%>
                            <%if(jobPosition.equalsIgnoreCase("Administrator") || jobPosition.equalsIgnoreCase("Restricted Specialist") || jobPosition.equalsIgnoreCase("General Specialist") || jobPosition.equalsIgnoreCase("Management")){%>
                            <li><a href="SpecialistHomePage.jsp" class="menu-link">SPECIALISTS' FORMS</a></li>
                            <%}%>
                            
                        </ul>
                        
                        
                        
                   
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
                    
                </td>
            </tr>
        </table>
        
    </body>
</html>

