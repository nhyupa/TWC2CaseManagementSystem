<%-- 
    Document   : JobComplimentAddRecord
    Created on : Aug 5, 2014, 6:24:27 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Compliment Add Record</title>
    </head>
    <body>
        <% String listToSee = (String) session.getAttribute("listToSee");%>

        <!-- Start of Job Compliement -->


        <!-- Pass details --> 
        <%
            if (listToSee.equalsIgnoreCase("passDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Pass details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Pass type</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Pass number</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
            <label>Pass issue date</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>IPA employer name</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>IPA basic monthly salary S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>IPA total deductions S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Relationship of giver to worker or agent or employer</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>When verbal assurances given</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Where verbal assurances given</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Where contract signed</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Relationship of opposite contracting party to job</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Basic salary</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Location of agent</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Amount paid to this agent S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Amount owed to this agent at start of work S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>

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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Employer address</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Employer phone, email contacts</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Key persons in employer</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>


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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>
            <label>Is workplace controlled by employer stated on workpass? If not, who?</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>   
            <label>Who directed worker to this workplace?</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>When start at workplace?</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"></input>


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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Date arrived Singapore for this job</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Is this first job in Singapore?</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>If not, year in which worker arrived in Singapore for first job</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>

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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Type of accommodation</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Cost charged by employer per month S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>
            <label>Cost paid by self per month S$</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;">  </input>

        </div> 
        <%}%>     


        <!-- End of Job Compliment -->
    </body>
</html>
