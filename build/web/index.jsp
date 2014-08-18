<%-- 
    Document   : index
    Created on : May 17, 2014, 11:02:34 AM
    Author     : keemin.chew.2010
    Reviewed by: Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        
        <!-- Bootstrap v3.1.1 -->
        <link rel="stylesheet" href="stylesheets/bootstrap.css"/>
        
        <!-- Bootstrap v3.1.1 -->
        <script src="javascript/bootstrap.min.js"></script>
        
        <script language="javascript">
            function onSubmit() {
                document.form1.action ="LoginServlet";
            }
            function onForgetPassword() {
                document.form1.action = "ForgetPasswordServlet";
            }
        </script>
    </head>
    
    
    <body>
        <div class="container" align="center">
            <div style="height:10px;"></div>
            <div class="row1" style="width:360px;height:300px;">
                <!--TWC2 logo-->
                <span class="col-xs-4"><img src="image/logo_camans_360w.gif"/></span>  
            </div>
            
            <div class="row2" style="width:360px;height:200px;">
                <!--login-->
                <form name="form1" method="post">
                    <div class="form-group ">
                        <label for="exampleInputEmail1" style="margin-right:180px;">Username</label>
                        <input type="text" class="form-control" style="margin-left:3px; width:110%;" name="username"  >
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1" style="margin-right:180px;">Password</label>
                        <input type="password" class="form-control" style="margin-left:3px; width:110%;" name="pass">
                    </div>
                    
                    <div style="margin-left:20px;">
                        <button class="btn btn-primary" style="background-color:rgb 176.172.231; font-weight:bold;" onclick="onSubmit();">LOGIN</button>
                        <button class="btn btn-primary" style="background-color:rgb 176.172.231; font-weight:bold;" onclick="onForgetPassword();" >FORGET PASSWORD?</button>
                    </div>
                </form>
                
            </div>
            
            <% if (request.getAttribute("msgAuth") != null) {
                String errorMsg = (String) request.getAttribute("msgAuth");%>
            <label style="color:red"><%=errorMsg%></label> <%}%>
            <%request.removeAttribute("msgAuth");%>
            
            <% if (session.getAttribute("errorMsg") != null) {
                String msg = (String) session.getAttribute("errorMsg");%>
            <label style="color:red"><%=msg%></label> <%}%>
            <%request.removeAttribute("msgAuth");%>
            <% if (session.getAttribute("notificationMsg") != null) {
                String msg = (String) session.getAttribute("notificationMsg");%>
            <label style="color:red"><%=msg%></label> <%}%>
            <%request.removeAttribute("msgAuth");%>
            <% if (request.getAttribute("logoutMsg") != null) {
                String msg = (String) request.getAttribute("logoutMsg");%>
            <label style="color:red"><%=msg%></label> <%}%>
            <%request.removeAttribute("msgAuth");%>
            
        </div><!-- end of container-->
        
        
        
        
        
    </body>
</html>
