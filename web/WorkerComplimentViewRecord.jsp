<%-- 
    Document   : WorkerComplimentViewRecord
    Created on : Aug 5, 2014, 5:22:44 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Compliment View Record</title>
    </head>
    <body>

        <% String listToSee = (String) session.getAttribute("listToSee");%>
        <% if (listToSee.equalsIgnoreCase("nickName")) {%>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label style="margin:0">Nickname of worker</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <%//Worker.getNicknam %> </p>
        </div>

        <%}%> 



        <!-- passport Details --> 
        <%
            if (listToSee.equalsIgnoreCase("passportDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Passport details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Passport country</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportCountry")%> </p>
            <label>Passport number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportNumber")%> </p>
            <label>Passport issue</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportIssue")%> </p>
            <label>Passport expiry date</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <%=session.getAttribute("passportExpiryDate")%> </p>
        </div>
        <% }%>


        <!-- Face Photo --> 
        <%
            if (listToSee.equalsIgnoreCase("facePhoto")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Face photo</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">
            <label>Date stamp</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% //Worker.getDate%> </p>
            <label>Face pic 150 x 200 pixels</label>
            <div style="height:10px"> </div>
            <img src ="image/<%//worker.getPhoto()%>" data-src="/javascript/holder.js/150x200/auto">
        </div> 
        <%}
        %>                    


        <!-- Sg phone number --> 
        <%
            if (listToSee.equalsIgnoreCase("sgPhoneNumber")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Sg phone number</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">
            <label>Sg phone number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div>  
        <%}
        %> 


        <!-- Home ctry phone number --> 
        <%
            if (listToSee.equalsIgnoreCase("homeCountryPhoneNumber")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country phone number</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">
            <label>Home country phone number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Owner of this number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   

        </div> 
        <%}%> 

        <!-- Worker's Sg address --> 
        <%
            if (listToSee.equalsIgnoreCase("sgAddress")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's Singapore address</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">


            <label>Worker address in Singapore</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   

        </div> 

        <%}%> 



        <!-- Home ctry address --> 
        <%
            if (listToSee.equalsIgnoreCase("homeCountryAddress")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country address</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">
            <label>Worker address in home country</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   

        </div> 
        <%}%> 


        <!-- Worker's digital contacts --> 
        <%
            if (listToSee.equalsIgnoreCase("workersDigitalContacts")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's digital contacts</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Type of digital contact</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Email/QQ address or other detail</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Owner of electronic contact</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   

        </div>
        <%}%> 




        <!-- Next of kin --> 
        <%
            if (listToSee.equalsIgnoreCase("nextOfKin")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Next of kin</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">


            <label>Name of next of kin</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Relationship of next of kin to worker</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Phone number of next of kin</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
        </div>
        <%}%> 





        <!-- Family member --> 
        <%
            if (listToSee.equalsIgnoreCase("familyMember")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Family member</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Name of family member</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Relationship of family member to worker</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Phone number of family member</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
        </div> 

        <%}%> 



        <!-- Friend in Singapore --> 
        <%
            if (listToSee.equalsIgnoreCase("friendInSingapore")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Friend in Singapore</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Name of friend in Singapore</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Phone number of friend</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Relationship to worker</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   


        </div> -->
        <%}%> 



        <!-- Worker's language --> 
        <%
            if (listToSee.equalsIgnoreCase("workersLanguage")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Worker's main language</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Explain if above is 'Other'</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Spoken English standard</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>

        </div> 
        <%}%> 


        <!-- Bank account details --> 
        <%
            if (listToSee.equalsIgnoreCase("bankAccountDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Bank account details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Bank account name</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Bank account number</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>   
            <label>Bank name</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
            <label>Date discovered to be obsolete</label>
            <p class="form-control" style="left:25px;height:30px;width:30%;"> <% %> </p>
        </div> 
        <%}%> 

        <!-- End of Worker Compliement -->
    </body>
</html>
