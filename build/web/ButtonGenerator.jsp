<%-- 
    Document   : ButtonGenerator
    Created on : May 30, 2014, 3:09:16 AM
    Author     : nhyupa.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FIN Generator</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="GenerateFINServlet" method ="POST">
            FIN No: <input type="text"/>
            <button type="Submit" value ="GenerateFIN">GenerateFIN </button>
            
        </form>
    </body>
</html>
