<%-- 
    Document   : Login
    Created on : May 13, 2014, 9:28:05 AM
    Author     : nhyupa.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script language="javascript">
        function onSubmit(){
            document.form1.action="LoginServlet";
        }
function onForgetPassword(){
        document.form1.action="ForgetPasswordServlet";
}
        </script>
    </head>
    <body>
        <form name="form1" action="" method="POST">
            Username: <input type ="text" name="username">
            Password: <input type="text" name="password">
            
            
            <input type="Submit" Value="Login" onClick="onSubmit()"/>
            <input type="Submit" value="Forget Password" onClick="onForgetPassword()"/>
            
        </form>
        <% if (request.getAttribute("errorMsg")!=null){
            String errorMsg = (String)request.getAttribute("errorMsg"); %>
        <label><%=errorMsg%></label>  <%}%>
        
       <% if (request.getAttribute("notificationMsg")!=null){
            String msg = (String)request.getAttribute("notificationMsg"); %>
        <label><%=msg%></label>  <%}%>
        
    </body>
</html>
