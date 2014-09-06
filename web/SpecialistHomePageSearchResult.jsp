<%-- 
    Document   : SpecialistHomePageSearchResult
    Created on : August 3, 2014, 11:57:53 AM
    Author     : Sion & Yupa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="stylesheets/Beatrice.css"/>
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
         <!-- MORRIS CHART STYLES-->

            <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
         <!-- GOOGLE FONTS-->
       <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
         <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        
        <!--javascript-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

                <!-- JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.10.2.js"></script>
          <!-- BOOTSTRAP SCRIPTS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="assets/js/jquery.metisMenu.js"></script>
         <!-- DATA TABLE SCRIPTS -->
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
        </script>
             <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>

        
        
        <script>
            function onLogout(){
                document.location.href="/LogoutServlet";
            }
        </script>


        <title>Specialist Home Page Search Result</title>
    </head>
    
   <%
                    ArrayList<Worker> workerFromNameSearchResult = (ArrayList<Worker>)session.getAttribute("workerObjs");
                    if(workerFromNameSearchResult != null){
                        session.removeAttribute("workerObjs");
                    }
                    ArrayList<Worker> workerFromFINSearchResult = (ArrayList<Worker>)session.getAttribute("workerFINObjs");
                    if(workerFromFINSearchResult != null){
                        session.removeAttribute("workerFINObjs");
                    }
                    
                    ArrayList<Worker> genderSearchResults = (ArrayList<Worker>)session.getAttribute("workerGenderObjs");
                    if(genderSearchResults != null){
                        session.removeAttribute("workerGenderObjs");
                    }
                    
                    ArrayList<Worker> nationalitySearchResults = (ArrayList<Worker>)session.getAttribute("nationalitySearchResults");
                    if(nationalitySearchResults != null){
                        session.removeAttribute("nationalitySearchResults");
                    }
                    
                    ArrayList<Worker> workersFromSgPhoneNumSearchResults = (ArrayList<Worker>)session.getAttribute("contactDetailsSearchResults");
                    ArrayList<Worker> workpassSearchResults = (ArrayList<Worker>)session.getAttribute("workpassSearchResults");
                   
                    if(workerFromNameSearchResult!= null && workerFromNameSearchResult.size()!=0){
                        out.println(workerFromNameSearchResult.size());
                    }
                    if(workerFromFINSearchResult!= null && workerFromFINSearchResult.size()!=0){
                        out.println(workerFromFINSearchResult.size());
                    }
                    if(genderSearchResults!= null && genderSearchResults.size()!=0){
                        out.println(genderSearchResults.size());
                    }
                    if(nationalitySearchResults!= null && nationalitySearchResults.size() !=0){
                        out.println(nationalitySearchResults.size());
                    }
                    
   %>               
    
    
    
    
    <body>
        <%-- left side menus--%>

        <table border ="2" align="center" class="leftDivision">
            <%--1st row--%>

            <tr>
                <td rowspan="3" class="container2">

                </td>
                <td rowspan="6" class="container10" >

                </td>
                <td class="container5" >
                    <strong class="headertitle">SPECIALIST SEARCH RESULTS PAGE</strong>
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
                </td

            </tr>
            <%--2nd row--%>

            <tr>

                <td rowspan="4" valign="top" class="container6"> <%--container6 --%>

                    <% String FIN = (String) request.getSession().getAttribute("FIN");

                    %> 

                    <div style="margin-left:10px;">
                        <h4>
                            Search Results
                        </h4> 
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>FIN Number</th>
                                            <th>Name</th>
                                            <th>Gender</th>
                                            <th>Nationality</th>
                                            <th>Worker Registration Date</th>
                                                
                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->     
                    </div>
                    <%
                    String notFoundMsg = null;
                    if (session.getAttribute("notFoundMsg") != null) {
                        notFoundMsg = (String) session.getAttribute("notFoundMsg");
                    }%>
                    
                    <% if (session.getAttribute("notFoundMsg") != null) {%>
                    <label style="color:red;margin-left:10%"><%=notFoundMsg%></label> <%}%>
                    <br>
                    
                    <%session.removeAttribute("notFoundMsg");%>
                    
                   <% String workerName = null;%>
                   <%
                    String nationalitySearchReesultMsg = null;
                    if (session.getAttribute("nationalitySearchResultsMsg") != null) {
                        nationalitySearchReesultMsg = (String) session.getAttribute("nationalitySearchResultsMsg");
                    }%>
                    
                    <% if (session.getAttribute("nationalitySearchResultsMsg") != null) {%>
                    <label style="color:green;margin-left:10%"><%=nationalitySearchReesultMsg%></label></a> 
                    <br>
                    <%}%>
                    <%session.removeAttribute("nationalitySearchResultsMsg");%>
                </td>

            </tr>
            <%--3rd row--%>
            <tr>
                <td rowspan="3" class="container7" style="margin-right:10px;"> <%--container7 --%>
                    <ul class="navigation-menu">
                        <li><a href="ViewAllUsers.jsp" class="menu-link" style="font-size:13px;">ALL USERS</a></li>
                        <li><a href="ViewMyProfile.jsp" class="menu-link" style="font-size:13px;">MY PROFILE</a></li>
                        <li><a href="" class="menu-link" style="font-size:13px;">STANDARD REPORT</a></li>
                        <li><a href="AssociateHomePage.jsp" class="menu-link" style="font-size:13px;">ASSOCIATES' FORMS</a></li>
                        <li><a href="SpecialistHomePage.jsp" class="menu-link" style="font-size:13px;">SPECIALISTS' FORMS</a></li>
                        <li><a href="ManagerHomePage.jsp" class="menu-link" style="font-size:13px;">MANAGER's FORMS</a></li>
                        <li><a href="AdminHomePage.jsp" class="menu-link" style="font-size:13px;">ADMINISTRATOR'S FORM</a></li>
                        
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

                <td colspan="2" class="container9">

                </td>
            </tr>
        </table>

    </body>
</html>

