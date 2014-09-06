<%-- 
    Document   : ViewFacePic
    Created on : Jun 13, 2014, 5:29:33 PM
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
            @media (min-width: 1024px){
                .headertitle-associate{
                    margin-left:34%;
                }
                .maincontent-associate{
                    margin-left:34%;
                }
                .btn-associate-landscape{
                       margin-left:34%;
                }
            }  
        </style>
        <!--javascript-->
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
           <script>
            function onSubmit(){
               document.location.href="AssociateMenu.jsp";
            }
            function onLogout(){
               document.location.href="/TWC2-CaseManagementSystem/LogoutServlet";
             }
        </script>
        
       <!--database--> 
         <%
            DBConnect database = new DBConnect();
            DBConnect.connectDB();
            ArrayList<User> userList = new ArrayList<User>();
            userList = database.getUsers();
            //User currentUser = null;
            User loginUser = null;
          try{
            // to find currently login user
            
            for (int i = 0; i < userList.size(); i++) {
                User user1 = userList.get(i);
                if (user1.getUsername().equals(request.getSession().getAttribute("username").toString())) {  //Find loginUser by using session user information
                    loginUser = user1;
                }
            }
          }catch(Exception ex){

          }
             if (loginUser==null){
                         response.sendRedirect("index.jsp"); return;
                        }
             String FIN=(String)session.getAttribute("FIN");
             String workerPicture=DBConnect.getWorkerPicture(FIN);
        %> 

        <title>View Face Picture</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                    <div class="header-associate">
                        <div class="col-xs-5" align="right" >
                            <img src="image/logo_camans_180w.gif" width="100" />
                        </div>  
                        <div class="username-background-associate col-xs-6" style="margin-top:20px;" align="center">
                            <%
                                if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                    String user = (String) request.getSession().getAttribute("username");
                            %>
                            <strong class="word"><%=user%></strong>
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
                <td class="containerB" valign="top" style="height:10%">
                   <div class="worker-details-associate">
                        Name:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("workerName")%><br/>
                        FIN:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("FIN")%><br/>
                        Emp'yr:&nbsp;&nbsp;<%=session.getAttribute("employerName")%><br/>
                        Prob:&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("problemNameShow")%><br>
                        Inj dt:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("currentInjuryDate")%><br>
                            <hr class="redline-associate">
                    </div>
                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%;">
                 
                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%">
                       <div class="headertitle-associate">VIEW</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                    <div class="maincontent-associate">
                        <strong>Most recent record:</strong>
                        <br> <br>
                        <%if(workerPicture==null){%>
                        <img data-src="holder.js/150x200" alt="...">
                        <%}else{%>
                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;">
                          <img src="WorkerFacePicture/<%=workerPicture%>"alt="">
                        </div>
                        <%}%>
                    </div>
                </td> 
                 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                    <br><br>
                    <div class="btn-associate-landscape btn-associate">
                     <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MENU</button>
                     <br>
                  If anything above needs to be amended,please inform a social worker or senior volunteer
                    </div> 
                  
                </td> 
            </tr>
        </table>

    </body>
</html>

