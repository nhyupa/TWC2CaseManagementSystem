<%-- 
    Document   : JobComplimentListRecords
    Created on : Aug 5, 2014, 4:59:49 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Compliment List Records</title>
    </head>
    <body>

        <!-- Start of Job Compliement -->

        <% String listToSee = (String) request.getParameter("listToSee");
            if (listToSee == null) {
                listToSee = (String) session.getAttribute("listToSee");
            }
            session.setAttribute("listToSee", listToSee);


        %>

        <!-- Pass details --> 
        <%
            if (listToSee.equalsIgnoreCase("passDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Pass details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Pass type </div>
            <div class="col-md-3" style="font-weight:bold;">Pass number</div>
            <div class="col-md-3" style="font-weight:bold;">Pass issue date</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">pass type <%//currentJob.get %></div>
            <div class="col-md-3">pass number  <%//currentJob.get %></div>
            <div class="col-md-3">pass issue date <%//currentJob.get %></div>
            <div class="col-md-3">date <%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %> 


        <!-- IPA details --> 
        <%
            if (listToSee.equalsIgnoreCase("IPADetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">IPA details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Workpass specified in IPA </div>
            <div class="col-md-3" style="font-weight:bold;">IPA employer name</div>
            <div class="col-md-3" style="font-weight:bold;">IPA basic monthly salary S$</div>
            <div class="col-md-3" style="font-weight:bold;">IPA total deductions S$</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">IPA workpass  <%//currentJob.get %></div>
            <div class="col-md-3">IPA employer name  <%//currentJob.get %></div>
            <div class="col-md-3">IPA basic monthly salary <%//currentJob.get %></div>
            <div class="col-md-3">IPA deduction $ <%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %> 



        <!-- Verbal assurances pre-job --> 
        <%
            if (listToSee.equalsIgnoreCase("verbalAssurances")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Verbal assurances pre-job</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Name of giver of verbal assurances </div>
            <div class="col-md-3" style="font-weight:bold;">Relationship of giver to worker or agent or employer</div>
            <div class="col-md-3" style="font-weight:bold;">When verbal assurances given</div>
            <div class="col-md-3" style="font-weight:bold;">Where verbal assurances given</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">verbal assurance name  <%//currentJob.get %></div>
            <div class="col-md-3">relationship of giver  <%//currentJob.get %></div>
            <div class="col-md-3">when given <%//currentJob.get %></div>
            <div class="col-md-3">where given $ <%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %> 


        <!-- Employment contract --> 
        <%
            if (listToSee.equalsIgnoreCase("employmentContract")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employment contract</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Contract date </div>
            <div class="col-md-3" style="font-weight:bold;">Where contract signed</div>
            <div class="col-md-3" style="font-weight:bold; width:20%">Relationship of opposite contracting party to job</div>
            <div class="col-md-3" style="font-weight:bold;">Basic salary</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">contract date  <%//currentJob.get %></div>
            <div class="col-md-3">where contract signed  <%//currentJob.get %></div>
            <div class="col-md-3">relationship <%//currentJob.get %></div>
            <div class="col-md-3">salary<%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %>                      



        <!-- Intermediary agent --> 
        <%
            if (listToSee.equalsIgnoreCase("intermediaryAgent")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Intermediary agent</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Agent company name </div>
            <div class="col-md-3" style="font-weight:bold;">Location of agent</div>
            <div class="col-md-3" style="font-weight:bold;">Amount paid to this agent S$</div>
            <div class="col-md-3" style="font-weight:bold;">Amount owed to this agent at start of work S$</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">agent name  <%//currentJob.get %></div>
            <div class="col-md-3">agent location  <%//currentJob.get %></div>
            <div class="col-md-3">amount paid <%//currentJob.get %></div>
            <div class="col-md-3">amount owed<%//currentJob.get %></div>

        </div>  
        <%//} 
            }
        %>                      


        <!-- Employer details --> 
        <%
            if (listToSee.equalsIgnoreCase("employerDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Employer details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Official name of employer </div>
            <div class="col-md-3" style="font-weight:bold;">Employer address</div>
            <div class="col-md-3" style="font-weight:bold;">Employer phone, email contacts</div>
            <div class="col-md-3" style="font-weight:bold;">Key persons in employer</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">employer name  <%//currentJob.get %></div>
            <div class="col-md-3">employer address  <%//currentJob.get %></div>
            <div class="col-md-3">employer contact <%//currentJob.get %></div>
            <div class="col-md-3">key employer<%//currentJob.get %></div>

        </div>  
        <%//} 
            }
        %>                      


        <!-- Workplace details  --> 
        <%
            if (listToSee.equalsIgnoreCase("workplaceDetails")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Workplace details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Type of workplace </div>
            <div class="col-md-3" style="font-weight:bold;">Is workplace controlled by employer stated on workpass? If not, who?</div>
            <div class="col-md-3" style="font-weight:bold;">Who directed worker to this workplace?</div>
            <div class="col-md-3" style="font-weight:bold;">When start at workplace?</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">workplace type  <%//currentJob.get %></div>
            <div class="col-md-3">who controlled  <%//currentJob.get %></div>
            <div class="col-md-3">who directed <%//currentJob.get %></div>
            <div class="col-md-3">start date<%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %>          




        <!-- Work history  --> 
        <%
            if (listToSee.equalsIgnoreCase("workHistory")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Work history</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">How did worker get into the job defined in Job Profile? </div>
            <div class="col-md-3" style="font-weight:bold;">Date arrived Singapore for this job</div>
            <div class="col-md-3" style="font-weight:bold;">Is this first job in Singapore?</div>
            <div class="col-md-3" style="font-weight:bold;">If not, year in which worker arrived in Singapore for first job</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">how did worker got job  <%//currentJob.get %></div>
            <div class="col-md-3">date arrived sg <%//currentJob.get %></div>
            <div class="col-md-3">Y <%//currentJob.get %></div>
            <div class="col-md-3">2009<%//currentJob.get %></div>

        </div>  
        <%//} 
            }
        %>           



        <!-- Accommodation during work  --> 
        <%
            if (listToSee.equalsIgnoreCase("accommodationDuringWork")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Accommodation during work</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold;">Accommodation provided by employer?</div>
            <div class="col-md-3" style="font-weight:bold;">Type of accommodation</div>
            <div class="col-md-3" style="font-weight:bold;">Cost charged by employer per month S$</div>
            <div class="col-md-2" style="font-weight:bold;">Cost paid by self per month S$</div>

        </div>
        <!-- 
        for loop get list of Jobs. 
        
        -->
        <%                                //  for (int i = 0; i < joblist.size(); i++) {
            //     Job currentJob= joblist.get(i);

        %>      
        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3">Yes  <%//currentJob.get %></div>
            <div class="col-md-3">accommodation type <%//currentJob.get %></div>
            <div class="col-md-3">cost charged <%//currentJob.get %></div>
            <div class="col-md-2">cost paid<%//currentJob.get %></div>

        </div> 
        <%//} 
            }
        %>           



        <!-- End of Job Compliement -->
    </body>
</html>
