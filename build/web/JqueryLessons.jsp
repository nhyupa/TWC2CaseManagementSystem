<%-- 
    Document   : JqueryLessons
    Created on : Jun 9, 2014, 1:07:16 PM
    Author     : nhyupa.2010
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>
        
        <style>
            ul li {
             color: red;   
            }
            .emphasis {
                color: blue;
            }
            
            .just-color {
                color:green;
            }
            
            .just-color2{
                color:#3c3c3c;
            }
            
        </style>
        
        <script>
            
            $(function(){
                var listItems = $('li');
                console.log(listItems);
            
            });
            $(document).ready(function(){
                var listItems = $('ul li');
                
                /**To call css class **/
                //listItems.addClass('emphasis');
                
                /** Simple Method **/
                //listItems.css('color','green');
               
                //console.log(listItems);
                $('li:first-child').addClass('emphasis');
                
                var ulCss = $('ul.just-color');
                ulCss.children('li').addClass('just-color2');
                console.log(ulCss);
                
                var ulcss = $('ul.just-color');
                ulcss.children('li').children('ul').addClass('just-color');
            });
            
            
        </script>
        
    </head>
    <body>
        <ul class="just-color">
            <li>Hello Jquery</li>
            <li>Hello Yupa</li>
            <li>Hello Daisy</li>
            <li>
                <ul>
                    <li>This is the decendent.</li>
                </ul>
            </li>
        </ul>
           
        
    </body>
</html>
