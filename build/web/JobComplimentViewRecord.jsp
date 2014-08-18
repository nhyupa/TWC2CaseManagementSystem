<%-- 
    Document   : JobComplimentViewRecord
    Created on : Aug 5, 2014, 5:24:51 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Compliment View Record</title>
    </head>
    <body>

        <% String listToSee = (String) session.getAttribute("listToSee");%>

        <!-- Pass details --> 
        <%
            if (listToSee.equalsIgnoreCase("passDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Pass details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Pass type</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Pass number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Pass issue date</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div> 
        <%}%> 


        <!-- IPA details --> 
        <%
            if (listToSee.equalsIgnoreCase("IPADetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">IPA details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Workpass specified in IPA</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>IPA employer name</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>IPA basic monthly salary S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>IPA total deductions S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div> 
        <%}%> 



        <!-- Verbal assurances pre-job --> 
        <%
            if (listToSee.equalsIgnoreCase("verbalAssurances")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Verbal assurances pre-job</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Name of giver of verbal assurances</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Relationship of giver to worker or agent or employer</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>When verbal assurances given</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Where verbal assurances given</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div> 
        <%}%> 


        <!-- Employment contract --> 
        <%
            if (listToSee.equalsIgnoreCase("employmentContract")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employment contract</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Contract date </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Where contract signed</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Relationship of opposite contracting party to job</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Basic salary</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div>
        <%}%>                      



        <!-- Intermediary agent --> 
        <%
            if (listToSee.equalsIgnoreCase("intermediaryAgent")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Intermediary agent</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Agent company name </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Location of agent</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Amount paid to this agent S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Amount owed to this agent at start of work S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>

        </div>  
        <%}%>                      


        <!-- Employer details --> 
        <%
            if (listToSee.equalsIgnoreCase("employerDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employer details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Official name of employer </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Employer address</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Employer phone, email contacts</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Key persons in employer</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>


        </div>  
        <%}%>                      


        <!-- Workplace details  --> 
        <%
            if (listToSee.equalsIgnoreCase("workplaceDetails")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Workplace details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Type of workplace </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Who directed worker to this workplace?</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>When start at workplace?</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>


        </div> 
        <%}%>          

        <!-- Work history  --> 
        <%
            if (listToSee.equalsIgnoreCase("workHistory")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Work history</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>How did worker get into the job defined in Job Profile?  </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date arrived Singapore for this job</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Is this first job in Singapore?</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>If not, year in which worker arrived in Singapore for first job</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>

        </div> 
        <%}%>           

        <!-- Work history  --> 
        <%
            if (listToSee.equalsIgnoreCase("accommodationDuringWork")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Accommodation During Work</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Accommodation provided by employer?  </label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Type of accommodation</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Cost charged by employer per month S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Cost paid by self per month S$</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>

        </div> 
        <%}%>     


        <!-- End of Job Compliment -->

    </body>
</html>
