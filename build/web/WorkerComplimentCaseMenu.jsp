<%-- 
    Document   : WorkerComplimentCaseMenu
    Created on : Aug 3, 2014, 5:44:01 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="font-size:16px; font-weight:bold;color:black; margin-left:10px;">Worker complements</div>
        <div style="height:20px;"></div>
        <div class="row1 col-md-16">
            <div class="col-md-2" style=" width:15%; "><a href="ListRecords.jsp?listToSee=<%="nickName"%>">Nick name</a></div> 
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="passportDetails"%>">Passport details</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="facePhoto"%>">Face photo</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="sgPhoneNumber"%>">Sg phone number</a></div>
            <div class="col-md-2" style="width:19%"><a href="ListRecords.jsp?listToSee=<%="homeCountryPhoneNumber"%>">Home country phone number</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="sgAddress"%>">Worker's Sg address</a></div>
        </div>
        <br>
        <div class="row2 col-md-16" style="margin-top:30px">
            <div class="col-md-2" style="width:15%"><a href="ListRecords.jsp?listToSee=<%="homeCountryAddress"%>">Home ctry address</a></div>
            <div class="col-md-2" style="width:15%;"><a href="ListRecords.jsp?listToSee=<%="workersDigitalContacts"%>">Worker's digital&nbsp;contacts</a></div> 
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="nextOfKin"%>">Next of kin</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="familyMember"%>">Family member</a></div>
            <div class="col-md-2" style="width:19%"><a href="ListRecords.jsp?listToSee=<%="friendInSingapore"%>">Friend in Singapore</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="workersLanguage"%>">Worker's language</a></div>

        </div>
        <div class="row2 col-md-16">
            <div class="col-md-2" style="width:15%;margin-top:30px;"><a href="ListRecords.jsp?listToSee=<%="bankAccountDetails"%>">Bank account details</a></div>
        
        </div>

      
    </body>
</html>
