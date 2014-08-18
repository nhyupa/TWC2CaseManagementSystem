<%-- 
    Document   : JobComplimentCaseMenu
    Created on : Aug 3, 2014, 11:45:29 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Compliment Case Menu</title>
    </head>
    <body>
        <div style="font-family:arial; font-size:16px; font-weight:bold;color:black; margin-left:10px;">Job complements</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">
            <div class="col-md-2" style="width:15%;"><a href="ListRecords.jsp?listToSee=<%="passDetails"%>">Pass details</a></div> 
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="IPADetails"%>">IPA details</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="verbalAssurances"%>">Verbal assurances pre-job</a></div>
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="employmentContract"%>">Employment contract</a></div>
            <div class="col-md-2" style="width:18%"><a href="ListRecords.jsp?listToSee=<%="intermediaryAgent"%>">Intermediary agent</a></div>
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="employerDetails"%>">Employer details</a></div> 
        </div>
        <div class="row2 col-md-9" style="margin-top:20px">
            <div class="col-md-2"><a href="ListRecords.jsp?listToSee=<%="workplaceDetails"%>">Workplace details</a></div>
            <div class="col-md-2" style="width:16%"><a href="ListRecords.jsp?listToSee=<%="workHistory"%>">Work history</a></div>
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="accommodationDuringWork"%>">Accommodation during work</a></div>
        </div>

    </body>
</html>
