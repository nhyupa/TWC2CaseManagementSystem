<%-- 
    Document   : Test
    Created on : Jul 12, 2014, 12:41:19 AM
    Author     : nhyupa.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="TestServlet">
            
            
            <label class="col-sm-1 control-label" style="width:100%;padding-left:0;"> 
                Upload Attachment for Worker:
                <input type="file" name="uploadedFileName">
            </label>
            
            <label class="col-sm-1 control-label" style="width:100%;padding-left:0;"> 
                <input type="submit" value="Upload">
                
            </label>
            
        </form>
    </body>
</html>
