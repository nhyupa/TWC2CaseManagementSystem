<%-- 
    Document   : Testing
    Created on : May 31, 2014, 5:28:10 PM
    Author     : Sharco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <title>JSP Page</title>
    </head>
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
                    <td colspan="2"class="container5">
                        <h3><bold>  View Other User </bold></h3>

                    </td>

                    <td rowspan="2" class="container1">
                        <img src="image/logo_camans_180w.gif"/>

                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <div class="username-background" align="center">
                            <span style="color:white"> Hello <%= user%></span>
                            </br>
                            <a href="/TWC2-CaseManagementSystem/LogoutServlet"  role="button" class="btn btn-danger" >LOGOUT</a>
                        </div>
                        <%
                            }
                        %>
                    </td>

                </tr>
                <%--2nd row--%>

                <tr>
               
                    <td rowspan="4" class="container6"> <%--container6 --%>

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

                    </td>
                </tr>
            </table>
        </div>

    </body>
</html>
