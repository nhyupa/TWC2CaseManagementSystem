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
                        <div class="username-background-associate col-xs-6"style="margin-top:20px;" align="center" >
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
                <td class="containerD" style="height:10%;">
                         <div class="headertitle-associate">EDIT MY PROFILE </div>
                </td> 
            </tr>

            <tr>
                <td class="containerE" style="height:10%;">
                    
                    <%    if (loginUser==null){response.sendRedirect("index.jsp"); return;} %>
                       
            
                  <div class="maincontent-associate">
                      <form method="post" name="form1">
                         <%
                         session.setAttribute("NRIC",loginUser.getNRICNum());
                        %>     
                            <div class="form-group-associate">
                                <label class="control-label" for="username">Username</label>
                                <p class="form-control-associate" ><%=loginUser.getUsername()%></p>
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="fullName">Name</label>
                                <input type="text" value="<%=loginUser.getfullName()%>"class="form-control-associate" style="background-color:yellow;" name="realname" placeholder="<%=loginUser.getfullName()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="alias">Alias</label>
                                <input type="text" value="<%=loginUser.getAlias()%>"class="form-control-associate" style="background-color:yellow;" name="alias" placeholder="<%=loginUser.getAlias()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="FIN">Identification Number(NRIC/FIN)</label>
                                <p class="form-control-associate"><%=loginUser.getNRICNum()%></p>
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
                                <label class="control-label" for="Gender"> Gender </label>
                            <select class="form-control-associate" name="gender" style="background-color:yellow;">
                                <option value="M"<%=selectedGenderMale%>>M</option> 
                                <option value="F"<%=selectedGenderFemale%>>F</option>
                            </select>
             
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="ContactNumber"> Contact Number </label>
                                <input type="text" value="<%=loginUser.getMobileNumber()%>" class="form-control-associate" style="background-color:yellow;" name="contactnumber" placeholder="<%=loginUser.getMobileNumber()%>">
                            </div> 
                            <div class="form-group-associate">
                                <label class="control-label" for="Email"> Email</label>
                                 <p class="form-control-associate" name="email" > <%=loginUser.getEmailAddress()%>
                            </div>
                            <div class="form-group-associate">
                                <label class="control-label" for="Position">Role</label>
                                <p class="form-control-associate"><%=loginUser.getJobTitle()%> </p>
                            </div>
                            <%  %>
                    
                <% if (session.getAttribute("notificationMsg") != null) {
                            String msg = (String) session.getAttribute("notificationMsg");%>
                                <label class="col-sm-7 control-label" style="color:green"><%=msg%></label> <%}%>
                                <%session.removeAttribute("notificationMsg");%>
                            
                  </div><!--end of main content-->
                </td> 
            </tr>


            <tr>
                <td class="containerF" style="height:10%">
                 <div class="btn-associate-landscape btn-associate">
                        <button type="Submit" class="btn btn-primary btn-large" onClick="onSubmit()">SAVE</button>
                 </form>
                        <a type="button" href="AssociateViewAssociateProfile.jsp" class="btn btn-primary btn-large">CANCEL</a>
                        <br><br>
                        <a type="button" href="AssociateWelcome.jsp" class="btn btn-primary btn-large">BACK TO HOMEPAGE</a>
                        <!-- <button type="Submit" value="Upload" onclick="onUploadImage()">Upload</button> -->
                  </div>    
                </td> 
            </tr>
        </table>

    </body>
</html>
