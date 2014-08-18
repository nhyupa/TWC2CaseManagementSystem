<%-- 
    Document   : ProblemComplimentCaseMenu
    Created on : Aug 3, 2014, 11:46:58 PM
    Author     : Sharco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Problem Compliment Case Menu</title>
    </head>
    <body>
        <div style="font-size:16px; font-weight:bold;color:black; margin-left:10px;">Problem complements</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-16">
            <div class="col-md-2" style=" width:12%; "><a href="ListRecords.jsp?listToSee=<%="aggravatingIssue"%>">Aggravating issue</a></div> 
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="leadCaseworker"%>">Lead caseworker</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="auxiliaryCaseworker"%>">Auxiliary caseworker</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="salaryRelatedHistory"%>">Salary & related history</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="injuryHistory"%>">Injury history</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="illnessHistory"%>">Illness history</a></div>
            <div class="col-md-2" style="width:13%"><a href="ListRecords.jsp?listToSee=<%="detailsHistoryOtherProblems"%>">Details/history other problems</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="traffickingIndicators"%>">Trafficking indicators</a></div>
        </div>
        <div class="row2 col-md-16" style="margin-top:20px">

            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="salaryClaimLodged"%>">Salary claim lodged</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="wicaClaimLodged"%>">Wica claim lodged</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="nonWicaMedClaim"%>">Non-Wica med claim</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="policeReport"%>">Police report</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="othComplaintLodged"%>">Oth complaint lodged</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="hospital"%>">Hospital</a></div>
            <div class="col-md-2" style="width:13%"><a href="ListRecords.jsp?listToSee=<%="mcLightDutyStatus"%>">MC/Light Duty status</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="caseDiscussion"%>">Case discussion</a></div>

        </div>

       <div class="row3 col-md-16" style="margin-top:20px">

            <div class="col-md-2" style="width:12%;"><a href="ListRecords.jsp?listToSee=<%="r2rAppts"%>">R2R appts</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="wicaStatus"%>">Wica status</a></div>
            <div class="col-md-2" style="width:12%"><a href="ListRecords.jsp?listToSee=<%="lawyerStatus"%>">Lawyer status</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="caseMilestoneNonCriminal"%>">Case milestone (non-criminal)</a></div>
            <div class="col-md-2" style="width:14%"><a href="ListRecords.jsp?listToSee=<%="caseMilestoneCriminal"%>">Case milestone (criminal)</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="transferTJSRepatriation"%>">Transfer, TJS, repatriation</a></div>
            <div class="col-md-2" style="width:11%"><a href="ListRecords.jsp?listToSee=<%="benefaction"%>">Benefaction</a></div>

        </div>


    </body>
</html>
