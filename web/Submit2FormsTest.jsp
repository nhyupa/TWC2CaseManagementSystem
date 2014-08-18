<%-- 
    Document   : Submit2FormsTest
    Created on : Jun 14, 2014, 5:06:07 AM
    Author     : nhyupa.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/Andrew.css"/>

        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        <!-- Bootstrap v3.1.1 -->
        <script src="/TWC2-CaseManagementSystem/javascript/bootstrap.min.js"></script>

        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>
        
        <script language="javascript">
           function doit(){
          
               document.form1.submit();
               document.form2.submit();
               
              
           }
              
        </script>
        
    </head>
    <body>
        <form name="form1" action="WorkerAndJobRegistrationServlet" method="POST">
            Username: <input type ="text" name="username">
            Password: <input type="text" name="password">
        </form>
        
        <form name="form2" action="WorkerAndJobRegistrationServlet" method="POST">
            testing:<input type="text" name="baba">
            haha:<input type="text" name="haha">
        </form>
        <div style="float:left;margin-left:50px"> <a type="button" class="btn btn-primary btn-large" href='javascript:doit()'><span style="font-family:arial;font-size:13px;">SAVE</span></a><br/> <span style="font-family:arial;font-size:11px;">& go to Case Menu</span> </div>
        <a href='javascript:doit()'>Submit to both forms</a>
        
    </body>
</html>
