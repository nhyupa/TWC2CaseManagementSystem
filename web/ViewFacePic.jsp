<%-- 
    Document   : ViewFacePic
    Created on : Jun 13, 2014, 5:29:33 PM
    Author     : keemin.chew.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>
           <script>
            function onSubmit(){
               document.location.href="AssociateMenu.jsp";
            }
        </script>

        <title>View Face Picture</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%">
                    <div class="col-xs-5 col-md-5" align="right" >
                        <img src="image/logo_camans_180w.gif" width="100" />
                    </div>  
                    <div class="username-background-associate col-xs-6 col-md-1"style="margin-top:20px;" >
                        <%
                            if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                String user = (String) request.getSession().getAttribute("username");
                        %>
                        <strong class="word"><%=user%></strong>
                        <%
                            }
                        %>
                        </br>
                        <button type="submit" class="btn-logout" name="logout" onclick="onLogout();"><strong class="word">LOGOUT</strong></button>
                    </div>
                    </div>
                </td> 
            </tr>
            <tr>
                <td class="containerB" valign="top" style="height:10%">
                    Name:<%=session.getAttribute("workerName")%><br/>
                    FIN:<%=session.getAttribute("FIN_Num")%><br/>
                    Emp'yr:<br/>
                    Prob:<br/>
                    Inj dt:<br/>
                </td> 
            </tr>
            <tr>
                <td class="containerC">
                 
                </td> 
            </tr>
            <tr>
                <td class="containerD"style="height:10%">
                       <div class="headertitle">VIEW</div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" valign="top" style="height:10%">
                   <strong>Most recent record:</strong>
                    <br/> 
                     <img data-src="holder.js/150x200" alt="...">
                </td> 
                </td> 
            </tr>


            <tr>
                <td class="containerF"style="height:10%">
                   <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">MENU</button>
                  <br/>
                  If anything above needs to be amended,please inform a social worker or senior volunteer
                </td> 
            </tr>
        </table>

    </body>
</html>

