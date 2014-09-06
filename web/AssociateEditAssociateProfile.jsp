<%-- 
    Document   : AssociateEditAssociateProfile
    Created on : Jul 19, 2014, 9:26:33 AM
    Author     : keemin.chew.2010
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="src.User"%>
<%@page import="src.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--stylesheet-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/associate.css"/>
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/bootstrap.css"/>
        
        <!--jasny-bootstrap v3.1.3-->
        <link rel="stylesheet" href="/TWC2-CaseManagementSystem/stylesheets/jasny-bootstrap.css"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        <!--jQuery validate()-->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-validate-1.12.0.js"></script>

        <!--jasny-bootstrap v3.1.3-->
        <script src="/TWC2-CaseManagementSystem/javascript/jasny-bootstrap.js"></script>  
        <script src="/TWC2-CaseManagementSystem/javascript/holder.js"></script>  
                    
        <style>
            .form-control-associate{
                width:95%;
                margin-left:1%;
            }
        </style>

        <!--javascript-->
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/TWC2-CaseManagementSystem/jquery/jquery-1.11.1.min.js"></script>

        
        
         <script language="javascript">
           
            function onSubmit() {
                document.form1.action = "/TWC2-CaseManagementSystem/AssociateEditAssociateProfileServlet";
            }
            function onLogout() {
                document.location.href = "/TWC2-CaseManagementSystem/LogoutServlet";
            }
          
            
        </script>

        <!--Database-->
           <%
            DBConnect database = new DBConnect();
            DBConnect.connectDB();
            ArrayList<User> userList = new ArrayList<User>();
            userList = database.getUsers();
            //User currentUser = null;

           // to find currently login user
             User loginUser = null;
            try{
               
                for (int i = 0; i < userList.size(); i++) {
                    User user1 = userList.get(i);
                    if (user1.getUsername().equals(request.getSession().getAttribute("username").toString())) {  //Find loginUser by using session user information
                        loginUser = user1;
                    }
                }
            }catch(Exception ex){   
                ex.printStackTrace();
            }


        %> 
        
        <title>AssociateEditAssociateProfile</title>
    </head>
    <body>
        <%-- left side menus--%>
        <table border ="2" class ="leftDivision">
            <tr>
                <td class="containerA" style="height:10%;">
                    <div class="header-associate">
                        <div class="col-xs-5" align="right" >
                            <img src="image/logo_camans_180w.gif" width="100" />
                        </div>  
                        <div class="username-background-associate col-xs-6" style="margin-top:20px;" align="center" >
                            <%
                                if (session.getAttribute("username") != null || session.getAttribute("username") != "") {
                                    String user = (String) request.getSession().getAttribute("username");
                            %>
                            <strong><%=user%></strong>
                            <%
                                }
                            %>
                            </br>
                            <button type="submit" class="btn-logout-associate" name="logout" onclick="onLogout();"><strong>LOGOUT</strong></button>
                        </div>
                       </div><!--end of div header-->
                </td> 
            </tr>
            <tr>
                <td class="containerB" style="height:10%;">

                </td> 
            </tr>
            <tr>
                <td class="containerC" style="height:10%;" >

                </td> 
            </tr>
            <tr>
                <td class="containerD" style="height:10%;text-indent:20px;">
                         <div class="headertitle-associate">EDIT MY PROFILE </div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%; text-indent:10px;">
                    
                    <%    if (loginUser==null){response.sendRedirect("index.jsp"); return;} %>
                       
            
                  <div class="maincontent-associate">
                      <form method="post" name="form1" enctype="multipart/form-data">
                         <%
                         session.setAttribute("NRIC",loginUser.getNRICNum());
                        %>     
                        
                            <div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;margin-left:20px;" align="center">
                            <div class="fileinput-new thumbnail" style="max-width: 150px; max-height: 200px;">
                                <% if (loginUser.getPhoto() != null) {%>  
                                <img style="width:150px;height:200px" src="image/<%=loginUser.getPhoto()%>" align="center"/>
                                <% } else {%> 
                                <img style="width:150px;height:200px" src="image/Tulips.jpg" align="center"/>                                     
                                <% }%> 
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 200px;"></div>
                            <div>
                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="file"></span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                        <div style="float:left">
                               
                            <div class="form-group-associate">
                                <label class="control-label"  for="username">Username</label>
                                <p style="margin-left:10px;" class="form-control-associate" ><%=loginUser.getUsername()%></p>
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="fullName">Full Name</label>
                                <input type="text" value="<%=loginUser.getfullName()%>" class="form-control-associate" style="background-color:yellow;width:70%;margin-left:20px;" name="realname" placeholder="<%=loginUser.getfullName()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="alias">Short Name</label>
                                <input type="text" value="<%=loginUser.getAlias()%>" class="form-control-associate" style="background-color:yellow;width:70%;margin-left:20px;" name="alias" placeholder="<%=loginUser.getAlias()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="FIN">Identification Number(NRIC/FIN)</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getNRICNum()%></p>
                            </div> 
                            <div class="form-group-associate">
                                  <%
                              String gender = loginUser.getGender();

                              String selectedGenderMale="";
                               String selectedGenderFemale="";
                              if (gender.equalsIgnoreCase("M")){
                                  selectedGenderMale="selected";
                                  selectedGenderFemale="";
                              }else if(gender.equalsIgnoreCase("F")){
                                 selectedGenderFemale="selected";
                                  selectedGenderMale="";
                              }
                        
                            %>
                                <label class="control-label" for="Gender" style="width:40%;"> Gender </label>
                            <select class="form-control-associate" name="gender" style="background-color:yellow; width:70%;margin-left:20px;">
                                <option value="M"<%=selectedGenderMale%>>M</option> 
                                <option value="F"<%=selectedGenderFemale%>>F</option>
                            </select>
             
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="ContactNumber"> Contact Number </label>
                                <input type="text" value="<%=loginUser.getMobileNumber()%>" class="form-control-associate" style="background-color:yellow;width:70%;margin-left:20px;" name="contactnumber" placeholder="<%=loginUser.getMobileNumber()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="Email" style="width:40%;"> Email</label>
                                <input type="text" value="<%=loginUser.getEmailAddress() %>" class="form-control-associate" style="background-color:yellow;width:70%;margin-left:20px;" name="email" placeholder="<%=loginUser.getEmailAddress()%>">
                           
                            </div>
                            <div class="form-group-associate">
                                <label class="control-label" for="Position">Role</label>
                                <p style="margin-left:10px;" class="form-control-associate"><%=loginUser.getJobTitle()%> </p>
                            </div>
                            <%  %>
                    
                <% if (session.getAttribute("notificationMsg") != null) {
                            String msg = (String) session.getAttribute("notificationMsg");%>
                                <label class="col-sm-7 control-label" style="color:green;margin-left:10px;"><%=msg%></label> <%}%>
                                <%session.removeAttribute("notificationMsg");%>
                            
                        </div>       
                  </div><!--end of main content-->
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <div class="btn-associate-landscape btn-associate">
                        <button style="margin-left:10px;"  type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE</button>
                 </form>
                        <a type="button" style="margin-left:10px;"  href="AssociateViewAssociateProfile.jsp" class="btn btn-primary btn-large">CANCEL</a>
                        <br><br>
                        <a type="button" style="margin-left:10px;"  href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <!-- <button type="Submit" value="Upload" onclick="onUploadImage()">Upload</button> -->
                  </div>    
                </td> 
            </tr>
        </table>

    </body>
</html>
