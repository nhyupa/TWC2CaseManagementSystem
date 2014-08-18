<%-- 
    Document   : AssociateViewAllUsers
    Created on : Jul 19, 2014, 10:29:22 AM
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
       
        
        <!--javascript-->
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
        <script type="text/javascript">
            function submit()
            {
                document.forms["form3"].submit();
            }
            
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        </script>

         <script language="javascript">
            function onLogout(){
                document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
            }
        
        </script>
            
        
        
        <!--Database-->
             <%
                            // retrieve users from database    
                            ArrayList<User> users = new ArrayList<User>();
                            DBConnect dbConnect = new DBConnect();
                            dbConnect.connectDB();

                            users = dbConnect.getUsers();
                            ArrayList<String> realNames = DBConnect.retrieveSortedRealNames(users);
                            ArrayList<User> sortedUsers = DBConnect.retrieveSortedUsers(users,realNames);
                            User loginUser = null;
                            try{
                                for (int i = 0; i < sortedUsers.size(); i++) {
                                    User user1 = sortedUsers.get(i);
                                    if (user1.getUsername().equals(session.getAttribute("username").toString())) {  //Find loginUser by using session user information
                                        loginUser = user1;
                                    }
                                }
                            }catch(Exception ex){
                               if (loginUser==null){
                                response.sendRedirect("index.jsp");
                                 return;

                              }
                                
                            }

                        %>
        
        <title>AssociateViewAllUsers</title>
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
                    <div class="headertitle-associate">VIEW ALL USERS</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%;">
                  <div class="maincontent-associate">
                         
                        <%
                            for (int i = 0; i < sortedUsers.size(); i++) {
                                User currentUser = sortedUsers.get(i);
                        %>          
                            
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" align ="center">
                                  <img src ="image/<%=currentUser.getPhoto()%>" data-src="holder.js" style="height:150px;width:150px">
                                  <p> <%=currentUser.getfullName()%></p>
                                 <p><%=currentUser.getAlias()%></p>
                                         <p><%=currentUser.getJobTitle()%></p>
                            </div>
                        </div>

                        <%
                            }
                        %>
                       
                  </div><!--end of main content-->
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <div class="btn-associate-landscape btn-associate">
                       <a type="button" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOME PAGE</a>
                    </div>
                    </td> 
            </tr>
        </table>

    </body>
</html>
