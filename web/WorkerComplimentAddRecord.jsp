<%-- 
    Document   : WorkerComplimentAddRecord
    Created on : Aug 5, 2014, 5:41:10 PM
    Author     : Sion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Compliment Add Record</title>
    </head>
    <body>

        <!-- Start of Worker Compliment -->

        <% String listToSee = (String) session.getAttribute("listToSee");
            //request getAttribute
            // request getParameter
            if (listToSee.equalsIgnoreCase("nickName")) {%>



        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label style="margin:0">Nickname of worker</label>
            <input class="form-control" name="nickName" placeholder="<%//Worker.getNicknam %>" style="left:25px;height:20px;width:30%;">  </input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="country"> </input>
            <label>Passport number</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="passport_number"></input>
            <label>Passport issue</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="passport_issue"></input>
            <label>Passport expiry date</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="passport_expiry_date"></input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;"> </input>
            <label>Face pic 150 x 200 pixels</label>
            <div style="height:10px"> </div>
            <img src ="image/<%//worker.getPhoto()%>" data-src="holder.js/150x200/auto">
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="sgPhoneNumber"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="phoneObsoleteDate"></input>
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="homeCountryPhoneNum"> </input>
            <label>Owner of this number</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="homePhoneNumOwner"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="homeNumObsoleteDate"> </input>   

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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="workerSgAddr"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="workerSgAddrObsoleteDate">  </input>   

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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="homeCountryAddress"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="homeCountryAddrObsoleteDate"> </input>   

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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="digitalContactType"> </input>
            <label>Email/QQ address or other detail</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="emailAddress"> </input>   
            <label>Owner of electronic contact</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="electronicContactOwner"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="electronicContactObsoleteDate"> </input>   

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
            <input class="form-control" placeholder=" <% %>" name ="kinName" style="left:25px;height:20px;width:30%;">  </input>
            <label>Relationship of next of kin to worker</label>
            <input class="form-control" placeholder=" <% %>" name="kinRelationship" style="left:25px;height:20px;width:30%;">  </input>   
            <label>Phone number of next of kin</label>
            <input class="form-control" placeholder=" <% %>" name="kinPhoneNum" style="left:25px;height:20px;width:30%;">  </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" name="obsoleteDate" style="left:25px;height:20px;width:30%;">  </input>   
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="familyMemberName">  </input>
            <label>Relationship of family member to worker</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="familyMemberRelationship"> </input>   
            <label>Phone number of family member</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="familyMemberPhoneNumber">  </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="FamilyMemberDateObsolete">  </input>   
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
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="friendName"> </input>
            <label>Phone number of friend</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="friendPhone"> </input>   
            <label>Relationship to worker</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="workerRelationship">  </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" style="left:25px;height:20px;width:30%;" name="obsoleteDate">  </input>   


        </div> 
        <%}%> 



        <!-- Worker's language --> 
        <%
            if (listToSee.equalsIgnoreCase("workersLanguage")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-10">

            <label>Worker's main language</label>
            <input class="form-control" placeholder=" <% %>" name="workerMainLanguage" style="left:25px;height:20px;width:30%;">  </input>
            <label>Explain if above is 'Other'</label>
            <input class="form-control" placeholder=" <% %>" name="otherLanaguage" style="left:25px;height:20px;width:30%;"> </input>   
            <label>Spoken English standard</label>
            <input class="form-control" placeholder=" <% %>" name="spokenEnglishStandard" style="left:25px;height:20px;width:30%;"> </input>

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
            <input class="form-control" placeholder=" <% %>" name="bankAccName" style="left:25px;height:20px;width:30%;">  </input>
            <label>Bank account number</label>
            <input class="form-control" placeholder=" <% %>" name="bankAccNumber" style="left:25px;height:20px;width:30%;"> </input>   
            <label>Bank name</label>
            <input class="form-control" placeholder=" <% %>" name="bankName" style="left:25px;height:20px;width:30%;"> </input>
            <label>Date discovered to be obsolete</label>
            <input class="form-control" placeholder=" <% %>" name="bankObsoleteDate" style="left:25px;height:20px;width:30%;">  </input>
        </div> 
        <%}%> 

        <!-- End of Worker Compliement -->
    </body>
</html>
