<%-- 
    Document   : SearchJSP
    Created on : Aug 1, 2014, 5:45:13 AM
    Author     : nhyupa.2010
--%>

<%@page import="src.Worker"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search Functionality</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
   
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
     <!-- TABLE STYLES-->
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<%
        DBConnect dbConnect = new DBConnect();
        DBConnect.connectDB();
        ArrayList<Worker> workers = new ArrayList<Worker>();
        workers = dbConnect.getWorkers();

%>
<body>
    <div id="wrapper">
        
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Advanced Tables
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>FIN Number</th>
                                            <th>Name</th>
                                            <th>Gender</th>
                                            <th>Nationality</th>
                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                     <%for (int i = 0; i < workers.size(); i++) {
                                         Worker worker = workers.get(i);
                                         String FIN = worker.getFIN_Num();
                                         String name =worker.getWorkerName();
                                         String gender =worker.getGender();
                                         String nationality = worker.getNationality();
    
                                     %>
                                     
                                        <tr class="odd gradeX">
                                            <td><%=FIN%></td>
                                            <td><%=name%></td>
                                            <td><%=gender%></td>
                                            <td class="center"><%=nationality%></td>
                                     
                                        </tr>
                                       <%}%>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>         
    </div>
             <!-- /. PAGE INNER  -->
            
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
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
    
   
</body>
</html>
