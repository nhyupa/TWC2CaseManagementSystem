<%-- 
    Document   : WorkerComplimentListRecords
    Created on : Aug 5, 2014, 4:50:51 PM
    Author     : Sion
--%>

<%@page import="src.FamilyDetails"%>
<%@page import="src.LanguageDetails"%>
<%@page import="src.WorkerPhoto"%>
<%@page import="src.Passport"%>
<%@page import="src.ContactDetails"%>
<%@page import="src.KinDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Worker Compliment List Records</title>
    </head>
    <body>
        <%
            // retrieve users from database    
            // ArrayList<Job> jobList = new ArrayList<Job>();
            DBConnect dbConnect = new DBConnect();
            dbConnect.connectDB();

            String FIN = (String) session.getAttribute("FIN");
            String workerName = DBConnect.getWorkername((String) session.getAttribute("FIN"));
            String phoneNumber = null;

            // get lsit of workers
            /**
             * Get Worker Nicknames
             */
            ArrayList<String> workerNicknames = DBConnect.retrieveWorkerNicknames((String) session.getAttribute("FIN"));

            /**
             * Get Latest Photo & DateStamp of photo for Worker
             */
            ArrayList<WorkerPhoto> photos = DBConnect.retrieveWorkerPhotos(FIN);

            /**
             * Get Passport Details *
             */
            ArrayList<Passport> passportDetails = DBConnect.retrieveWorkerPassportDetails(FIN);

            /**
             * Get Contact Details *
             */
            ArrayList<ContactDetails> contactDetails = DBConnect.retrieveWorkerContactDetails(FIN);

            /**
             * Get Kin Details *
             */
            ArrayList<KinDetails> kinDetails = DBConnect.retrieveKinDetails(FIN);

            /**
             * Get Language Details *
             */
            ArrayList<LanguageDetails> languageDetails = DBConnect.retrieveLanguageDetails(FIN);

            /**
             * Get Family Details *
             */
            ArrayList<FamilyDetails> familyDetails = DBConnect.retrieveFamilyWorkerDetails(FIN);
        %>

        <!-- Start of Worker Compliment -->



        <% String listToSee = (String) request.getParameter("listToSee");
            if (listToSee == null) {
                listToSee = (String) session.getAttribute("listToSee");
            }
            session.setAttribute("listToSee", listToSee);

            if (listToSee.equalsIgnoreCase("nickName")) {

        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Nick name</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold; width:100%">Nickname of worker</div>
        </div>                            
        <!-- 
        for loop get list of workers. 
        -->
        <%
            for (int i = 0; i < workerNicknames.size(); i++) {

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="nickName"></div>
            <div class="col-md-3"><%=workerNicknames.get(i)%></div>

        </div>
        <%//} 
                }
            }
        %> 

        <% if (session.getAttribute("nickNameMsg") != null) {
                                     String nickNameSuccessMsg = (String) session.getAttribute("nickNameMsg");%>
        <label style="color:green"><br/><%=nickNameSuccessMsg%></label> <%}%>
            <%session.removeAttribute("nickNameMsg");%>

        <!-- passport Details --> 
        <%
            if (listToSee.equalsIgnoreCase("passportDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Passport details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Passport country</div>
            <div class="col-md-2" style="font-weight:bold;">Passport number</div>
            <div class="col-md-2" style="font-weight:bold;">Passport issue</div>
            <div class="col-md-2" style="font-weight:bold;">Passport expiry date</div>
        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%  for (int i = 0; i < passportDetails.size(); i++) {
                Passport currentPassport = passportDetails.get(i);
                String passportIssueDate = currentPassport.getPassportIssueDate();
                String passportExpiryDate = currentPassport.getPassportExpiryDate();

                String formattedPassportIssueDate = passportIssueDate.substring(0, 10);
                String formattedPassportExpiryDate = passportExpiryDate.substring(0, 10);
        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2"><%=currentPassport.getCountry()%></div>
            <div class="col-md-2"><%=currentPassport.getPassportNumber()%></div>
            <div class="col-md-2"><%=formattedPassportIssueDate%></div>
            <div class="col-md-2"><%=formattedPassportExpiryDate%></div>
        </div>  
        <%}
            }
        %> 


        <!-- Face Photo --> 
        <%
            if (listToSee.equalsIgnoreCase("facePhoto")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Face photo</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Date stamp</div>
            <div class="col-md-3" style="font-weight:bold;">Face pic 150 x 200 pixels</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%
            out.println(photos.size());
            for (int i = 0; i < photos.size(); i++) {
                WorkerPhoto photo = photos.get(i);


        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2"><%=photo.getDateStamp()%></div>

            <div class="thumbnail col-md-2" style="width: 150px; height: 100px;"><img src ="image/<%=photo.getPhotoName()%>"></div>
        </div> 
        <%//} 
                }
            }

        %>                    

        <!-- Sg phone number --> 
        <%
            if (listToSee.equalsIgnoreCase("sgPhoneNumber")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Sg phone number</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Sg phone number</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%  for (int i = 0; i < contactDetails.size(); i++) {
                ContactDetails currentContactDetail = contactDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3"><%=currentContactDetail.getSgPhoneNumber()%></div>
            <div class="col-md-3"><%=currentContactDetail.getSgPhoneObsoleteDate()%></div>
        </div> 
        <%}
            }
        %> 


        <!-- Home ctry phone number --> 
        <%
            if (listToSee.equalsIgnoreCase("homeCountryPhoneNumber")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country phone number</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold;">Home country phone number</div>
            <div class="col-md-3" style="font-weight:bold;">Owner of this number</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%  for (int i = 0; i < contactDetails.size(); i++) {
                ContactDetails contactDetail = contactDetails.get(i);
                String homePhoneObsolete = contactDetail.getHomePhoneObsolete();
                String formattedHomePhoneObsolete = homePhoneObsolete.substring(0, 10);
        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3"><%=contactDetail.getHomeCountryTelephoneNumber()%></div>
            <div class="col-md-3"><%=contactDetail.getOwnerOfNumber()%></div>
            <div class="col-md-3"><%=formattedHomePhoneObsolete%></div>
        </div> 
        <%}
            }
        %> 

        <!-- Worker's Sg address --> 
        <%
            if (listToSee.equalsIgnoreCase("sgAddress")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's Singapore address</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold;">Worker address in Singapore</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%    for (int i = 0; i < contactDetails.size(); i++) {
                ContactDetails contactDetail = contactDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3"><%=contactDetail.getSgHomeAddress()%></div>
            <div class="col-md-3"><%=contactDetail.getSgHomeAddressObsoleteDate()%></div>
        </div> 
        <%}
            }
        %> 



        <!-- Home ctry address --> 
        <%
            if (listToSee.equalsIgnoreCase("homeCountryAddress")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Home country address</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold;">Worker address in home country</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <% for (int i = 0; i < contactDetails.size(); i++) {
                ContactDetails contactDetail = contactDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3">Home country Address <%=contactDetail.getHomeAddress()%></div>
            <div class="col-md-3">Date <%=contactDetail.getHomeAddressObsoleteDate()%></div>
        </div> 
        <%}
            }
        %> 


        <!-- Worker's digital contacts --> 
        <%
            if (listToSee.equalsIgnoreCase("workersDigitalContacts")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's digital contacts</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Type of digital contact </div>
            <div class="col-md-3" style="font-weight:bold;">Email/QQ address or other detail</div>
            <div class="col-md-3" style="font-weight:bold;">Owner of electronic contact</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%                                //  for (int i = 0; i < workerlist.size(); i++) {
            //     Worker currentWorker= workerlist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">Digital contact type <%//Worker.get %></div>
            <div class="col-md-3">eqmil or other details <%//Worker.get %></div>
            <div class="col-md-3">owner of contact <%//Worker.get %></div>
            <div class="col-md-3">Date <%//Worker.get %></div>
        </div> 
        <%//} 
            }
        %> 




        <!-- Next of kin --> 
        <%
            if (listToSee.equalsIgnoreCase("nextOfKin")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Next of kin</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Name of next of kin </div>
            <div class="col-md-3" style="font-weight:bold;">Relationship of next of kin to worker</div>
            <div class="col-md-3" style="font-weight:bold;">Phone number of next of kin</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%

            for (int i = 0; i < kinDetails.size(); i++) {
                KinDetails kinDetail = kinDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2"><%=kinDetail.getKinName()%></div>
            <div class="col-md-3"><%=kinDetail.getKinRelationship()%></div>
            <div class="col-md-3"><%=kinDetail.getKinPhone()%></div>
            <div class="col-md-3"><%=kinDetail.getKinObsoleteDate()%></div>
        </div> 
        <%}
            }
        %> 





        <!-- Family member --> 
        <%
            if (listToSee.equalsIgnoreCase("familyMember")) {
        %>

        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Family member</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Name of family member </div>
            <div class="col-md-3" style="font-weight:bold;">Relationship of family member to worker</div>
            <div class="col-md-3" style="font-weight:bold;">Phone number of family member</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%  for (int i = 0; i < familyDetails.size(); i++) {
                FamilyDetails familyDetail = familyDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2"><%=familyDetail.getFamilyMemberName()%></div>
            <div class="col-md-3"><%=familyDetail.getFamilyMemberRelationship()%></div>
            <div class="col-md-3"><%=familyDetail.getFamilyMemberPhoneNumber()%></div>
            <div class="col-md-3"><%=familyDetail.getFamilyMemberObsolete()%></div>
        </div> 

        <% }
            }
        %> 



        <!-- Friend in Singapore --> 
        <%
            if (listToSee.equalsIgnoreCase("friendInSingapore")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Friend in Singapore</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Name of friend in Singapore </div>
            <div class="col-md-3" style="font-weight:bold;">Phone number of friend</div>
            <div class="col-md-3" style="font-weight:bold;">Relationship to worker</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%                                //  for (int i = 0; i < workerlist.size(); i++) {
            //     Worker currentWorker= workerlist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">friend name <%//Worker.get %></div>
            <div class="col-md-3">friend relationship  <%//Worker.get %></div>
            <div class="col-md-3">friend phonenumber <%//Worker.get %></div>
            <div class="col-md-3">Date <%//Worker.get %></div>
        </div> 
        <%//} 
            }
        %> 



        <!-- Worker's language --> 
        <%
            if (listToSee.equalsIgnoreCase("workersLanguage")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Worker's language</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-3" style="font-weight:bold;">Worker's main language </div>
            <div class="col-md-3" style="font-weight:bold;">Explain if above is 'Other'</div>
            <div class="col-md-3" style="font-weight:bold;">Spoken English standard</div>
        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <% for (int i = 0; i < languageDetails.size(); i++) {
                LanguageDetails languageDetail = languageDetails.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-3"><%=languageDetail.getWorkerMainLanguage()%></div>
            <div class="col-md-3"></div>
            <div class="col-md-3"><%=languageDetail.getSpokenEnglishStandard()%></div>
        </div> 
        <%}
            }
        %> 


        <!-- Bank account details --> 
        <%
            if (listToSee.equalsIgnoreCase("bankAccountDetails")) {
        %>
        <div style="font-weight:bold;font-size:16px; margin-left:10px;">Bank account details</div>
        <div style="height:10px;"></div>
        <div class="row1 col-md-12" style="border-top:1px solid; border-bottom: 1px solid;">
            <div class="col-md-1"></div>
            <div class="col-md-2" style="font-weight:bold;">Bank account name </div>
            <div class="col-md-3" style="font-weight:bold;">Bank account number</div>
            <div class="col-md-3" style="font-weight:bold;">Bank name</div>
            <div class="col-md-3" style="font-weight:bold;">Date discovered to be obsolete</div>

        </div>
        <!-- 
        for loop get list of workers. 
        
        -->
        <%                                //  for (int i = 0; i < workerlist.size(); i++) {
            //     Worker currentWorker= workerlist.get(i);

        %>      

        <div class="row2 col-md-12">
            <div class="col-md-1"><input type="radio" name="selectoption"></div>
            <div class="col-md-2">account name <%//Worker.get %></div>
            <div class="col-md-3">account number  <%//Worker.get %></div>
            <div class="col-md-3">bank name <%//Worker.get %></div>
            <div class="col-md-3">date <%//Worker.get %></div>

        </div> 
        <%//} 
            }
        %> 




        <!-- End of Worker Compliement -->

    </body>
</html>
