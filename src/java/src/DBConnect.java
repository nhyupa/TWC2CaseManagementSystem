/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;
/**
 *
 * @author nhyupa.2010
 */
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import javax.imageio.ImageIO;

public class DBConnect {
    private static Connection dbConnection;
    private static Statement statement;
    private static ResultSet rs;
    private ArrayList<String> usernames = new ArrayList<String>();
    private ArrayList<String> passwords = new ArrayList<String>();
    
    private ArrayList<User> users = new ArrayList<User>();
    private ArrayList<Worker> workers = new ArrayList<Worker>();
    private ArrayList<JobProfile> jobs = new ArrayList<JobProfile>();
    private ArrayList<ChiefProblem> problems = new ArrayList<ChiefProblem>();
    
    
    //Testing Purpose
    private static ArrayList<Blob> images = new ArrayList<Blob>();
    //private static ArrayList<String> roles = new ArrayList<String>();
    private static int numOfUsers = 0;
    private static int numOfJobs = 0;
    private static String userEmailAddress = null;
    private static String existingPassword = null;
    private static String FIN = null;
    private static String password = null;
    private static String employer = null;
    
    private static ByteArrayOutputStream baos = null;
    ;
    
    public static void connectDB() {
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            //dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TWC2DB","root","pqRT:@88z3");
            dbConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TWC2DB","root","password");
            statement = dbConnection.createStatement();
            
        }catch(Exception err){
            System.out.println("Error" + err);
        }
    }
    
    public static boolean dbConnection() {
        
        boolean dbConnectionState = true;
        try{
            
            if(dbConnection != null) {
                return dbConnectionState;
            }else {
                dbConnectionState = false;
                return dbConnectionState;
            }
            
        } catch(Exception err) {
            System.out.println("Error" + err);
        }
        return dbConnectionState;
    }
    
    public static ResultSet executeQuery(String sqlQuery){
        try{
            boolean dbConnectionState = dbConnection();
            if(dbConnectionState == false) {
                System.out.println("Database is not connected!");
                return null;
            }
            rs = statement.executeQuery(sqlQuery);
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        return rs;
    }
    /**
     *
     * Under Construction
     *
     */
    public static int executeUpdate(String sql){
        
        PreparedStatement dbStatement = null;
        try{
            dbStatement = dbConnection.prepareStatement(sql);
            return dbStatement.executeUpdate(sql);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
        return 0;
    }
    
    public static User getUser(String FIN){
        
        User user = null;
        try{
            String query = "Select * from tbl_user where NRIC_No ='" + FIN + "';";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                
                String fullName = rs.getString("Full_Name");
                String alias = rs.getString("Alias");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String emailAddress = rs.getString("Email_Address");
                String mobileNumber = rs.getString("Phone_Number");
                String gender = rs.getString("gender");
                String jobTitle = rs.getString("Job_Title");
                String photoName = rs.getString("Photo");
                
                
                User newUser = new User(FIN,  fullName, alias, username,  password,  emailAddress,  mobileNumber,  gender,  jobTitle,photoName);
                user = newUser;
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return user;
        
        
        
    }
    public static void updatePassword(String username, String password) {
        
        try{
            String sqlQuery = "Update tbl_user " + "SET Password ='"+ password+"' where Username = '"+username+"'";
            executeUpdate(sqlQuery);
        } catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
    }
    
    public static void updateRole(String jobPosition,String NRIC_Num) {
        try{
            String sqlQuery = "Update tbl_user " + "SET Job_Title = '" + jobPosition + "' where NRIC_No = '" + NRIC_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateUsername(String username,String NRIC_Num) {
        try{
            String sqlQuery = "Update tbl_user " + "SET Username ='" + username + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateRealname(String realname,String NRIC_Num) {
        try{
            String sqlQuery = "Update tbl_user " + "SET Full_Name ='" + realname + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateJobPosition(String jobPosition,String NRIC_Num) {
        try{
            String sqlQuery = "Update tbl_user " + "SET Job_Title ='" + jobPosition + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateContactNumber(String contactNumber,String NRIC_Num){
        try{
            String sqlQuery = "Update tbl_user " + "SET Phone_Number ='" + contactNumber + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateAlias(String alias,String NRIC_Num){
        try{
            String sqlQuery = "Update tbl_user " + "SET Alias ='" + alias + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateEmail(String email,String NRIC_Num){
        try{
            String sqlQuery = "Update tbl_user " + "SET Email_Address ='" + email + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updateUserGender(String gender,String NRIC_Num){
        try{
            String sqlQuery = "Update tbl_user " + "SET Gender ='" + gender + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void updatePhoto(String itemName, String NRIC_Num) {
        try{
            String sqlQuery = "Update tbl_user " + "SET Photo ='" + itemName + "' where NRIC_No = '" + NRIC_Num +"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    /** Edit Worker **/
    public static void updateDateOfBirth(String FIN_Num, String dateOfBirth){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET DateofBirth = '" + dateOfBirth + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateWorkerRegDate(String FIN_Num, String workerRegistrationDate){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Worker_Registration_Date = '" + workerRegistrationDate + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void updateCreatedBy(String FIN_Num, String createdBy){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Created_By = '" + createdBy + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void updateCreatedFor(String FIN_Num, String createdFor){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Create_For = '" + createdFor + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void updateWorkerName(String FIN_Num, String workerName){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Name_of_Worker = '" + workerName + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateGender(String FIN_Num, String gender){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Gender = '" + gender + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void updateNationality(String FIN_Num, String nationality){
        try{
            String sqlQuery = "Update tbl_worker "  + "SET Nationality = '" + nationality + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateEmployerName(String FIN_Num, String employerName){
        try{
            String sqlQuery = "Update tbl_job "  + "SET Employer_Name = '" + employerName + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateWorkpassType(String FIN_Num,String workpassType){
        try{
            String sqlQuery = "Update tbl_job "  + "SET Workpass_Type = '" + workpassType + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateJobSector(String FIN_Num,String jobSector){
        try{
            String sqlQuery = "Update tbl_job "  + "SET Job_Sector = '" + jobSector + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateOccupation(String FIN_Num,String occupation){
        try{
            String sqlQuery = "Update tbl_job Set Occupation = '" + occupation + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updatejobCommencedDate(String FIN_Num,String jobCommencedDate){
        try{
            String sqlQuery = "Update tbl_job Set Job_Start_Date = '" + jobCommencedDate + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updatejobEndDate(String FIN_Num, String jobEndDate){
        try{
            String sqlQuery = "Update tbl_job Set Job_End_Date = '" + jobEndDate + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error ; " + err);
        }
    }
    
    public static void updateTJS(String FIN_Num, String TJS){
        try{
            String sqlQuery = "Update tbl_job Set Job_Whether_TJS = '" + TJS + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error ; " + err);
        }
    }
    
    public static void updateJobRemarks(String FIN_Num, String remarks){
        try{
            String sqlQuery = "Update tbl_job" + " Set Job_Remarks = '" + remarks + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    /** Problem Update **/
    public static void updateProblemRegistrationDate(String FIN_Num, String probRegDate){
        try{
            String sqlQuery = "Update tbl_problem" + " Set Chief_Problem_Date = '" + probRegDate + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateChiefProblem(String FIN_Num, String chiefProblem){
        try{
            String sqlQuery = "Update tbl_problem" + " Set Chief_Problem = '" + chiefProblem + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateChiefProblemMore(String FIN_Num, String chiefProblemMore){
        try{
            String sqlQuery = "Update tbl_problem" + " Set Chief_Problem_More = '" + chiefProblemMore + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updateChiefProblemRemarks(String FIN_Num, String chiefProblemRemarks){
        try{
            String sqlQuery = "Update tbl_problem" + " Set Chief_Problem_Remarks = '" + chiefProblemRemarks + "' where FIN_Number ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void createUser(User user) {
        try{
            String NRIC_No = user.getNRICNum();
            String fullName = user.getfullName();
            String alias = user.getAlias();
            String userName = user.getUsername();
            String password = user.getPassword();
            String emailAddress = user.getEmailAddress();
            String mobileNumber = user.getMobileNumber();
            String gender = user.getGender();
            String jobTitle = user.getJobTitle();
            String photo = user.getPhoto();
            
            String sqlQuery = "Insert into tbl_user(NRIC_No,Full_Name,Alias,Username,Password,Email_Address,Phone_Number,Gender,Job_Title,Photo) Values ('" + NRIC_No + "','" + fullName + "','" + alias + "','" + userName + "','" + password + "','" + emailAddress + "','" + mobileNumber + "','" + gender + "','" + jobTitle + "','" + photo +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error" + err);
        }
    }
    
    public static int countUsers() {
        
        try {
            
            String sqlQuery = "Select Count(*) from tbl_user";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                numOfUsers++;
            }
            return numOfUsers;
            
        }catch(Exception err) {
            System.out.println("Error " + err);
        }
        return numOfUsers;
    }
    
    public static int countJobs() {
        
        try {
            
            String sqlQuery = "Select Count(*) from tbl_job";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                numOfJobs++;
            }
            return numOfJobs;
            
        }catch(Exception err) {
            System.out.println("Error " + err);
        }
        return numOfJobs;
    }
    
    public static String retrievePassword(String username) {
        try{
            String sqlQuery = "Select * from tbl_user where Username = '" + username +"'";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                existingPassword = rs.getString("Password");
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return existingPassword;
    }
    
    /** Problems **/
    public static ArrayList<ChiefProblem> retrieveProblems(String FIN, String jobKey) {
        ArrayList<ChiefProblem> problems = new ArrayList<ChiefProblem>();
        try{
            String sqlQuery = "Select * from tbl_problem where Worker_FIN_Number = '" + FIN + "' AND JobKey ='" + jobKey  +"';";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String chiefProblemDate = rs.getString("Chief_Problem_Date");
                String chiefProblemName = rs.getString("Chief_Problem");
                
                ChiefProblem chiefProblem = new ChiefProblem(chiefProblemDate,chiefProblemName,FIN);
                problems.add(chiefProblem);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return problems;
    }
    
    
    
    public static String retrieveEmailAddress(String username) {
        
        try{
            String sqlQuery = "Select * from tbl_user where Username = '" + username +"'";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                userEmailAddress = rs.getString("Email_Address");
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return userEmailAddress;
    }
    
    public static String getFIN(String username) {
        try{
            String sqlQuery = "Select * from tbl_user where Username = '" + username + "'";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                FIN = rs.getString("NRIC_No");
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return FIN;
    }
    
    public static String getPassword(String FIN) {
        try{
            String sqlQuery = "Select * from tbl_user where Username = '" + FIN + "'";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                password = rs.getString("Password");
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return password;
    }
    
    public ArrayList getUsernames(){
        try{
            String sqlQuery = "Select * from tbl_user";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String user = rs.getString("Username");
                usernames.add(user);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return usernames;
    }
    
    public static ArrayList getRoles() {
        
        ArrayList<String> roles = new ArrayList<String>();
        try{
            String sqlQuery = "Select * from tbl_roles";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String role = rs.getString("Role");
                roles.add(role);
            }
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
        return roles;
    }
    
    
    
    public ArrayList getPasswords() {
        try{
            String sqlQuery = "Select * from tbl_user";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String password = rs.getString("Password");
                passwords.add(password);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        return passwords;
    }
    
    public void getData(){
        try{
            
            String query = "select * from users";
            rs = statement.executeQuery(query);
            while(rs.next()){
                String userid =rs.getString("userid");
                String password=rs.getString("password");
                
                System.out.println(userid);
                System.out.println(password);
            }
            
        }catch(Exception err){
            System.out.println("Error" + err);
        }
    }
    
    public ArrayList<User> getUsers() {
        try{
            String query = "Select * from tbl_user";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN = rs.getString("NRIC_No");
                String fullName = rs.getString("Full_Name");
                String alias = rs.getString("Alias");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String emailAddress = rs.getString("Email_Address");
                String mobileNumber = rs.getString("Phone_Number");
                String gender = rs.getString("gender");
                String jobTitle = rs.getString("Job_Title");
                String photoName = rs.getString("Photo");
                
                
                User newUser = new User(FIN,  fullName, alias, username,  password,  emailAddress,  mobileNumber,  gender,  jobTitle,photoName);
                users.add(newUser);
            }
            return users;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return users;
        
    }
    
    public static ArrayList<User> retrieveUsers() {
        DBConnect.connectDB();
        ArrayList<User> users = new ArrayList<User>();
        try{
            String query = "Select * from tbl_user";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN = rs.getString("NRIC_No");
                String fullName = rs.getString("Full_Name");
                String alias = rs.getString("Alias");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                String emailAddress = rs.getString("Email_Address");
                String mobileNumber = rs.getString("Phone_Number");
                String gender = rs.getString("gender");
                String jobTitle = rs.getString("Job_Title");
                String photoName = rs.getString("Photo");
                
                
                User newUser = new User(FIN,  fullName, alias,  username,  password,  emailAddress,  mobileNumber,  gender,  jobTitle,photoName);
                users.add(newUser);
            }
            return users;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return users;
        
    }
    
    /** Display users alphabetically **/
    public static ArrayList<String> retrieveSortedRealNames(ArrayList<User> users){
        
        
        ArrayList<String> realNames = new ArrayList<String>();
        
        for(int i = 0 ; i < users.size(); i++){
            User user = users.get(i);
            String realName = user.getfullName();
            realNames.add(realName);
        }
        
        Collections.sort(realNames, new Comparator<String>() {
            @Override
            public int compare(String s1, String s2) {
                return s1.compareToIgnoreCase(s2);
            }
        });
        return realNames;
    }
    
    public static ArrayList<User> retrieveSortedUsers(ArrayList<User> users,ArrayList<String> realNames){
        ArrayList<User> sortedUserList = new ArrayList<User>();
        for(int i = 0; i < realNames.size();i++){
            
            String sortedUsername = realNames.get(i);
            for(int j = 0 ; j < users.size(); j++){
                User user = users.get(j);
                String realName = user.getfullName();
                
                if(realName.equalsIgnoreCase(sortedUsername)){
                    sortedUserList.add(user);
                }
            }
        }
        return sortedUserList;
    }
    public  ArrayList<Worker> getWorkers() {
        try{
            
            String query = "Select * from tbl_worker";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                String workerRegDate = rs.getString("Worker_Registration_Date");
                String createFor = rs.getString("Create_For");
                String createdBy = rs.getString("Created_By");
                String workerName = rs.getString("Name_of_Worker");
                String gender = rs.getString("Gender");
                String nationality = rs.getString("Nationality");
                String otherNationality = rs.getString("NationalityMore");
                String dateOfBirth = rs.getString("DateofBirth");
                
                Worker worker = new Worker(FIN_Number, workerRegDate, createdBy,createFor,workerName,gender,nationality,otherNationality,dateOfBirth);
                workers.add(worker);
            }
            return workers;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workers;
    }
    
    public ArrayList<ChiefProblem> getProblems() {
        try{
            
            String query = "Select * from tbl_problem";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String entryDate = rs.getString("EntryDate");
                String workerFinNumber = rs.getString("Worker_FIN_Number");
                String jobKey = rs.getString("JobKey");
                String probKey = rs.getString("ProbKey");
                String chiefProlbemDate = rs.getString("Chief_Problem_Date");
                String chiefProblem = rs.getString("Chief_Problem");
                String chiefProblemMore = rs.getString("Chief_Problem_More");
                String chiefProblemRemarks = rs.getString("Chief_Problem_Remarks");
                
                ChiefProblem chiefProblem2 = new ChiefProblem(chiefProlbemDate,chiefProblem, chiefProblemMore,chiefProblemRemarks,workerFinNumber,jobKey,probKey);
                problems.add(chiefProblem2);
            }
            return problems;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return problems;
    }
    public ArrayList<JobProfile> getJobs() {
        try{
            
            String query = "Select * from tbl_job";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("Worker_FIN_Number");
                String JobKey = rs.getString("JobKey");
                String employerName = rs.getString("Employer_Name");
                String workpassType = rs.getString("Workpass_Type");
                String workpassMore = rs.getString("Workpass_More");
                String jobSector = rs.getString("Job_Sector");
                String jobSectorMore = rs.getString("Job_Sector_More");
                String occupation = rs.getString("Occupation");
                String jobStartDate = rs.getString("Job_Start_Date");
                String jobEndDate = rs.getString("Job_End_Date");
                String jobWhetherTJS = rs.getString("Job_Whether_TJS");
                String jobRemarks = rs.getString("Job_Remarks");
                JobProfile jobProfile = new JobProfile(FIN_Number,JobKey,employerName,workpassType,workpassMore,jobSector,jobSectorMore,occupation,jobStartDate,jobEndDate,jobWhetherTJS,jobRemarks);
                jobs.add(jobProfile);
            }
            return jobs;
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return jobs;
    }
    
    
    /** May be subjected to change **/
    public static String getEmployer(String FIN) {
        try{
            String query =  "Select Employer_Name from tbl_job where Worker_FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next())  {
                employer = rs.getString("Employer_Name");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return employer;
    }
    
    public static ArrayList getEmployers(String FIN) {
        
        ArrayList<String> employers = new ArrayList<String>();
        try{
            String query = "Select Employer_Name from tbl_job where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                employer = rs.getString("Employer_Name");
                employers.add(employer);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return employers;
    }
    
    public static String getWorkpassType(String FIN) {
        String workPassType = null;
        try{
            String query = "Select Workpass_Type from tbl_job where Worker_FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                workPassType = rs.getString("Workpass_Type");
            }
            
        }catch(Exception err) {
            System.out.println("Error  : " + err);
        }
        return workPassType;
    }
    
    public static String getJobKey(String FIN) {
        String jobKey = null;
        try{
            String query = "Select * from tbl_job where Worker_FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                jobKey = rs.getString("JobKey");
            }
            
        }catch(Exception err) {
            System.out.println("Error  : " + err);
        }
        return jobKey;
    }
    
    public static String getProbKey(String FIN, String jobKey) {
        String probKey = null;
        try{
            String query = "Select * from tbl_problem where Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                probKey = rs.getString("ProbKey");
            }
            
        }catch(Exception err) {
            System.out.println("Error  : " + err);
        }
        return probKey;
    }
    
    
    
    public static String getJobSector(String FIN) {
        String jobSector = null;
        try{
            String query = "Select Job_Sector from tbl_job where FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                jobSector = rs.getString("Job_Sector");
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return jobSector;
    }
    
    public static String getOccupation(String FIN) {
        String occupation = null;
        try{
            String query = "Select Occupation from tbl_job where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                occupation = rs.getString("Occupation");
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return occupation;
    }
    
    public static String getCommencedDate(String FIN) {
        String commencedDate = null;
        try{
            String query = "Select Job_Start_Date from tbl_job where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                commencedDate = rs.getString("Job_Start_Date");
                
            }
            
            //commencedDate = commencedDate.substring(0,10);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return commencedDate;
    }
    
    public static String getStatus(String FIN) {
        String TJS = null;
        try{
            String query = "Select Job_Whether_TJS from tbl_job where FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                TJS = rs.getString("Job_Whether_TJS");
                
            }
            
        }catch(Exception err) {
            System.out.println("Error ; "  + err);
        }
        return TJS;
    }
    
    public static String getRemarks(String FIN) {
        String remarks = null;
        try{
            String query = "Select Job_Remarks from tbl_job where FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                remarks = rs.getString("Job_Remarks");
                
            }
            
        }catch(Exception err) {
            System.out.println("Error ; "  + err);
        }
        return remarks;
    }
    public static String getRegistrationDate(String FIN) {
        
        String registrationDate = null;
        try{
            String query = "Select Worker_Registration_Date from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                registrationDate = rs.getString("Worker_Registration_Date");
            }
            registrationDate = registrationDate.substring(0,10);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return registrationDate;
    }
    
    public static String getCreatedBy(String FIN) {
        String createdBy = null;
        try{
            String query = "Select Created_By from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                createdBy = rs.getString("Created_By");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return createdBy;
    }
    
    public static String getCreatedFor(String FIN) {
        String createdFor = null;
        try{
            String query = "Select Create_For from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                createdFor = rs.getString("Create_For");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return createdFor;
    }
    
    public static String getWorkername(String FIN) {
        String workerName = null;
        try{
            String query = "Select Name_of_Worker from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                workerName = rs.getString("Name_of_Worker");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerName;
    }
    
    public static String getGender(String FIN) {
        String gender = null;
        try{
            String query = "Select Gender from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                gender = rs.getString("Gender");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return gender;
    }
    
    public static String getNationality(String FIN) {
        String nationality = null;
        try{
            String query = "Select Nationality from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                nationality = rs.getString("Nationality");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return nationality;
    }
    
    public static String getDateOfBirth(String FIN) {
        String dateOfBirth = null;
        try{
            String query = "Select DateofBirth from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                dateOfBirth = rs.getString("DateofBirth");
            }
            dateOfBirth = dateOfBirth.substring(0,10);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return dateOfBirth;
    }
    
    public static String getEndDate(String FIN) {
        String endDate = null;
        try{
            String query = "Select Job_End_Date from tbl_job where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                endDate = rs.getString("Job_End_Date");
            }
            endDate = endDate.substring(0,10);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return endDate;
    }
    
    /** photo **/
    public static String getPhoto(String FIN) {
        String photo = null;
        try{
            String query = "Select FacePic1 from tbl_worker_complement where FIN_Number = '"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                photo = rs.getString("FacePic1");
            }
            
        }catch(Exception err) {
            System.out.println("Error :  " + err);
        }
        return photo;
    }
    
    /** phone number **/
    public static String getPhoneNumber(String FIN) {
        String phoneNumber = null;
        try{
            String query = "Select Sg_Phone_Num from tbl_sg_phoneNumber where Worker_FIN_Number = '" + FIN +  "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                phoneNumber = rs.getString("Sg_Phone_Num");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return phoneNumber;
    }
    
    public static String getWorkerPicture(String FIN){
        
        String photoName = null;
        try{
            String query = "Select FacePicture from tbl_worker_facepic where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                photoName = rs.getString("FacePicture");
            }
        }catch(Exception err) {
            
        }
        return photoName;
    }
    
    
    public static ChiefProblem getProblem(String FIN){
        
        ChiefProblem problem = null;
        String FIN_Num = null;
        String jobKey = null;
        String probKey = null;
        try{
            String query = "Select * from tbl_problem where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                
                FIN_Num = rs.getString("Worker_FIN_Number");
                jobKey = rs.getString("JobKey");
                probKey = rs.getString("ProbKey");
                String chiefProblemDate = rs.getString("Chief_Problem_Date");
                String chiefProblem = rs.getString("Chief_Problem");
                String chiefProblemMore = rs.getString("Chief_Problem_More");
                String chiefProblemRemarks  = rs.getString("Chief_Problem_Remarks");
                
                problem = new ChiefProblem(chiefProblemDate,chiefProblem,chiefProblemMore,chiefProblemRemarks,FIN_Num,jobKey,probKey);
                
                
            }
        }catch(Exception err) {
            
        }
        return problem;
    }
    /** Pass Details **/
    
    public static ArrayList<Pass> getPassDetails(String FIN) {
        ArrayList<Pass> passDetails = new ArrayList<Pass>();
        try{
            String query = "Select * from tbl_pass_details where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String passType =  rs.getString("PassType");
                String passNumber =  rs.getString("PassNumber");
                String passIssueDate = rs.getString("Pass_Issue_Date");
                String passObsoleteDate = rs.getString("Pass_Obsolete_Date");
                
                Pass pass = new Pass(FIN,passType,passNumber,passIssueDate,passObsoleteDate);
                passDetails.add(pass);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return passDetails;
    }
    
    public static ArrayList<IPA> getIPADetails(String FIN) {
        ArrayList<IPA> ipaDetails = new ArrayList<IPA>();
        try{
            String query = "Select * from tbl_ipa_details where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String ipaPassType =  rs.getString("IPA_Pass_Type");
                String ipaEmployerName =  rs.getString("IPA_Employer_Name");
                String ipaBasicSalary = rs.getString("IPA_Basic_Salary");
                String ipaDeduction = rs.getString("IPA_Deduction");
                
                IPA ipa = new IPA(ipaPassType,ipaEmployerName,ipaBasicSalary,ipaDeduction,FIN);
                ipaDetails.add(ipa);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return ipaDetails;
    }
    
    
    public static ArrayList<VerbalAssurance> getVerbalAssuranceDetails(String FIN) {
        ArrayList<VerbalAssurance> verbalAssuranceDetails = new ArrayList<VerbalAssurance>();
        try{
            String query = "Select * from tbl_verbal_assurances where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String giverName =  rs.getString("Verbal_Name");
                String giverRelationship =  rs.getString("Verbal_Relationship");
                String givenDate = rs.getString("Verbal_When");
                String givenPlace = rs.getString("Verbal_Where");
                
                VerbalAssurance verbalAssurance = new VerbalAssurance(giverName,giverRelationship,givenDate,givenPlace,FIN);
                verbalAssuranceDetails.add(verbalAssurance);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return verbalAssuranceDetails;
    }
    
    public static ArrayList<EmploymentContract> getEmploymentContractDetails(String FIN) {
        ArrayList<EmploymentContract> employmentContractDetails = new ArrayList<EmploymentContract>();
        try{
            String query = "Select * from tbl_employment_contract where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String contractDate =  rs.getString("Contract_Date");
                String contractSignedPlace =  rs.getString("Contract_Where");
                String contractRelationship = rs.getString("Contract_Opposite_Relationship");
                String contractBasicSalary = rs.getString("Contract_Basic_Salary");
                
                EmploymentContract employmentContract = new EmploymentContract(contractDate,contractSignedPlace,contractRelationship,contractBasicSalary,FIN);
                employmentContractDetails.add(employmentContract);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return employmentContractDetails;
    }
    
    
    public static ArrayList<Agent> getAgentDetails(String FIN) {
        ArrayList<Agent> agentDetails = new ArrayList<Agent>();
        try{
            String query = "Select * from tbl_agent where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String agentCompany =  rs.getString("Agent_Company");
                String agentLocation =  rs.getString("Agent_Location");
                String agentAmountPaid = rs.getString("Agent_Amt_Paid");
                String agentAmountOwed = rs.getString("Agent_Amt_Owed");
                
                Agent agent = new Agent(agentCompany,agentLocation,agentAmountPaid,agentAmountOwed,FIN);
                agentDetails.add(agent);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return agentDetails;
    }
    
    
    public static ArrayList<Employer> getEmployerDetails(String FIN) {
        ArrayList<Employer> employerDetails = new ArrayList<Employer>();
        try{
            String query = "Select * from tbl_employer where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String employerName =  rs.getString("Employer_Official_Name");
                String employerAddress =  rs.getString("Employer_Address");
                String employerContacts = rs.getString("Employer_Contacts");
                String employerPersons = rs.getString("Employer_Persons");
                
                Employer employer = new Employer(employerName,employerAddress,employerContacts,employerPersons,FIN);
                employerDetails.add(employer);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return employerDetails;
    }
    
    public static ArrayList<Workplace> getWorkplaceDetails(String FIN) {
        ArrayList<Workplace> workplaceDetails = new ArrayList<Workplace>();
        try{
            String query = "Select * from tbl_workplace where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String workplaceType =  rs.getString("Workplace_Type");
                String workplaceWhose =  rs.getString("Workplace_Whose");
                String workplaceDirect = rs.getString("Workplace_Direct");
                String workplaceStart = rs.getString("Workplace_Start");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                Workplace workplace = new Workplace(workplaceType,workplaceWhose,workplaceDirect,workplaceStart,FIN_Number);
                workplaceDetails.add(workplace);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return workplaceDetails;
    }
    
    public static ArrayList<WorkHistory> getWorkHistoryDetails(String FIN) {
        ArrayList<WorkHistory> workHistoryDetails = new ArrayList<WorkHistory>();
        try{
            String query = "Select * from tbl_work_history where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String getWorkHow =  rs.getString("Work_History_How");
                String workHistoryDate = rs.getString("Work_History_Date");
                String workHistoryFirst =  rs.getString("Work_History_First");
                String workHistoryFirstYearArrival = rs.getString("Work_History_Year_Arrive");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                
                WorkHistory workHistory = new WorkHistory(getWorkHow,workHistoryDate,workHistoryFirst,workHistoryFirstYearArrival,FIN_Number);
                
                workHistoryDetails.add(workHistory);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return workHistoryDetails;
    }
    
    public static ArrayList<Accomodation> getAccomodationDetails(String FIN) {
        ArrayList<Accomodation> workHistoryDetails = new ArrayList<Accomodation>();
        try{
            String query = "Select * from tbl_accomodation where Worker_FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String accomodationProvided =  rs.getString("Accomodation_Provided");
                String accomodationType = rs.getString("Accomodation_Type");
                String accomodationCharged = rs.getString("Accomodation_Charged");
                String accomodationSelfPaid =  rs.getString("Accomodation_Self_Paid");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                
                Accomodation accomodation = new Accomodation(accomodationProvided,accomodationType,accomodationCharged,accomodationSelfPaid,FIN_Number);
                
                workHistoryDetails.add(accomodation);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return workHistoryDetails;
    }
    
    
    public static ArrayList<AggravatingIssue> getAggravatingIssueDetails(String FIN, String jobKey) {
        ArrayList<AggravatingIssue> aggraIssueDetails = new ArrayList<AggravatingIssue>();
        try{
            String query = "Select * from tbl_aggravating_issue where Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String aggraIssue =  rs.getString("AggraIssue");
                String aggraIssueMore = rs.getString("AggraIssueMore");
                String aggraLoss = rs.getString("AggraLoss");
                String aggraRemarks =  rs.getString("AggraRemarks");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                
                
                AggravatingIssue aggravatingIssue = new AggravatingIssue(aggraIssue,aggraIssueMore,aggraLoss,aggraRemarks,FIN,JobKey, ProbKey);
                
                aggraIssueDetails.add(aggravatingIssue);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return aggraIssueDetails;
    }
    
    public static ArrayList<CaseWorker> getCaseWorkerDetails(String FIN, String jobKey) {
        ArrayList<CaseWorker> caseWorkerDetails = new ArrayList<CaseWorker>();
        try{
            String query = "Select * from tbl_leadcaseworker where Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String leadCaseWorker =  rs.getString("leadCaseWorker");
                String startDate = rs.getString("leadStart");
                String endDate = rs.getString("leadEnd");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                
                CaseWorker caseWorker = new CaseWorker(leadCaseWorker,startDate,endDate,FIN,JobKey, ProbKey);
                
                caseWorkerDetails.add(caseWorker);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return caseWorkerDetails;
    }
    
    public static ArrayList<AuxillaryCaseWorker> getAuxCaseWorkerDetails(String FIN, String jobKey) {
        ArrayList<AuxillaryCaseWorker> caseWorkerDetails = new ArrayList<AuxillaryCaseWorker>();
        try{
            String query = "Select * from tbl_auxillaryCaseWorker where Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String auxCaseWorker =  rs.getString("AuxName");
                String startDate = rs.getString("AuxStart");
                String endDate = rs.getString("AuxEnd");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                
                AuxillaryCaseWorker caseWorker = new AuxillaryCaseWorker(auxCaseWorker,startDate,endDate,FIN,JobKey,ProbKey);
                
                caseWorkerDetails.add(caseWorker);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return caseWorkerDetails;
    }
    
    
    
    
    
    
    public static ArrayList<SalaryRelatedHistory> getSalaryRelatedHistoryDetails(String FIN) {
        ArrayList<SalaryRelatedHistory> salaryRelatedDetails = new ArrayList<SalaryRelatedHistory>();
        try{
            String query = "Select * from tbl_salary_history where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String salaryHistoryBasic =  rs.getString("SalHisBasic");
                String salaryMode = rs.getString("SalMode");
                String salLossTotal = rs.getString("SalLossTotal");
                String salLoss = rs.getString("SalLoss1Yr");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                SalaryRelatedHistory salaryHistory = new SalaryRelatedHistory(salaryHistoryBasic,salaryMode,salLossTotal,salLoss,FIN, JobKey, ProbKey);
                
                salaryRelatedDetails.add(salaryHistory);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return salaryRelatedDetails;
    }
    
    
    public static ArrayList<InjuryDetail> getInjuryDetails(String FIN) {
        ArrayList<InjuryDetail> injuryDetails = new ArrayList<InjuryDetail>();
        try{
            String query = "Select * from tbl_injury where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String injuryDate =  rs.getString("Injury_Date");
                String injuryLocation = rs.getString("Injury_Location");
                String injuryBodyPart = rs.getString("Injury_Body_Part");
                String injuryInitialTreatment = rs.getString("Injury_Initial_Treatment");
                
                InjuryDetail injuryDetail = new InjuryDetail(injuryDate,injuryLocation,injuryBodyPart,injuryInitialTreatment,FIN);
                
                injuryDetails.add(injuryDetail);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return injuryDetails;
    }
    
    /**Associate **/
    public static InjuryDetail getAssociateInjuryDetails(String FIN) {
        
        InjuryDetail InjuryDetails = null;
        try{
            String query = "Select * from tbl_injury where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String InjuryDate = rs.getString("Injury_Date");
                String InjuryTime = rs.getString("Injury_Time");
                String InjuryLocation = rs.getString("Injury_Location");
                String Death = rs.getString("Injury_Death");
                String BodyPart = rs.getString("Injury_Body_Part");
                String InjuryHow = rs.getString("Injury_How");
                String Ambulance = rs.getString("Injury_Ambulance");
                String InitialTreatment = rs.getString("Injury_Initial_Treatment");
                String InitialTreatmentMore = rs.getString("Injury_Initial_Treatment_More");
                String InjuryWorkRelated = rs.getString("Injury_Work_Related");
                String Remarks = rs.getString("Injury_Remarks");
                
                InjuryDetails = new InjuryDetail( FIN, InjuryLocation, InjuryDate,InjuryTime, Death, BodyPart, InjuryHow, Ambulance, InitialTreatment,InitialTreatmentMore, InjuryWorkRelated, Remarks);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return InjuryDetails;
    }
    
    public static String getChiefProblem(String FIN) {
        String chiefProblem = null;
        try{
            String query = "Select Chief_Problem from tbl_problem where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                chiefProblem = rs.getString("Chief_Problem");
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return chiefProblem;
    }
    
    public static String getEmployer2(String PassNumber) {
        try{
            String query =  "Select Employer_Name from tbl_pass_details where PassNumber ='" + PassNumber + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next())  {
                employer = rs.getString("Employer_Name");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return employer;
    }
    
    public Pass getPassDetails2(String PassNumber) {
        Pass passDetails = null;
        try{
            String query = "Select * from tbl_pass_details where PassNumber ='"  + PassNumber + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String passType =  rs.getString("PassType");
                String passTypeMore = rs.getString("PassTypeMore");
                String passNumber =  rs.getString("PassNumber");
                String passIssueDate = rs.getString("Pass_Issue_Date");
                String passApplicationDate = rs.getString("Pass_Application_Date");
                String passExpiryDate = rs.getString("Pass_Expiry_Date");
                String passIssuer = rs.getString("Pass_Issuer");
                String passRemarks = rs.getString("Pass_Remarks");
                String passObsoleteDate = rs.getString("Pass_Obsolete_Date");
                
                passDetails = new Pass(FIN,passType,passTypeMore,passNumber,passIssueDate,passApplicationDate,passExpiryDate,passIssuer,passRemarks,passObsoleteDate);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return passDetails;
    }
    
    public static Hospital getAssociateHospitalDetails(String FIN) {
        Hospital HospitalDetails = null;
        try{
            String query = "Select * from tbl_hospital where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String hospitalName =  rs.getString("HospName");
                String hospitalNameMore = rs.getString("HospNameMore");
                String hospitalUpdate = rs.getString("HospUpdate");
                String doctor = rs.getString("HospDoctor");
                
                HospitalDetails = new Hospital(hospitalUpdate,hospitalName,hospitalNameMore,hospitalUpdate,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return HospitalDetails;
    }
    
    public static Lawyer getAssociateLawyerDetails(String FIN) {
        
        Lawyer LawyerDetails = null;
        try{
            String query = "Select * from tbl_lawyer where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String lawyerHave = rs.getString("Lawyer_Have");
                String lawyerUpdate = rs.getString("Lawyer_Update");
                String lawyerFirm = rs.getString("Lawyer_Firm");
                String lawyerRemarks = rs.getString("Lawyer_Remarks");
                
                
                LawyerDetails = new Lawyer(lawyerUpdate,lawyerHave,lawyerFirm,lawyerRemarks,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return LawyerDetails;
    }
    
    public static ArrayList getLeadCaseWorkers(String FIN_Num, String jobKey){
        
        ArrayList<CaseWorker> workers = new ArrayList<CaseWorker>();
        try{
            String query = "Select * from tbl_leadcaseworker where Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String leadCaseWorker = rs.getString("leadCaseWorker");
                String leadStart = rs.getString("leadStart");
                String leadEnd = rs.getString("leadEnd");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                
                CaseWorker CaseWorker1 = new CaseWorker(leadCaseWorker ,leadStart,leadEnd, FIN_Num,JobKey,ProbKey);
                workers.add(CaseWorker1);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return workers;
    }
    
    public static ArrayList getAuxillaryWorker (String FIN_Num, String jobKey){
        
        ArrayList<AuxillaryCaseWorker> workers = new ArrayList<AuxillaryCaseWorker>();
        try{
            String query = "Select * from tbl_auxillarycaseworkerwhere Worker_FIN_Number ='" + FIN + "' and JobKey ='" +jobKey + "' ";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String AuxName = rs.getString("AuxName");
                String AuxStart = rs.getString("AuxStart");
                String AuxEnd = rs.getString("AuxEnd");
                String JobKey = rs.getString("JobKey");
                String ProbKey = rs.getString("ProbKey");
                
                AuxillaryCaseWorker CaseWorker1 = new AuxillaryCaseWorker(AuxName ,AuxStart,AuxEnd, FIN_Num, JobKey, ProbKey);
                workers.add(CaseWorker1);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return workers;
    }
    //created to retrieve other value
    public static String getNationalityOther(String FIN) {
        String nationality = null;
        try{
            String query = "Select NationalityMore from tbl_worker where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                nationality = rs.getString("NationalityMore");
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return nationality;
    }
    
    public static String getWorkpassTypeOther(String FIN) {
        String workPassType = null;
        try{
            String query = "Select Workpass_More from tbl_job where FIN_Number ='" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()){
                workPassType = rs.getString("Workpass_More");
            }
            
        }catch(Exception err) {
            System.out.println("Error  : " + err);
        }
        return workPassType;
    }
    
    public static String getJobSectorOther(String FIN) {
        String jobSector = null;
        try{
            String query = "Select Job_Sector_More from tbl_job where FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()){
                jobSector = rs.getString("Job_Sector_More");
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return jobSector;
    }
    
    
    public static ArrayList getProblems(String FIN) {
        
        ArrayList<String> problems = new ArrayList<String>();
        try{
            String query = "Select * from tbl_problem where Worker_FIN_Number = '" + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String problem = rs.getString("Chief_Problem");
                problems.add(problem);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return problems;
    }
    
    
    
    public static MC getAssociateMCDetails(String FIN) {
        
        MC MCDetails = null;
        try{
            String query = "Select * from tbl_mc where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String MCUpdate = rs.getString("MCUpdate");
                String MCStatus = rs.getString("MCstatus");
                String MCStatusMore = rs.getString("MCStatusMore");
                String MCExpDate = rs.getString("MCExpDate");
                String MCDaysCumul = rs.getString("MCDaysCumul");
                String MCRem = rs.getString("MCRem");
                
                MCDetails = new MC(MCUpdate,MCStatus,MCStatusMore,MCExpDate,MCDaysCumul,MCRem,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return MCDetails;
    }
    
    public static NonCriminialCaseMilestone getMilestoneNonCriminalDetails(String FIN) {
        
        NonCriminialCaseMilestone milestoneNonCriminalDetails = null;
        try{
            String query = "Select * from tbl_casemilestone_noncriminal where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String milesNCDate = rs.getString("MilesNCDate");
                String MilesNCReached = rs.getString("MilesNCReached");
                String MilesNCReachedMore = rs.getString("MilesNCReachedMore");
                String MilesCrCharges = rs.getString("MilesCrCharges");
                String MilesCrSentence = rs.getString("MilesCrSentence");
                String MilesCrRem = rs.getString("MilesCrRem");
                
                milestoneNonCriminalDetails = new NonCriminialCaseMilestone(milesNCDate,MilesNCReached,MilesNCReachedMore,MilesCrCharges,MilesCrSentence,MilesCrRem,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return milestoneNonCriminalDetails;
    }
    
    public ArrayList getMilestones(){
        ArrayList<String> milestones = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_casemilestone_noncriminalType`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String milestone= rs.getString(2);
                milestones.add(milestone);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return milestones;
    }
    
    
    public static Lawyer getAssociateLawyerDetail(String FIN) {
        
        Lawyer LawyerDetails = null;
        try{
            String query = "Select * from tbl_lawyer where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String LawyerHave = rs.getString("Lawyer_Have");
                String LawyerUpdate = rs.getString("Lawyer_Update");
                String LawyerFirm = rs.getString("Lawyer_Firm");
                String LawyerRemarks = rs.getString("Lawyer_Remarks");
                
                
                LawyerDetails = new Lawyer(LawyerHave,LawyerUpdate,LawyerFirm,LawyerRemarks,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return LawyerDetails;
    }
    
    public static TTR getTtrDetails(String FIN) {
        
        TTR TtrDetails = null;
        try{
            String query = "Select * from tbl_ttr where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String TtrUpdate = rs.getString("TtrUpdate");
                String TtrStatus = rs.getString("TtrStatus");
                String TtrStatusMore = rs.getString("TtrStatusMore");
                String DepartureDate = rs.getString("DepartureDate");
                String NameNewEmployer = rs.getString("NameNewEmployer");
                String NewJob = rs.getString("NewJob");
                String TtrRem = rs.getString("TtrRem");
                
                TtrDetails = new TTR(TtrUpdate,TtrStatus,TtrStatusMore,DepartureDate,NameNewEmployer,NewJob, TtrRem,FIN);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return TtrDetails;
    }
    
    public ArrayList getTtrs(){
        ArrayList<String> ttrs = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_ttrType`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String ttr= rs.getString(2);
                ttrs.add(ttr);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return ttrs;
    }
    
    public static Wica getWicaDetails(String FIN) {
        
        Wica WicaDetails = null;
        try{
            String query = "Select * from tbl_wica where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                Date WicamonUpdate = rs.getDate("WicamonUpdate");
                String WicamonStatus = rs.getString("WicamonStatus");
                String WicamonStatusMore = rs.getString("WicamonStatusMore");
                double WicamonPoints = rs.getDouble("WicamonPoints");
                double WicamonDollars = rs.getDouble("WicamonDollars");
                String WicamonRem = rs.getString("WicamonRemarks");
                
                WicaDetails = new Wica(FIN,WicamonUpdate,WicamonStatus,WicamonStatusMore,WicamonPoints,WicamonDollars,WicamonRem);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return WicaDetails;
    }
    public ArrayList getWicaDetails(){
        ArrayList<String> wicas = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_wicaType`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String wica= rs.getString(2);
                wicas.add(wica);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return wicas;
    }
    
    public static WicaClaim getWicaClaimDetails(String FIN) {
        
        WicaClaim WicaClaimDetails = null;
        try{
            String query = "Select * from tbl_wica_claim where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                Date WicaClaimDate = rs.getDate("WicaClaimDate");
                String WicaRefNbr = rs.getString("WicaRefNbr");
                String WicaInsurer = rs.getString("WicaInsurer");
                String WicaPolicyNbr = rs.getString("WicaPolicyNbr");
                String WicaClaimReason = rs.getString("WicaClaimReason");
                String WicaClaimRem = rs.getString("WicaClaimRem");
                
                WicaClaimDetails = new WicaClaim(FIN,WicaClaimDate,WicaRefNbr,WicaInsurer,WicaPolicyNbr,WicaClaimReason,WicaClaimRem);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return WicaClaimDetails;
    }
    
    
    public static void createWorker2(Worker worker) throws Exception {
        
        String FIN_Num =  worker.getFIN_Num();
        String registrationDate = worker.getWorkerRegistrationDate();
        String createdFor = worker.getCreatedFor();
        String socialWorkerName = worker.getSocialWorkerName(); // Created By --> Social Worker Name
        String workerName = worker.getWorkerName(); // Name of worker
        String gender = worker.getGender();
        String nationality = worker.getNationality();
        String nationalityMore = worker.getOtherNationality();
        
        String sqlQuery = "Insert into tbl_worker(FIN_Number,Name_of_Worker,Worker_Registration_Date,Created_By,Create_For"
                + ",Gender,Nationality,NationalityMore) Values ('" + FIN_Num + "','"+ workerName + "','" + registrationDate + "','" +socialWorkerName + "','" + createdFor + "','"  + gender + "','" + nationality + "','" + nationalityMore +"')";
        executeUpdate(sqlQuery);
        
    }
    
    //created by JunYeol for AssociateCreateWorkerServlet
    /** Insert Job Details **/
    public static void InsertJobDetails2(String employer, String passTypeJob, String passOtherTypeJob, String jobsector,String jobsectorother, String occupation, String tjs, String remarks,String FIN_Num)
    {
        try{
            
            String sqlQuery = "Insert into tbl_job(Employer_Name,Workpass_Type,Workpass_More,Job_Sector,Job_Sector_More,Occupation,Job_Whether_TJS,Job_Remarks,FIN_Number"
                    + ") Values ('" + employer + "','" + passTypeJob+ "','" + passOtherTypeJob + "','" + jobsector + "','" +jobsectorother+"','"+ occupation + "','"+ tjs + "','" + remarks + "','"+  FIN_Num  + "')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    /** At the end of Associate Methods **/
    
    public static ArrayList<OtherProblem> getOtherProblemDetails(String FIN) {
        ArrayList<OtherProblem> otherProblemDetails = new ArrayList<OtherProblem>();
        try{
            String query = "Select * from tbl_otherproblems where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String otherProblemDescription =  rs.getString("OthProblemDesc");
                String otherProblemLoss = rs.getString("OthProblemLoss");
                String otherProblemRemarks = rs.getString("OthProblemRem");
                
                OtherProblem otherProblem = new OtherProblem(otherProblemDescription,otherProblemLoss,otherProblemRemarks,FIN);
                
                otherProblemDetails.add(otherProblem);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return otherProblemDetails;
    }
    
    public static ArrayList<IllnessHistory> getIllnessDetails(String FIN) {
        ArrayList<IllnessHistory> illnessDetails = new ArrayList<IllnessHistory>();
        try{
            String query = "Select * from tbl_illness where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String illnessStartDate =  rs.getString("illnessStartWhen");
                String illnessDiagnosedDate = rs.getString("illnessDiagwhen");
                String illnessNature = rs.getString("illnessNature");
                String illnessWorkRelated = rs.getString("illnessWorkRelated");
                
                IllnessHistory illnessDetail = new IllnessHistory(illnessStartDate,illnessDiagnosedDate,illnessNature,illnessWorkRelated,FIN);
                
                illnessDetails.add(illnessDetail);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return illnessDetails;
    }
    
    public static ArrayList<TraffickingIndicator> getTraffickingIndicators(String FIN) {
        ArrayList<TraffickingIndicator> indicatorDetails = new ArrayList<TraffickingIndicator>();
        try{
            String query = "Select * from tbl_trafficking_indicators where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String tipiAssessDate =  rs.getString("TipiAssessDate");
                String tipiAssessName = rs.getString("TipiAssessName");
                String tipi81 = rs.getString("Tipi81");
                String tipi82 = rs.getString("Tipi82");
                
                TraffickingIndicator traffickingIndicator = new TraffickingIndicator(tipiAssessDate,tipiAssessName,tipi81,tipi82,FIN);
                
                indicatorDetails.add(traffickingIndicator);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return indicatorDetails;
    }
    
    public static ArrayList<SalaryClaimLodged> getSalaryClaimLodgedDetails(String FIN) {
        ArrayList<SalaryClaimLodged> salClaimLodgedDetails = new ArrayList<SalaryClaimLodged>();
        try{
            String query = "Select * from tbl_salary_claim_lodged where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String salClaimDate =  rs.getString("SalClaimDate");
                String salClaimLoss = rs.getString("SalClaimLoss");
                String salClaimBasis = rs.getString("SalClaimBasis");
                
                
                SalaryClaimLodged salClaimLodged = new SalaryClaimLodged(salClaimDate,salClaimLoss,salClaimBasis,FIN);
                
                salClaimLodgedDetails.add(salClaimLodged);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return salClaimLodgedDetails;
    }
    
    public static ArrayList<PoliceReport> getPoliceReportDetails(String FIN) {
        ArrayList<PoliceReport> policeReportDetails = new ArrayList<PoliceReport>();
        try{
            String query = "Select * from tbl_police_report where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String policeRptDate =  rs.getString("PoliceRptDate");
                String policeReptStation = rs.getString("PoliceReptStation");
                String policeRptPers = rs.getString("PoliceRptPers");
                String policeRptDetails = rs.getString("PoliceRptDetails");
                String policeRptRemarks  = rs.getString("PoliceRptRem");
                
                
                PoliceReport policeReport = new PoliceReport(policeRptDate,policeReptStation,policeRptPers,policeRptDetails, policeRptRemarks,FIN);
                
                policeReportDetails.add(policeReport);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return policeReportDetails;
    }
    
    public static ArrayList<Hospital> getHospitals(String FIN) {
        ArrayList<Hospital> hospitalDetails = new ArrayList<Hospital>();
        try{
            String query = "Select * from tbl_hospital where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String hospitalUpdateDate =  rs.getString("HospUpdate");
                String hospitalName = rs.getString("HospName");
                String hospitalMore = rs.getString("HospNameMore");
                String hospitalDoctor = rs.getString("HospDoctor");
                
                
                Hospital hospital = new Hospital(hospitalUpdateDate,hospitalName,hospitalMore,hospitalDoctor,FIN);
                
                hospitalDetails.add(hospital);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return hospitalDetails;
    }
    
    public static ArrayList<MC> getMCs(String FIN) {
        ArrayList<MC> mcDetails = new ArrayList<MC>();
        try{
            String query = "Select * from tbl_MC_status where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String mcUpdate =  rs.getString("MCUpdate");
                String mcStatus = rs.getString("MCstatus");
                String mcStatusMore = rs.getString("MCStatusMore");
                String mcExpDate = rs.getString("MCExpDate");
                String mcCummulativeDays = rs.getString("MCDaysCumul");
                String mcRemarks  = rs.getString("MCRem");
                
                
                MC mc = new MC(mcUpdate,mcStatus,mcStatusMore,mcExpDate,mcCummulativeDays,mcRemarks,FIN);
                
                mcDetails.add(mc);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return mcDetails;
    }
    
    public static ArrayList<Lawyer> getLawyerDetails(String FIN) {
        ArrayList<Lawyer> lawyerDetails = new ArrayList<Lawyer>();
        try{
            String query = "Select * from tbl_lawyer where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String lawyerUpdate =  rs.getString("Lawyer_Update");
                String lawyerHave = rs.getString("Laywer_Have");
                String lawyerFirm = rs.getString("Lawyer_Firm");
                String lawyerRemarks = rs.getString("Lawyer_Remarks");
                
                
                
                Lawyer lawyer = new Lawyer(lawyerUpdate,lawyerHave,lawyerFirm,lawyerRemarks,FIN);
                
                lawyerDetails.add(lawyer);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return lawyerDetails;
    }
    public static ArrayList<Benefit> getBenefitDetails(String FIN) {
        ArrayList<Benefit> benefitDetails = new ArrayList<Benefit>();
        try{
            String query = "Select * from tbl_benefaction where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String beneDate =  rs.getString("BeneDate");
                String beneType = rs.getString("BeneType");
                String benePurpose = rs.getString("BenePurpose");
                String beneValue = rs.getString("BeneValue");
                
                
                
                Benefit benefit = new Benefit(beneDate,beneType,benePurpose,beneValue,FIN);
                
                benefitDetails.add(benefit);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return benefitDetails;
    }
    
    public static ArrayList<NonCriminialCaseMilestone> getNonCriminalCaseDetails(String FIN) {
        ArrayList<NonCriminialCaseMilestone> nonCriminalCaseMilestoneDetails = new ArrayList<NonCriminialCaseMilestone>();
        try{
            String query = "Select * from tbl_casemilestone_noncriminal where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String milestoneDate =  rs.getString("MilesNCDate");
                String milestoneReached = rs.getString("MilesNCReached");
                String milestoneReachedMore = rs.getString("MilesNCReachedMore");
                String milestoneRemarks = rs.getString("MilesCrRem");
                
                
                
                NonCriminialCaseMilestone benefit = new NonCriminialCaseMilestone(milestoneDate,milestoneReached,milestoneReachedMore,milestoneRemarks,FIN);
                
                nonCriminalCaseMilestoneDetails.add(benefit);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return nonCriminalCaseMilestoneDetails;
    }
    
    public static ArrayList<TTR> getTTRDetails(String FIN) {
        ArrayList<TTR> ttrDetails = new ArrayList<TTR>();
        try{
            String query = "Select * from tbl_ttr where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String ttrUpdate =  rs.getString("TtrUpdate");
                String ttrStatus = rs.getString("TtrStatus");
                String ttrStatusMore = rs.getString("TtrStatusMore");
                String DepartureDate = rs.getString("DepartureDate");
                String newEmployerName = rs.getString("NameNewEmployer");
                
                
                TTR ttr = new TTR(ttrUpdate,ttrStatus,ttrStatusMore,DepartureDate,newEmployerName,FIN);
                
                ttrDetails.add(ttr);
            }
            
            
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
        return ttrDetails;
    }
    public static void insertImage(String itemName,String FIN) {
        try{
            String insertImageSqlQuery = "Update tbl_user Set Imagedata = '" + itemName + "' where NRIC_No ='" + FIN + "'";
            executeUpdate(insertImageSqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
    }
    
    public static void createWorker(Worker worker) {
        
        Date currentDate = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String entryDate = df.format(currentDate);
        String FIN_Num =  worker.getFIN_Num();
        String registrationDate = worker.getWorkerRegistrationDate();
        String createdFor = worker.getCreatedFor();
        String socialWorkerName = worker.getSocialWorkerName(); // Created By --> Social Worker Name
        String workerName = worker.getWorkerName(); // Name of worker
        String gender = worker.getGender();
        String nationality = worker.getNationality();
        String otherNationality = worker.getOtherNationality();
        String dateOfBirth = worker.getDateOfBirth();
        try{
            String sqlQuery = "Insert into tbl_worker(EntryDate,FIN_Number,Name_of_Worker,Worker_Registration_Date,Created_By,Create_For"
                    + ",Gender,Nationality,NationalityMore,DateofBirth) Values ('" + entryDate + "','" + FIN_Num + "','" + workerName + "','" + registrationDate + "','" +createdFor + "','" + socialWorkerName +  "','" + gender + "','" + nationality + "','" + otherNationality + "','" + dateOfBirth +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err){
            err.printStackTrace();
        }
    }
    
    public static void createJob(JobProfile job){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String jobKey = job.getJobKey();
            String employerName = job.getEmployerName();
            String workpassType = job.getWorkPassType();
            String workpassMore = job.getWorkPassMore();
            String jobSector = job.getJobSector();
            String jobSectorMore = job.getJobSectorMore();
            String occupation = job.getOccupation();
            String startDate = job.getStartDate();
            String endDate = job.getEndDate();
            String jobWhetherTJS = job.getJobWhetherTJS();
            String jobRemarks = job.getJobRemarks();
            String FIN_Number =job.getFIN_No();
            
            String sqlQuery = "Insert into tbl_job(EntryDate,Worker_FIN_Number,JobKey,Employer_Name,Workpass_Type, Workpass_More,Job_Sector,Job_Sector_More,Occupation"
                    + ",Job_Start_Date,Job_End_Date,Job_Whether_TJS,Job_Remarks) Values ('" + entryDate + "','" + FIN_Number + "','" + jobKey + "','" + employerName + "','" + workpassType + "','" + workpassMore + "','" + jobSector + "','" + jobSectorMore + "','"+  occupation + "','" + startDate + "','" + endDate + "','" + jobWhetherTJS + "','" + jobRemarks +"')";
            
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void createProblem(ChiefProblem problem){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String jobKey = problem.getJobKey();
            String probKey = problem.getProbKey();
            String FIN_Number = problem.getFIN_Number();
            String problemRegDate = problem.getProblemRegDate();
            String chiefProblem = problem.getChiefProblem();
            String problemOther = problem.getOtherProblem();
            String problemRemarks = problem.getProblemRemarks();
            
            
            String sqlQuery = "INSERT INTO `tbl_problem` (`EntryDate`, `Worker_FIN_Number`, `JobKey`, `ProbKey`, `Chief_Problem_Date`, `Chief_Problem`, `Chief_Problem_More`, `Chief_Problem_Remarks`) VALUES ('"+entryDate+"', '"+FIN_Number+"', '"+jobKey+"', '"+probKey+"', '"+problemRegDate+"', '"+chiefProblem+"', '"+problemOther+"', '"+problemRemarks+"');";
            
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void insertPhoto(String itemName, String FIN) {
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(currentDate);
            String insertImageSqlQuery = "Insert Into tbl_worker_facepic(FacePicture,Datestamp,Worker_FIN_Number) Values ('" + itemName + "','" + formattedDate + "','" + FIN + "')";
            executeUpdate(insertImageSqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
    }
    
    // Check FIN Num in database
    public static boolean checkFINNum(String FIN){
        
        try{
            String query = "Select * from tbl_worker_complement";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    public static boolean checkFINNumFromWorkerContactDetails(String FIN){
        
        try{
            String query = "Select * from tbl_worker_contact_details";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_Kin **/
    public static boolean checkFINNumFromKinDetails(String FIN){
        
        try{
            String query = "Select * from tbl_kin";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_family_member **/
    public static boolean checkFINNumFromFamilyDetails(String FIN){
        
        try{
            String query = "Select * from tbl_family_member";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_family_member **/
    public static boolean checkFINNumFromFriendDetails(String FIN){
        
        try{
            String query = "Select * from tbl_friend";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_language **/
    public static boolean checkFINNumFromWorkerLanguage(String FIN){
        
        try{
            String query = "Select * from tbl_language";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_bank_account_details **/
    public static boolean checkFINNumFromBankAccountDetails(String FIN){
        
        try{
            String query = "Select * from tbl_bank_account_details";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Check FIN_Num from tbl_worker_pass_Details **/
    public static boolean checkFINNumFromWorkerPassDetails(String FIN){
        
        try{
            String query = "Select * from tbl_pass_details";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                String FIN_Number = rs.getString("FIN_Number");
                if(FIN.equalsIgnoreCase(FIN_Number)){
                    return true;
                    
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return false;
    }
    
    /** Insert Bank Account Details **/
    public static void insertBankAccDetails(String bankAccName, String bankAccNumber,String bankName, String bankObsoleteDate, String FIN_Num)
    {
        try{
            
            String sqlQuery = "Insert into tbl_bank_acc_details(Bank_Account_Name,Bank_Account_Number,Bank_Name,"
                    + "Bank_Branch_Name,Bank_Branch_Address,Bank_Branch_Code,Bank_Swift_Code,Bank_Account_Remarks,Bank_Obsolete,Worker_FIN_Number) Values ('" + bankAccName + "','" + bankAccNumber+ "','" + bankName + "','" + "null" + "','" + "null" + "','" + "null" + "','" + "null"+ "','" + "null" + "','" + bankObsoleteDate + "','" + FIN_Num +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    /** Insert Family Details **/
    public static void insertFamilyDetails(String familyMemberName, String familyMemberRelationship,String familyMemberPhoneNumber, String obsoleteDate, String FIN_Num)
    {
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "Insert into tbl_family_member(EntryDate,Worker_FIN_Number,Name_of_Family_Member,Family_Member_Relationship,Family_Member_Where"
                    + ",Family_Member_Phone_Number,Family_Member_Digital,Family_Member_Remarks,Family_Member_Obsolete) Values ('" +  entryDate + "','" + FIN_Num + "','" + familyMemberName + "','" + familyMemberRelationship+ "','" + "null" + "','" + familyMemberPhoneNumber + "','" + "null" + "','" + "null" + "','" + obsoleteDate +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    /** Insert Kin Details **/
    public static void insertKinDetails(String kinName, String kinRelationship,String kinPhoneNum, String kinPhoneNumOBsoleteDate, String FIN_Num)
    {
        try{
            
            String sqlQuery = "Insert into tbl_kin(Worker_FIN_Number,Kin_Name,Kin_Relationship,Kin_Id_doc"
                    + ",Kin_Phone,Kin_Digital,Kin_Address,Kin_Proof,Kin_Remarks,Kin_Obsolete) Values ('" + FIN_Num + "','" + kinName + "','" + kinRelationship+ "','" + "null" + "','" + kinPhoneNum + "','" + "null" + "','" + "null" + "','" + "null" + "','" + "null" + "','" +kinPhoneNumOBsoleteDate +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    /** Insert Friend Details **/
    public static void insertFriendDetails(String friendName, String friendPhone,String workerRelationship, String friendObsoleteDate, String FIN_Num)
    {
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "Insert into tbl_sg_friend(EntryDate,Worker_FIN_Number,friendSgName,friendSgPhone,friendSgRel"
                    + ",friendSgRem,friendSgObs) Values ('" + entryDate + "','" + FIN_Num + "','" + friendName + "','" + friendPhone+ "','" + workerRelationship + "','" + "null" + "','" + friendObsoleteDate +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    /** Insert Language Details **/
    public static void insertLanguageDetails(String workerMainLanguage, String spokenEnglishStandard, String otherLanaguage, String FIN_Num)
    {
        try{
            
            String sqlQuery = "Insert into tbl_language(Worker_Main_Language,Spoken_English_Standard,Language_Remarks"
                    + ",Worker_FIN_Number) Values ('" + workerMainLanguage + "','" + spokenEnglishStandard+ "','" + otherLanaguage + "','" +  FIN_Num +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    /** Insert Nick name **/
    public static void insertNickName(String nickName, String FIN) {
        try{
            
            String sqlQuery = "Insert into tbl_worker_nickname(Worker_FIN_Number,Nickname) Values ('" + FIN + "','" + nickName +"')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    public static void updateNickName(String nickName, String FIN) {
        try{
            
            String sqlQuery = "Update tbl_worker_complement " + "SET Nickname_of_worker ='"+ nickName +"' where FIN_Number = '"+FIN+"'";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static boolean checkNickName(String FIN_Number) {
        try{
            String sqlQuery = "Select Nickname_of_worker from tbl_worker_complement where FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String nickName = rs.getString("Nickname_of_worker");
                if(nickName.length() != 0){
                    return true;
                }
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        return false;
    }
    public static void insertNewNickName(String nickName, String FIN_Number){
        try{
            String sqlQuery = "Select Nickname_of_worker from tbl_worker_complement where FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            if(rs.next() == true){
                insertNickName(nickName,FIN_Number);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void updatePhoneNumber(String sgPhoneNumber, String FIN) {
        try{
            
            String sqlQuery = "Update tbl_worker_contact_details " + "SET Sg_Phone_Num ='"+ sgPhoneNumber +"' where FIN_Number = '"+FIN+"'";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void updatePhoneNumber(String sgPhoneNumber, String phoneObsoleteDate, String FIN) {
        try{
            
            String sqlQuery = "Update tbl_worker_contact_details " + "SET Sg_Phone_Num ='"+ sgPhoneNumber +"', Sg_Phone_Obsolete ='" + phoneObsoleteDate + "' where FIN_Number = '"+FIN+"'";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    /** Update Pass Details**/
    public static void updatePassDetails(String passType,String passNumber,String passIssueDate, String FIN){
        try{
            
            String sqlQuery = "Update tbl_pass_details " + "SET PassType ='"+ passType +"', PassNumber ='" + passNumber + "', Pass_Issue_Date ='" + passIssueDate +  "' where FIN_Number = '"+FIN+"'";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    /** Update Language Details**/
    public static void updateLanguageDetails(String workerMainLanguage,String spokenEnglishStandard, String FIN){
        try{
            
            String sqlQuery = "Update tbl_language " + "SET Worker_Main_Language ='"+ workerMainLanguage +"', Spoken_English_Standard ='" + spokenEnglishStandard +  "' where FIN_Number = '"+FIN+"'";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    /** Update Pass Details**/
    public static void insertPassDetails(String passType,String passNumber,String passIssueDate, String passObsoleteDate, String FIN, String jobKey){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            
            String sqlQuery = "INSERT INTO `tbl_pass_details` (`EntryDate`, `Worker_FIN_Number`, `Jobkey`, `PassType`, `PassTypeMore`, `PassNumber`, `Pass_Application_Date`, `Pass_Issue_Date`, `Pass_Expiry_Date`, `Pass_Issuer`, `Pass_Remarks`, `Pass_Obsolete_Date`) VALUES ('"+entryDate+"', '"+FIN+"', '"+jobKey+"', '"+passType+"', NULL, '"+passNumber+"', NULL, '"+passIssueDate+"', NULL, NULL, NULL, '"+passObsoleteDate+"');";
            executeUpdate(sqlQuery);
            
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertIPADetails(String workpassSpecified,String ipaEmployerName, String ipaBasicMonthlySalary, double ipaDeductions, String FIN, String jobKey){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            
            
            String sqlQuery = "INSERT INTO `tbl_ipa_details` (`EntryDate`, `Worker_FIN_Number`, `JobKey`, `IPA_Pass_Type`, `IPA_Pass_Type_More`, `IPA_Application_Date`, `IPA_Employer_Name`, `IPA_Agent_Name`, `IPA_Industry`, `IPA_Occupation`, `IPA_Period_Years`, `IPA_Basic_Salary`, `IPA_Allowances`, `IPA_Allowances_Details`, `IPA_Deduction`, `IPA_Deduction_details`, `Housing_Provided`, `IPA_Remarks`) VALUES ('"+entryDate+"', '"+FIN+"', '"+jobKey+"', '"+workpassSpecified+"', NULL, NULL, '"+ipaEmployerName+"', NULL, NULL, NULL, NULL,  '"+ipaBasicMonthlySalary+"', NULL, NULL, '"+ipaDeductions+"' , NULL, NULL, NULL);";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertVerbalAssuranceDetails(String giverName,String giverRelationship,String givenDate, String givenPlace, String FIN, String jobKey){
        try{
            
            String sqlQuery = "Insert Into tbl_verbal_assurances (Verbal_Name,Verbal_Relationship,Verbal_When,Verbal_Where,Verbal_Content,Worker_FIN_Number, JobKey) VALUES "
                    + "('" + giverName + "','" + giverRelationship + "','" + givenDate + "','" + givenPlace +"','" + "null" +"','" + FIN + "','" + jobKey + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertEmploymentContractDetails(String contractDate,String contractSigned, String contractRelationship, String contractBasicSalary, String FIN,String jobKey){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO `tbl_employment_contract` (`EntryDate`, `Worker_FIN_Number`, `shortname`, `JobKey`, `Contract_Date`, `Contract_Where`, `Contract_Language`, `Contract_Opposite_Name`, `Contract_Opposite_Relationship`, `Contract_Occupation`, `Contract_Basic_Salary`, `Contract_Allowances`, `Contract_Deduction_Details`, `Contract_Duration`, `Contract_Duress`, `Contract_Remarks`) VALUES ('"+entryDate+"', '"+FIN+"',  NULL,  '"+jobKey+"',  '"+contractDate+"',  '"+contractSigned+"', NULL, NULL,  '"+contractRelationship+"', NULL,  '"+contractBasicSalary+"', NULL, NULL, NULL, NULL, NULL);";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertAgentDetails(String agentCompanyName,String agentLocation, double agentAmountPaid, double agentMoneyOwed, String FIN, String jobKey){
        try{
            
            String sqlQuery = "Insert Into tbl_agent (Agent_Company,Agent_Person_Name,Agent_Location,Agent_Address,Agent_Contact,Agent_Amt_Paid,Agent_Amt_Owed,Agent_Fee_Shared,Agent_Fee_Training,Agent_Fee_Airfare,Agent_Fee_Where,Agent_Fee_Repay,Agent_Employer,Agent_Remarks,Worker_FIN_Number,jobKey) VALUES "
                    + "(' " + agentCompanyName + "','" + "" + "','" + agentLocation + "','" + "" +"','" + "" +  "','" + agentAmountPaid + "','" + agentMoneyOwed + "','" + "" +  "','"+ "" + "','" + "" + "','" + "" + "','" + "" + "','" + "" + "','" + "" + "','" + FIN  + "','" + jobKey  +"');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertEmployerDetails(String employerName,String employerAddress, String employerContacts, String employerKey, String FIN, String jobKey){
        try{
            
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(currentDate);
            String sqlQuery = "Insert Into tbl_employer (EntryDate,Worker_FIN_Number,JobKey,Employer_Official_Name,Employer_ID,Employer_Address,Employer_Contacts,Employer_Persons,Employer_Remarks) VALUES "
                    + "(' " + formattedDate + "','" + FIN + "','" + jobKey + "','" + employerName +"','" + "" +  "','" + employerAddress + "','" + employerContacts + "','" + employerKey +  "','" + "" + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertWorkplaceDetails(String workplaceType,String workplaceWhose, String workplaceDirect, String workplaceStart, String FIN, String jobKey){
        try{
            
            String sqlQuery = "INSERT INTO `tbl_workplace` (`Worker_FIN_Number`, `JobKey`, `Workplace_Type`, `Workplace_Whose`, `Workplace_Persons`, `Workplace_Employer_Relationship`, `Workplace_Direct`, `Workplace_Start`, `Workplace_End`, `Workplace_Condition`, `Workplace_Safety`, `Workplace_Remarks`) VALUES ('"+FIN+"', '"+jobKey+"', '"+workplaceType+"', '"+workplaceWhose+"', NULL, NULL, '"+workplaceDirect+"', '"+workplaceStart+"', NULL, NULL, NULL, NULL);";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertWorkHistoryDetails(String getWorkHow,String singaporeDateArrival, String firstJobWhether, String firstJobArrival, String FIN, String jobKey){
        try{
            
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO `tbl_work_history` (`EntryDate`, `Worker_FIN_Number`, `JobKey`, `Work_History_How`, `Work_History_How_More`, `Work_History_Date`, `Work_History_First`, `Work_History_Year_Arrive`, `Work_History_Previous`, `Work_History_Previous_Problems`, `Work_History_Remarks`) VALUES ('"+entryDate+"','"+FIN+"', '"+jobKey+"', '"+getWorkHow+"', NULL, '"+singaporeDateArrival+"', '"+firstJobWhether+"','"+firstJobArrival+"', NULL, NULL, NULL);";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertAccomodationDetails(String accomodationProvided,String accomodationType, String employerMonthlyCost, String selfPaidCost, String FIN, String jobKey){
        try{
            String sqlQuery = "Insert Into tbl_accomodation (Accomodation_Provided,Accomodation_Type,Accomodation_Location,Accomodation_Condition,Accomodation_Charged,Accomodation_Self_Paid,Accomodation_Meals,Accomodation_Start,Accomdation_End,Accomodation_Remarks,Worker_FIN_Number,JobKey) VALUES "
                    + "('" + accomodationProvided + "','" + accomodationType + "',NULL,NULL,'" + Double.parseDouble(employerMonthlyCost)+ "','" + Double.parseDouble(selfPaidCost) +  "',NULL,NULL,NULL,NULL,'" + FIN + "','" + jobKey + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertAggravatingIssueDetails(String aggravatingIssue,String aggravatingIssueOther, String monetaryLoss, String aggravatingIssueRemarks, String FIN, String JobKey, String ProbKey){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            
            
            String sqlQuery = "INSERT INTO `tbl_aggravating_issue` (`EntryDate`, `Worker_FIN_Number`, `JobKey`, `ProbKey`, `AggraIssue`, `AggraIssueMore`, `AggraLoss`, `AggraRemarks`) VALUES ('"+entryDate+"', '"+FIN+"', '"+JobKey+"', '"+ProbKey+"', '"+aggravatingIssue+"', '"+aggravatingIssueOther+"', '"+monetaryLoss+"', '"+aggravatingIssueRemarks+"');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertLeadCaseWorkerDetails(String leadCaseWorker,String startDate, String endDate, String FIN, String jobKey, String probKey){
        try{
            String sqlQuery = "INSERT INTO `tbl_leadcaseworker` (`leadCaseWorker`, `leadStart`, `leadEnd`, `Worker_FIN_Number`, `JobKey`, `ProbKey`) VALUES ('"+leadCaseWorker+"', '"+startDate+"', '"+endDate+"', '"+FIN+"', '"+jobKey+"', '"+probKey+"');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertAuxillaryCaseWorkerDetails(String auxCaseWorkerName,String auxStartDate, String auxEndDate, String FIN, String jobKey, String probKey){
        try{
            String sqlQuery = "INSERT INTO `tbl_auxillarycaseworker` (`AuxName`, `AuxStart`, `AuxEnd`, `Worker_FIN_Number`, `JobKey`, `ProbKey`) VALUES ('"+auxCaseWorkerName+"', '"+auxStartDate+"', '"+auxEndDate+"', '"+FIN+"', '"+jobKey+"', '"+probKey+"');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    
    public static void insertBasicSalaryComplaintDetails(String basicSalaryComplaint,String salaryPaymentMode, String estimatedClaim, String estimated2MonthsClaim, String FIN, String jobKey, String probKey){
        try{
            
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO `tbl_salary_history` (`EntryDate`, `Worker_FIN_Number`, `JobKey`, `ProbKey`, `SalHisBasic`, `SalHisOT`, `SalHistAllowances`, `SalHisDeductions`, `SalhisKickBacks`, `SalHistOther`, `SalMode`, `SalModeMore`, `SalLossTotal`, `SalLoss1Yr`, `SalHisRemarks`) VALUES ('"+entryDate+"', '"+FIN+"', '"+jobKey+"', '"+probKey+"', '"+basicSalaryComplaint+"', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertInjuryDetails(String injuryDate,String incidentLocation, String bodyPartInjured, String locationTreated, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_injury (FIN_Number,Injury_Date,Injury_Time,Injury_Location,Injury_Death,Injury_Body_Part,Injury_How,Injury_Ambulance,Injury_Initial_Treatment,Injury_Initial_Treatment_More,Injury_Work_Related,Injury_Remarks) VALUES "
                    + "('" + FIN + "','" + injuryDate + "','" + ""  +"','" + incidentLocation + "','" + "" + "','" + bodyPartInjured + "','"+ "" + "','" + ""+ "','" + locationTreated +"','" + "" + "','" + "" + "','" + "" + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertIllnessDetails(String illnessBegan,String diagnosedIllness, String illnessNature, String workRelatedIllness, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_illness (illnessStartWhen,illnessDiagwhen,illnessDiagWho,illnessNature,illnessWorkRelated,illnessWhy,illnessRem,FIN_Number) VALUES "
                    + "('" + illnessBegan + "','" + diagnosedIllness + "','" + ""  +"','" + illnessNature + "','" + workRelatedIllness + "','" + "" + "','"+ "" + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertTraffickingIndicatorsDetails(String assessDate,String assessName, String traffickingComplaint, String otherTrafficking, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_trafficking_indicators (TipiAssessDate,TipiAssessName,Tipi81,Tipi82,FIN_Number) VALUES "
                    + "('" + assessDate + "','" + assessName + "','"   + traffickingComplaint + "','" + otherTrafficking + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertOtherProblemDetails(String otherProblems,String estimatedValueClaim, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_otherproblems (OthProblemDesc,OthProblemLoss,OthProblemRem,FIN_Number) VALUES "
                    + "('" + otherProblems + "','" + Double.parseDouble(estimatedValueClaim) + "','"   + ""  + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    public static void insertSalaryClaimLodgedDetails(String claimLodgedDate,String initialValueofClaim,String amountClaimedDesc, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_salary_claim_lodged (SalClaimDate,SalClaimLoss,SalClaimBasis,FIN_Number) VALUES "
                    + "('" + claimLodgedDate + "','" + Double.parseDouble(initialValueofClaim) + "','"   + amountClaimedDesc  + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertHospitalDetails(String updateDate,String currentHospital,String otherHospital, String doctor, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_hospital (HospUpdate,HospName,HospNameMore,HospDoctor,FIN_Number) VALUES "
                    + "('" + updateDate + "','" + currentHospital + "','"   + otherHospital  + "','" + doctor + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertMCDetails(String MCUpdateDate,String currentMCStatus,String latestMCExpirydate, String cumulativeMCDays, String FIN){
        try{
            String sqlQuery = "Insert Into tbl_MC_status (MCUpdate,MCstatus,MCStatusMore,MCExpDate,MCDaysCumul,MCRem,FIN_Number) VALUES "
                    + "('" + MCUpdateDate + "','" + currentMCStatus + "','"   + ""  + "','" + latestMCExpirydate + "','" + Integer.parseInt(cumulativeMCDays) + "','" + "" + "','" + FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertLawyerDetails(String lawyerUpdate,String haveLawyer,String lawFirmName, String lawyerStatusRemarks, String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "Insert Into tbl_lawyer(EntryDate,JobKey,ProbKey,Lawyer_Update,Laywer_Have,Lawyer_Firm,Lawyer_Remarks,FIN_Number) VALUES "
                    + "('" + formattedCurrentDate + "','" + "" + "','"   + ""  + "','" + lawyerUpdate + "','" + haveLawyer+ "','" + lawFirmName + "','" + lawyerStatusRemarks + "','" +  FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertTtrDetails(String ttrUpdateDate,String ttrStatus,String departureDate, String newEmployerName, String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "Insert Into tbl_ttr(EntryDate,JobKey,ProbKey,TtrUpdate,TtrStatus,TtrStatusMore,DepartureDate,NameNewEmployer,NewJob,TtrRem,FIN_Number) VALUES "
                    + "('" + formattedCurrentDate + "','" + "" + "','"   + ""  + "','" + ttrUpdateDate + "','" + ttrStatus+ "','" + "" + "','" + departureDate + "','" + newEmployerName + "','"  + "" + "','" + "" + "','" +   FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertBenefitDetails(String benefitGivenDate,String benefitType,String benefitPurpose, String benefitValue, String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "Insert Into tbl_benefaction(EntryDate,FIN_Number,JobKey,ProbKey,BeneDate,BeneGiver,BeneType,BeneTypeMore,BeneSerial,BenePurpose,BeneRem,BeneValue) VALUES "
                    + "('" + formattedCurrentDate + "','" + FIN + "','"   + ""  + "','" + "" + "','" + benefitGivenDate+ "','" + "" + "','" + benefitType + "','" + "" + "','"  + "" + "','" + benefitPurpose + "','" + "" + "','" + Double.parseDouble(benefitValue)+ "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertMilestoneNonCriminalDetails(String dateMilestoneReached,String milestoneReached,String milestoneOther,String milestoneRemarks, String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "Insert Into tbl_casemilestone_noncriminal(EntryDate,FIN_Number,JobKey,ProbKey,MilesNCDate,MilesNCReached,MilesNCReachedMore,MilesCrCharges,MilesCrSentence,MilesCrRem) VALUES "
                    + "('" + formattedCurrentDate + "','" + FIN + "','"   + ""  + "','" + "" + "','" + dateMilestoneReached+ "','" + milestoneReached + "','" + milestoneOther + "','" + "" + "','"  + milestoneRemarks + "','" + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static void insertPoliceReportDetails(String policeReportDate,String policeStation,String accompaniedPersons, String policeReportDetails, String FIN){
        try{
            
            String sqlQuery = "Insert Into tbl_police_report(PoliceRptDate,PoliceReptStation,PoliceRptPers,PoliceRptDetails,PoliceRptRem,FIN_Number) VALUES "
                    + "('" + policeReportDate + "','" + policeStation + "','"   + accompaniedPersons  + "','" + policeReportDetails + "','" +  "" + "','" +   FIN + "');";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    /* insert Phone details*/
    public static void InsertWorkerPhoneDetails(String FIN_Num,String workerPhoneNumber,String PhoneNumberObsoleteDate){
        
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_sg_phoneNumber " + "(EntryDate,Sg_Phone_Num,Sg_Phone_Obsolete,Worker_FIN_Number )VALUES(' " + entryDate + "','" + workerPhoneNumber +"','"+PhoneNumberObsoleteDate+"','"+FIN_Num +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    
    
    public static void insertPassportDetails(String passportCountry, String passportNumber, String FIN_Number, String passportIssueDate, String passportExpiryDate){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String entryDate = df.format(currentDate);
            String sqlQuery = "Insert into tbl_worker_passport_details(EntryDate,Passport_Number,Passport_Country,Passport_Issue_Date,Passport_Expiry_Date,Worker_FIN_Number) Values ('" + entryDate + "','" +  passportNumber + "','" + passportCountry + "','" + passportIssueDate + "','" +  passportExpiryDate + "','" + FIN_Number + "')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static ArrayList<String> retrievePassportNums(String FIN_Number){
        ArrayList<String> passportNums = new ArrayList<String>();
        try{
            String sqlQuery = "Select Passport_Number from tbl_worker_complement where FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String passportNumber = rs.getString("Passport_Number");
                passportNums.add(passportNumber);
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        return passportNums;
    }
    
    public static ArrayList<JobProfile> retrieveJobs(String FIN_Number){
        ArrayList<JobProfile> jobs = new ArrayList<JobProfile>();
        try{
            String sqlQuery = "Select * from tbl_job where Worker_FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String employerName = rs.getString("Employer_Name");
                String jobKey = rs.getString("JobKey");
                String workpassType = rs.getString("Workpass_Type");
                String workpassMore = rs.getString("Workpass_More");
                String occupation = rs.getString("Occupation");
                String jobCommenced = rs.getString("Job_Start_Date");
                
                JobProfile job = new JobProfile(FIN_Number,jobKey,employerName,workpassType,workpassMore,occupation,jobCommenced);
                jobs.add(job);
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        return jobs;
    }
    
    public static boolean checkPassport(String FIN_Number){
        try{
            String sqlQuery = "Select Passport_Number from tbl_worker_complement where FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String passportNumber = rs.getString("Passport_Number");
                if(passportNumber.length() != 0 && !passportNumber.equalsIgnoreCase("null")){
                    return true;
                }
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        return false;
    }
    
    public static void insertNewPassportNum(String passportCountry, String passportNumber, String FIN_Num, String passportIssueDate, String passportExpiryDate){
        try{
            String sqlQuery = "Select Passport_Country from tbl_worker_complement where FIN_Number = '" + FIN_Num + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String passportCountryExistedInDatabase = rs.getString("Passport_Country");
                if(!passportCountryExistedInDatabase.equalsIgnoreCase("null")){
                    insertPassportDetails( passportCountry,  passportNumber,  FIN_Num,  passportIssueDate,  passportExpiryDate);
                }
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    public static void insertHomeCountryContactDetails(String homePhoneNumber, String homePhoneNumOwner, String FIN_Num, String homeNumObsoleteDate){
        try{
            String sqlQuery = "Insert into tbl_homecountry_phonenumber (Home_Country_telephone_number,Owner_of_Number"
                    + ",Home_Phone_Obsolete,Worker_FIN_Number) Values ('" + homePhoneNumber + "','" + homePhoneNumOwner + "','" + homeNumObsoleteDate  + "','" + FIN_Num +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
        
    }
    
    public static ArrayList<HomeCountryContactDetails> retrieveHomeCountryContactDetails(String FIN){
        ArrayList<HomeCountryContactDetails> workerInfo = new ArrayList<HomeCountryContactDetails>();
        try{
            String sqlQuery = "Select * from tbl_homecountry_phonenumber where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String homePhoneNumber = rs.getString("Home_Country_telephone_number");
                String homePhoneOwner = rs.getString("Owner_of_Number");
                String homePhoneObsoleteDate = rs.getString("Home_Phone_Obsolete");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                HomeCountryContactDetails contactDetails = new HomeCountryContactDetails(homePhoneNumber,homePhoneOwner,homePhoneObsoleteDate,FIN_Number);
                workerInfo.add(contactDetails);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<WorkerSgAddress> retrieveSingaporeAddress(String FIN){
        ArrayList<WorkerSgAddress> workerInfo = new ArrayList<WorkerSgAddress>();
        try{
            String sqlQuery = "Select * from tbl_sg_address where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String singaporeAddress = rs.getString("Singapore_Address");
                String singaporeAddressObsolete = rs.getString("Addr_Singapore_Obsolete");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                WorkerSgAddress sgAddrDetail = new WorkerSgAddress(singaporeAddress,singaporeAddressObsolete,FIN_Number);
                workerInfo.add(sgAddrDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<WorkerHomeCountryAddress> retrieveHomeCountryAddress(String FIN){
        ArrayList<WorkerHomeCountryAddress> workerInfo = new ArrayList<WorkerHomeCountryAddress>();
        try{
            String sqlQuery = "Select * from tbl_homecountry_address where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String homeCountryAddress = rs.getString("Home_Country_Address");
                String homeCountryAddressObsolete = rs.getString("Home_Country_Obsolete_Address");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                WorkerHomeCountryAddress homeCountryAddrDetail = new WorkerHomeCountryAddress(homeCountryAddress,homeCountryAddressObsolete,FIN_Number);
                workerInfo.add(homeCountryAddrDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<WorkerDigitalContactType> retrieveDigitalContactType(String FIN){
        ArrayList<WorkerDigitalContactType> workerInfo = new ArrayList<WorkerDigitalContactType>();
        try{
            String sqlQuery = "Select * from tbl_digital_contact where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String digitalContactType = rs.getString("Digital_Contact_Type");
                String emailAddress = rs.getString("Email_or_QQ_Address");
                String digitalContactOwner = rs.getString("Owner_of_Electronic_Contact");
                String digitalRemarks  = rs.getString("Digital_Remarks");
                String obsoleteDate = rs.getString("Obsolete_Date");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                WorkerDigitalContactType workerDigitalContactType = new WorkerDigitalContactType(digitalContactType,emailAddress,digitalContactOwner,digitalRemarks,obsoleteDate,FIN_Number);
                workerInfo.add(workerDigitalContactType);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    
    public static ArrayList<WorkerBankAccountDetails> retrieveWorkerBankAccountDetails(String FIN){
        ArrayList<WorkerBankAccountDetails> workerInfo = new ArrayList<WorkerBankAccountDetails>();
        try{
            String sqlQuery = "Select * from tbl_bank_acc_details where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String bankAccountName = rs.getString("Bank_Account_Name");
                String bankAccountNumber = rs.getString("Bank_Account_Number");
                String bankName = rs.getString("Bank_Name");
                String bankObsolete  = rs.getString("Bank_Obsolete");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                WorkerBankAccountDetails workerBankAccountDetail = new WorkerBankAccountDetails(bankAccountName,bankAccountNumber,bankName,bankObsolete,FIN_Number);
                workerInfo.add(workerBankAccountDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static void updateHomeCountryContactDetails(String homePhoneNumber, String homePhoneNumOwner, String FIN_Num, String homeNumObsoleteDate){
        try{
            String sqlQuery = "Update tbl_worker_contact_details " + "SET Home_Country_telephone_number ='"+ homePhoneNumber + "',Owner_of_Number='" + homePhoneNumOwner + "',Home_Phone_Obsolete='" + homeNumObsoleteDate  + "' where FIN_Number = '"+FIN_Num+"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    /** Digital Contact Details **/
    public static void insertDigitalContact(String digitalContactType, String emailAddress, String electronicContactOwner, String obsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Insert into tbl_digital_contact(Digital_Contact_Type,Email_or_QQ_Address"
                    + ",Owner_of_Electronic_Contact,Digital_Remarks,Obsolete_Date,Worker_FIN_Number) Values ('" + digitalContactType + "','" + emailAddress+ "','" + electronicContactOwner + "','" + "null" + "','" +  obsoleteDate + "','" + FIN_Num +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void updateDigitalContact(String digitalContactType, String emailAddress, String electronicContactOwner, String obsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Update tbl_digital_contact " + "SET Digital_Contact_Type ='"+ digitalContactType + "',Email_or_QQ_Address ='" + emailAddress + "',Owner_of_Electronic_Contact ='" +  electronicContactOwner +  "',Obsolete_Date ='" + obsoleteDate + "' where FIN_Number = '"+FIN_Num+"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void insertSgAddress(String sgAddress, String sgAddrObsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Insert into tbl_sg_address(Singapore_Address,Addr_Singapore_Obsolete"
                    + ",Worker_FIN_Number) Values ('" + sgAddress + "','" + sgAddrObsoleteDate+ "','" + FIN_Num +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void updateSGAddress(String sgAddress, String sgAddrObsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Update tbl_worker_contact_details " + "SET Singapore_Address ='"+ sgAddress + "',Addr_Singapore_Obsolete='" + sgAddrObsoleteDate + "' where FIN_Number = '"+FIN_Num+"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void insertHomeCountryAddress(String homeCountryAddress, String homeCountryAddrObsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Insert into tbl_homecountry_address (Home_Country_Address,Home_Country_Obsolete_Address"
                    + ",Worker_FIN_Number) Values ('" + homeCountryAddress + "','" + homeCountryAddrObsoleteDate + "','" + FIN_Num +"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void updateHomeCountryAddress(String homeCountryAddress, String homeCountryAddrObsoleteDate, String FIN_Num){
        try{
            String sqlQuery = "Update tbl_worker_contact_details " + "SET Home_Country_Address ='"+ homeCountryAddress + "',Home_Country_Obsolete_Address='" + homeCountryAddrObsoleteDate + "' where FIN_Number = '"+FIN_Num+"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void updatePassportDetails(String passportCountry, String passportNumber, String FIN_Num, String passportIssueDate, String passportExpiryDate){
        try{
            String sqlQuery = "Update tbl_worker_complement " + "SET Passport_Country ='"+ passportCountry + "',Passport_Number='" + passportNumber + "',Passport_Issue_Date='" + passportIssueDate + "',Passport_Expiry_Date='" + passportExpiryDate + "' where FIN_Number = '"+FIN_Num+"'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
        
    }
    
    public static void insertWorkerFriend(String friendName, String friendPhone, String workerRelationship, String obsoleteDate, String FIN){
        try{
            if(obsoleteDate == null || obsoleteDate.equalsIgnoreCase("")){
                obsoleteDate = "0000-00-00";
            }
            String sqlQuery = "Insert into tbl_friend(Friend_SG_Name,Friend_SG_Phone,Friend_SG_Relationship"
                    + ",Friend_Remarks,Friend_SG_Obsolete,Worker_FIN_Number) Values ('" + friendName + "','" + friendPhone + "','" + workerRelationship + "','" + "null" + "','" + obsoleteDate  + "','" + FIN +"')";
            
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    public static void insertWorkerImage(String itemName,String dateStamp, String FIN) {
        try{
            String insertImageSqlQuery = "Insert Into tbl_worker_facepic(FacePicture,Datestamp,Worker_FIN_Number) Values ('" + itemName + "','" + dateStamp + "','" + FIN + "')";
            executeUpdate(insertImageSqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " +  err);
        }
    }
    
    
    
    
    
    //Get details
    
    /** phone number **/
    
    
    /** Date discovered to be obsolete(Phone number)**/
    public static Date getSGPhoneNumberObsoleteDate(String FIN){
        Date obsoleteDate =null;
        try{
            String query = "Select Sg_Phone_Obsolete from tbl_worker_contact_details where FIN_Number = '" + FIN +  "'";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                obsoleteDate = rs.getDate("Sg_Phone_Obsolete");
            }
            
        }catch(Exception err){
            System.out.println("Error : " + err);
            
        }
        
        
        return obsoleteDate;
    }
    
    /* insert worker pass*/
    
    public static void InsertWorkerPassDetails(String FIN_Num,String workpass,String passNum,String passIssueDate){
        try{
            String sqlQuery = "INSERT INTO tbl_pass_details(PassType,PassNumber,Pass_Issue_Date,FIN_Number)VALUES('"+ workpass+"','"+passNum+"','"+passIssueDate+"','"+FIN_Num+"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    
    /*get Pass Number*/
    public static String getPassNumber(String FIN){
        String passNumber=null;
        try{
            String query = "Select PassNumber from tbl_pass_details where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                passNumber = rs.getString("PassNumber");
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
            
        }
        
        return passNumber;
    }
    
    /* get pass issue date */
    public static Date getPassIssueDate(String FIN){
        Date passIssueDate= null;
        try{
            String query = "Select Pass_Issue_Date from tbl_pass_details where FIN_Number ='"  + FIN + "'";
            rs = statement.executeQuery(query);
            while(rs.next()) {
                passIssueDate = rs.getDate("Pass_Issue_Date");
            }
            
        }catch(Exception err){
            System.out.println("Error: " + err);
            
        }
        return passIssueDate;
        
    }
    public static ArrayList<String> getWorkPassList(){
        ArrayList<String> workPassList = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_workpasstype`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String workerPassType= rs.getString(2);
                workPassList.add(workerPassType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return workPassList;
    }
    
    public static void createWorkerPass(WorkerPassDetails pass){
        try{
            
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    /* nat*/
    public static ArrayList<String> getNationalitieslists(){
        
        ArrayList<String> nationalitiesList = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_nationalitiesType`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String nationalityPassType= rs.getString(2);
                nationalitiesList.add(nationalityPassType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return nationalitiesList;
    }
    
    /* display dropdown menu of the lists of jobSectorType*/
    public static ArrayList<String> getJobSectorlists(){
        
        ArrayList<String> jobsectorLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_jobSectorType`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String jobSectorType= rs.getString(2);
                jobsectorLists.add(jobSectorType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return jobsectorLists;
    }
    
    /* display dropdown menu of the lists of cheifProblem types*/
    public static ArrayList<String> getChiefProblemlists(){
        
        ArrayList<String> chiefProblemLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_chiefproblem_type`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String chiefProblemType= rs.getString(2);
                chiefProblemLists.add(chiefProblemType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return chiefProblemLists;
    }
    
    
    /* display dropdown menu of the lists of jobSectorType*/
    public static ArrayList<String> getLanguagelists(){
        
        ArrayList<String> languageLists = new ArrayList<String>();
        try{
            String sqlQuery = "SELECT * FROM tbl_worker_languagetype";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String language= rs.getString(2);
                languageLists.add(language);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return languageLists;
    }
    
    /* display dropdown menu of the lists of type of how worker got work history type*/
    public static ArrayList<String> getWorkHistoryHowType(){
        
        ArrayList<String> workhistroyLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM tbl_workhistoryhow_type";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String workhistroyList= rs.getString(2);
                workhistroyLists.add(workhistroyList);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return workhistroyLists;
    }
    
    /* display dropdown menu of the lists of agent location types*/
    public static ArrayList<String> getAgentLocationTypes(){
        
        ArrayList<String> agentLocationLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM tbl_agentlocation_type";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String agentLocationType= rs.getString(2);
                agentLocationLists.add(agentLocationType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return agentLocationLists;
    }
    
    /* display dropdown menu of the lists of agent location types*/
    public static ArrayList<String> getSalaryPaymentTypes(){
        
        ArrayList<String> salaryTypeList = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM tbl_salarypayment_type";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String salaryType= rs.getString(2);
                salaryTypeList.add(salaryType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return salaryTypeList;
    }
    
    
    /* display dropdown menu of the lists of accomodation types*/
    public static ArrayList<String> getAccomodationTypes(){
        
        ArrayList<String> accomodationTypeLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM tbl_accommodation_type";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String accomodationList= rs.getString(2);
                accomodationTypeLists.add(accomodationList);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return accomodationTypeLists;
    }
    
    
    /* display dropdown menu of the lists of accomodation providedtypes*/
    public static ArrayList<String> getAccomodationProvidedTypes(){
        
        ArrayList<String> accomodationProvidedTypeLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM tbl_accomprovided_type";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String accomodationProvidedType= rs.getString(2);
                accomodationProvidedTypeLists.add(accomodationProvidedType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return accomodationProvidedTypeLists;
    }
    
    public static ArrayList<String> getProblemLists(){
        
        ArrayList<String> problemLists = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_problem_dropdown`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String problemType= rs.getString(2);
                problemLists.add(problemType);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return problemLists;
    }
    
    /** Insert Attachment **/
    public static void insertDocument(String FIN_Number,String documentName){
        try{
            String sqlQuery = "Insert into tbl_worker_attachment(FIN_Number,document_name) Values ('" + FIN_Number + "','" + documentName + "')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    public static ArrayList<String> retrieveDocuments(String FIN_Number){
        
        ArrayList<String> documentNames = new ArrayList<String>();
        try{
            String sqlQuery = "Select * from tbl_worker_attachment where FIN_Number = '" + FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String documentName = rs.getString("document_name");
                documentNames.add(documentName);
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        
        return documentNames;
    }
    
    
    /**
     * ===============================
     * Retrieve Workers' Complements
     * ===============================
     **/
    
    public static ArrayList<FamilyDetails> retrieveFamilyWorkerDetails(String FIN) {
        ArrayList<FamilyDetails> workerInfo = new ArrayList<FamilyDetails>();
        
        try{
            String sqlQuery = "Select * from tbl_family_member where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String familyMemberName = rs.getString("Name_of_Family_Member");
                String familyMemberRelationship = rs.getString("Family_Member_Relationship");
                String familyMemberPhoneNumber = rs.getString("Family_Member_Phone_Number");
                String familyMemberObsoleteDate = rs.getString("Family_Member_Obsolete");
                FamilyDetails familyDetail = new FamilyDetails(familyMemberName,familyMemberRelationship,familyMemberPhoneNumber,familyMemberObsoleteDate);
                workerInfo.add(familyDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        
        return workerInfo;
        
    }
    
    public static ArrayList<WorkerFriendDetails> retrieveFriendDetails(String FIN) {
        ArrayList<WorkerFriendDetails> workerInfo = new ArrayList<WorkerFriendDetails>();
        
        try{
            String sqlQuery = "Select * from tbl_sg_friend where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String FIN_Number = rs.getString("Worker_FIN_Number");
                String friendSGName = rs.getString("friendSgName");
                String friendSGPhone = rs.getString("friendSgPhone");
                String friendSGRelationship = rs.getString("friendSgRel");
                String friendSGRemarks = rs.getString("friendSgRem");
                String friendSGObsolete = rs.getString("friendSgObs");
                WorkerFriendDetails friendDetail = new WorkerFriendDetails(FIN_Number,friendSGName,friendSGPhone,friendSGRelationship,friendSGRemarks,friendSGObsolete);
                workerInfo.add(friendDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        
        return workerInfo;
        
    }
    
    public static ArrayList<String> retrieveWorkerNicknames(String FIN){
        
        ArrayList<String> workerInfo = new ArrayList<String>();
        try{
            String sqlQuery = "Select * from tbl_worker_nickname where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String nickname = rs.getString("Nickname");
                workerInfo.add(nickname);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<WorkerPhoto> retrieveWorkerPhotos(String FIN){
        
        ArrayList<WorkerPhoto> workerInfo = new ArrayList<WorkerPhoto>();
        try{
            String sqlQuery = "Select * from tbl_worker_facepic where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String photo = rs.getString("FacePicture");
                String dateStamp = rs.getString("Datestamp");
                String FINNumber = rs.getString("Worker_FIN_Number");
                
                WorkerPhoto workerPhoto = new WorkerPhoto(photo, dateStamp,FINNumber);
                workerInfo.add(workerPhoto);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<Passport> retrieveWorkerPassportDetails(String FIN){
        
        ArrayList<Passport> workerInfo = new ArrayList<Passport>();
        try{
            String sqlQuery = "Select * from tbl_worker_passport_details where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String country = rs.getString("Passport_Country");
                String passportNumber = rs.getString("Passport_Number");
                String passportIssueDate = rs.getString("Passport_Issue_Date");
                String passportExpiryDate = rs.getString("Passport_Expiry_Date");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                Passport newPassport = new Passport(country,passportNumber,passportIssueDate,passportExpiryDate, FIN_Number);
                workerInfo.add(newPassport);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<WorkerSGContactDetails> retrieveWorkerContactDetails(String FIN){
        
        ArrayList<WorkerSGContactDetails> workerInfo = new ArrayList<WorkerSGContactDetails>();
        try{
            String sqlQuery = "Select * from tbl_sg_phonenumber where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String sgPhoneNumber = rs.getString("Sg_Phone_Num");
                String sgPhoneObsolete = rs.getString("Sg_Phone_Obsolete");
                String FIN_Number = rs.getString("Worker_FIN_Number");
                WorkerSGContactDetails contactDetails = new WorkerSGContactDetails(sgPhoneNumber,sgPhoneObsolete,FIN_Number);
                workerInfo.add(contactDetails);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<LanguageDetails> retrieveLanguageDetails(String FIN){
        
        ArrayList<LanguageDetails> workerInfo = new ArrayList<LanguageDetails>();
        try{
            String sqlQuery = "Select * from tbl_language where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String mainLanguage = rs.getString("Worker_Main_Language");
                String spokenEnglishStandard = rs.getString("Spoken_English_Standard");
                String languageRemarks = rs.getString("Language_Remarks");
                
                LanguageDetails languageDetail = new LanguageDetails(mainLanguage,spokenEnglishStandard,languageRemarks);
                workerInfo.add(languageDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return workerInfo;
    }
    
    public static ArrayList<KinDetails> retrieveKinDetails(String FIN){
        ArrayList<KinDetails> kinDetails = new ArrayList<KinDetails>();
        
        try{
            String sqlQuery = "Select * from tbl_kin where Worker_FIN_Number = '"  + FIN  + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                
                String kinName = rs.getString("Kin_Name");
                String kinRelationship = rs.getString("Kin_Relationship");
                String kinPhone = rs.getString("Kin_Phone");
                String kinObsoleteDate = rs.getString("Kin_Obsolete");
                
                
                KinDetails kinDetail = new KinDetails(kinName,kinRelationship,kinPhone, kinObsoleteDate);
                kinDetails.add(kinDetail);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        
        return kinDetails;
    }
    
    
    
    /**
     * =====================================
     *  Methods for Search Functionality
     * =====================================
     */
    
    
    /** Search By Gender Type **/
    
    public static ArrayList<Worker> retrieveByWorkerNames(String workerName){
        ArrayList<Worker> workerNames=  new ArrayList<Worker>();
        String sqlQuery = "Select * from tbl_worker Where Name_of_Worker like '" + workerName + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                
                String name = rs.getString("Name_of_Worker");
                String FIN_Number = rs.getString("FIN_Number");
                String gender = rs.getString("Gender");
                String nationality = rs.getString("Nationality");
                String workerRegDate = rs.getString("Worker_Registration_Date");
                
                Worker worker = new Worker(FIN_Number,name,gender,nationality,workerRegDate);
                workerNames.add(worker);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        return workerNames;
    }
    
    public static ArrayList<Worker> retrieveByFIN(String FIN){
        ArrayList<Worker> workerFINs=  new ArrayList<Worker>();
        String sqlQuery = "Select * from tbl_worker Where FIN_Number like '" + FIN + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                
                String name = rs.getString("Name_of_Worker");
                String FIN_Number = rs.getString("FIN_Number");
                String gender = rs.getString("Gender");
                String nationality = rs.getString("Nationality");
                String workerRegDate = rs.getString("Worker_Registration_Date");
                
                Worker worker = new Worker(FIN_Number,name,gender,nationality,workerRegDate);
                workerFINs.add(worker);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        return workerFINs;
    }
    
    public static ArrayList<Worker> retrieveGenderSearchResults(String genderType){
        
        ArrayList<Worker> genderSearchResults = new ArrayList<Worker>();
        String sqlQuery ="Select * from tbl_worker where Gender like '" + genderType + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                String name = rs.getString("Name_of_Worker");
                String FIN_Number = rs.getString("FIN_Number");
                String gender = rs.getString("Gender");
                String nationality = rs.getString("Nationality");
                String workerRegDate = rs.getString("Worker_Registration_Date");
                
                Worker worker = new Worker(FIN_Number,name,gender,nationality,workerRegDate);
                genderSearchResults.add(worker);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return genderSearchResults;
    }
    
    /** Search By Nationality **/
    public static ArrayList<Worker> retrieveNationalitySearchResults(String nationality){
        
        ArrayList<Worker> nationalitySearchResults = new ArrayList<Worker>();
        String sqlQuery ="Select * from tbl_worker where Nationality Like '" + nationality + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                String name = rs.getString("Name_of_Worker");
                String FIN_Number = rs.getString("FIN_Number");
                String gender = rs.getString("Gender");
                String nationalityType = rs.getString("Nationality");
                String workerRegDate = rs.getString("Worker_Registration_Date");
                
                Worker worker = new Worker(FIN_Number,name,gender,nationalityType,workerRegDate);
                nationalitySearchResults.add(worker);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return nationalitySearchResults;
    }
    
    /** Search By SG Phone Number **/
    public static ArrayList<Worker> retrieveSgPhoneNumberSearchResults(String sgPhoneNum){
        
        ArrayList<Worker> workerSgPhoneNumResults = new ArrayList<Worker>();
        String sqlQuery ="Select tbl_worker.Name_of_Worker,tbl_worker.FIN_Number,tbl_worker.Gender,tbl_worker.Nationality,tbl_worker.Worker_Registration_Date,tbl_sg_phonenumber.Sg_Phone_Num from tbl_sg_phoneNumber inner join tbl_worker on tbl_worker.FIN_Number  = tbl_sg_phoneNumber.Worker_FIN_Number where tbl_sg_phonenumber.Sg_Phone_Num Like '" + sgPhoneNum + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                String FIN_Number = rs.getString("tbl_worker.FIN_Number");
                String workerName = rs.getString("tbl_worker.Name_of_Worker");
                String gender = rs.getString("tbl_worker.Gender");
                String nationality = rs.getString("tbl_worker.Nationality");
                String workerRegDate = rs.getString("tbl_worker.Worker_Registration_Date");
                
                
                Worker worker = new Worker(FIN_Number,workerName,gender,nationality,workerRegDate);
                workerSgPhoneNumResults.add(worker);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return workerSgPhoneNumResults;
    }
    
    
    public static ArrayList<Worker> retrieveWorkPassSearchResults(String workpass){
        
        ArrayList<Worker> workpassSearchResults = new ArrayList<Worker>();
        String sqlQuery ="Select tbl_pass_details.PassType, tbl_worker.FIN_Number, tbl_worker.Name_of_Worker,tbl_worker.Gender,tbl_worker.Nationality,tbl_worker.Worker_Registration_Date from tbl_worker inner join tbl_pass_details on tbl_worker.FIN_Number = tbl_pass_details.Worker_FIN_Number where tbl_pass_details.PassType like '" + workpass + "';";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                String FIN_Number = rs.getString("tbl_worker.FIN_Number");
                String workerName = rs.getString("tbl_worker.Name_of_Worker");
                String gender = rs.getString("tbl_worker.Gender");
                String nationality = rs.getString("tbl_worker.Nationality");
                String workerRegDate = rs.getString("tbl_worker.Worker_Registration_Date");
                Worker worker = new Worker(FIN_Number,workerName,gender,nationality,workerRegDate);
                workpassSearchResults.add(worker);
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return workpassSearchResults;
    }
    
    public static ArrayList<WorkerContactDetails> retrieveAllNums(){
        
        ArrayList<WorkerContactDetails> sgPhoneNumberSearchResults = new ArrayList<WorkerContactDetails>();
        String sqlQuery ="Select tbl_worker.Name_of_Worker,tbl_worker_contact_details.Sg_Phone_Num,tbl_worker_contact_details.FIN_Number from tbl_worker_contact_details inner join tbl_worker on tbl_worker.FIN_Number = tbl_worker_contact_details.FIN_Number;";
        rs = executeQuery(sqlQuery);
        try{
            while(rs.next()){
                String workerName = rs.getString("tbl_worker.Name_of_Worker");
                String FIN_Number = rs.getString("tbl_worker_contact_details.FIN_Number");
                String existedSgPhoneNum = rs.getString("tbl_worker_contact_details.Sg_Phone_Num");
                existedSgPhoneNum = existedSgPhoneNum.replaceAll("\\s","");
                WorkerContactDetails newWorkerContactDetails = new WorkerContactDetails(FIN_Number,workerName, existedSgPhoneNum);
                sgPhoneNumberSearchResults.add(newWorkerContactDetails);
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return sgPhoneNumberSearchResults;
    }
    
    public static ArrayList<WorkerContactDetails> retrieveAllHomeCountryNums(String homeCountryPhoneNumber){
        ArrayList<WorkerContactDetails> homeCountryNumsSearchResults = new ArrayList<WorkerContactDetails>();
        String sqlQuery ="Select tbl_worker.Name_of_Worker,tbl_worker_contact_details.Sg_Phone_Num,tbl_worker_contact_details.FIN_Number, tbl_worker_contact_details.Home_Country_Telephone_Number from tbl_worker_contact_details inner join tbl_worker on tbl_worker.FIN_Number = tbl_worker_contact_details.FIN_Number;";
        rs = executeQuery(sqlQuery);
        
        try{
            while(rs.next()){
                String workerName = rs.getString("tbl_worker.Name_of_Worker");
                String FIN_Number = rs.getString("tbl_worker_contact_details.FIN_Number");
                String existedSgPhoneNum = rs.getString("tbl_worker_contact_details.Sg_Phone_Num");
                String existedHomePhoneNum = rs.getString("tbl_worker_contact_details.Home_Country_Telephone_Number");
                
                existedSgPhoneNum = existedSgPhoneNum.replaceAll("\\s","");
                existedHomePhoneNum = existedHomePhoneNum.replaceAll("\\s","");
                WorkerContactDetails newWorkerContactDetails = new WorkerContactDetails(FIN_Number,workerName, existedSgPhoneNum);
                homeCountryNumsSearchResults.add(newWorkerContactDetails);
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        return homeCountryNumsSearchResults;
    }
    
    
    public static ArrayList<String> retrieveUserFins(){
        ArrayList<String> userFINS = new ArrayList<String>();
        String sqlQuery ="Select NRIC_No from tbl_user;";
        rs = executeQuery(sqlQuery);
        
        try{
            while(rs.next()){
                String nricNo = rs.getString("NRIC_No");
                userFINS.add(nricNo);
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        return userFINS;
    }
    
    public static ArrayList getHospitals(){
        ArrayList<String> hospitals = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_hospitaltype`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String hospital= rs.getString(2);
                hospitals.add(hospital);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return hospitals;
    }
    
    public static void updateGenderForUser(String FIN_Num, String gender){
        try{
            String sqlQuery = "Update tbl_user "  + "SET Gender = '" + gender + "' where NRIC_No ='" + FIN_Num + "'";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
    }
    
    
    /** Associate Side **/
    public static ArrayList<JobProfile> retrieveJobKeys(String Worker_FIN_Number){
        ArrayList<JobProfile> jobs = new ArrayList<JobProfile>();
        try{
            String sqlQuery = "Select * from tbl_job where Worker_FIN_Number = '" + Worker_FIN_Number + "';";
            rs = executeQuery(sqlQuery);
            while(rs.next()){
                String jobKey = rs.getString("JobKey");
                String employerName = rs.getString("Employer_Name");
                
                JobProfile job = new JobProfile(jobKey, employerName);
                jobs.add(job);
            }
        }catch(Exception err){
            System.out.println("Error : " + err);
        }
        return jobs;
    }
    
    public static ArrayList<String> retrieveProblems2(String FIN, String jobKey) {
        ArrayList<String> problems = new ArrayList<String>();
        try{
            String sqlQuery = "Select * from tbl_problem where Worker_FIN_Number = '" + FIN + "' AND JobKey ='" + jobKey  +"';";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String probKey = rs.getString("ProbKey");
                problems.add(probKey);
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return problems;
    }
    
    public static String getChiefProblem(String FIN, String JobKey) {
        String chiefProblem = null;
        try{
            String query = "Select Chief_Problem from tbl_problem where Worker_FIN_Number = '" + FIN + "' AND JobKey ='" + JobKey  +"';";
            rs = statement.executeQuery(query);
            while(rs.next()){
                chiefProblem = rs.getString("Chief_Problem");
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return chiefProblem;
    }
    
    public static boolean checkJobKey(String JobKey){
        String sqlQuery = "Select * from tbl_job where JobKey = '" + JobKey + "';";
        rs = executeQuery(sqlQuery);
        boolean duplicate = false;
        try{
            while(rs.next()){
                String JobKey2 = rs.getString("JobKey");
                
                
                if(JobKey.equalsIgnoreCase(JobKey2)){
                    duplicate = true;
                }
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return duplicate;
    }
    
    public static void InsertJobDetails(String JobKey,String employer, String passTypeJob, String passOtherTypeJob, String jobsector,String jobsectorother, String occupation, String startDate, String tjs, String remarks,String FIN_Num)
    {
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(currentDate);
            
            String sqlQuery = "Insert into tbl_job(EntryDate,Worker_FIN_Number,JobKey,Employer_Name,Workpass_Type,Workpass_More,Job_Sector,Job_Sector_More,Occupation,Job_Start_Date,Job_End_Date,Job_Whether_TJS,Job_Remarks"
                    + ") Values ('" + formattedDate + "','" + FIN_Num + "','"+ JobKey + "','" + employer + "','" + passTypeJob+ "','" + passOtherTypeJob + "','" + jobsector + "','" +jobsectorother+"','"+ occupation +"','"+startDate+ "','"+""+ "','"+ tjs + "','" + remarks + "')";
            executeUpdate(sqlQuery);
            
        }catch(Exception err) {
            System.out.println("Error : "  + err);
        }
    }
    
    public static boolean checkProbKey(String ProbKey){
        String sqlQuery = "Select * from tbl_problem where ProbKey = '" + ProbKey + "';";
        rs = executeQuery(sqlQuery);
        boolean duplicate = false;
        try{
            while(rs.next()){
                String ProbKey2 = rs.getString("ProbKey");
                
                
                if(ProbKey.equalsIgnoreCase(ProbKey2)){
                    duplicate = true;
                }
                
            }
        }catch(Exception err){
            System.out.println("Error : " +err);
        }
        
        return duplicate;
    }
    
    public static void InsertWorkerPassDetails(String FIN_Num,String JobKey,String workpass,String workpassMore, String passNum,String passIssueDate){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_pass_details(EntryDate,Worker_FIN_Number,JobKey,PassType,PassTypeMore,PassNumber,Pass_Application_Date,Pass_Issue_Date,Pass_Expiry_Date,Pass_Issuer,Pass_Remarks,Pass_Obsolete_Date)VALUES('"
                    + formattedCurrentDate+"','"+ FIN_Num+"','"+ JobKey+"','"+workpass+"','"+workpassMore+"','"+passNum+"',"+"Null"+",'"+passIssueDate+"',"+"Null"+",'"+""+"','"+""+"',"+"Null"+")";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void InsertChiefProblem(String FIN_Num,String JobKey, String ProbKey, String chiefProblem, String chiefProblemOthers, String chiefProblemRemarks){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_problem(EntryDate,Worker_FIN_Number,JobKey,ProbKey,Chief_Problem_Date,Chief_Problem,Chief_Problem_More,Chief_Problem_Remarks)VALUES('"+ formattedCurrentDate+"','"+ FIN_Num+"','"+ JobKey+"','"+ ProbKey+"',"+ "Null"+",'"+ chiefProblem+"','"+ chiefProblemOthers+"','"+chiefProblemRemarks+"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void InsertHospital(String JobKey, String ProbKey, String Hospital, String HospitalOther,String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_hospital(EntryDate,Worker_FIN_Number,JobKey,ProbKey,HospUpdate,HospName,HospNameMore,HospDoctor)VALUES('"+ formattedCurrentDate+"','"+ FIN+"','"+ JobKey+"','"+ ProbKey+"',"+ "Null"+",'"+ Hospital+"','"+ HospitalOther+"','"+ ""+"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    //created by JunYeol for AssociateCreateWorkerServlet,AssociateAddjobnproblemservlet
    /* insert Injury*/
    public static void InsertInjury2(String FIN,String JobKey,String ProbKey, String InjuredBodyParts){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_injury(EntryDate,Worker_FIN_Number,JobKey,ProbKey,Injury_Date, Injury_Time,Injury_Location,Injury_Death,Injury_Body_Part,Injury_How,Injury_Ambulance,Injury_Initial_Treatment,Injury_Initial_Treatment_More,Injury_Work_Related,Injury_Remarks)VALUES('"
                    + formattedCurrentDate+"','"+ FIN+"','"+ JobKey+"','"+ ProbKey+"',"+ "Null"+",'"+ ""+"','"+ ""+"','"+ ""+"','"
                    + InjuredBodyParts+"','"+ ""+"','"+ ""+"','"+ ""+"','"+ ""+"','"+ ""+"','"+""+"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void InsertInjury(String FIN,String JobKey,String ProbKey, String InjuryDate, String InjuredBodyParts){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_injury(EntryDate,Worker_FIN_Number,JobKey,ProbKey,Injury_Date, Injury_Time,Injury_Location,Injury_Death,Injury_Body_Part,Injury_How,Injury_Ambulance,Injury_Initial_Treatment,Injury_Initial_Treatment_More,Injury_Work_Related,Injury_Remarks)VALUES('"
                    + formattedCurrentDate+"','"+ FIN+"','"+ JobKey+"','"+ ProbKey+"','"+ InjuryDate+"','"+ ""+"','"+ ""+"','"+ ""+"','"
                    + InjuredBodyParts+"','"+ ""+"','"+ ""+"','"+ ""+"','"+ ""+"','"+ ""+"','"+""+"')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static void InsertLawyer(String JobKey, String ProbKey, String Lawyer, String LawFirm, String FIN){
        try{
            Date currentDate = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedCurrentDate = df.format(currentDate);
            String sqlQuery = "INSERT INTO tbl_lawyer(EntryDate,JobKey,ProbKey,Lawyer_Update,Lawyer_Have, Lawyer_Firm, Lawyer_Remarks,Worker_FIN_Number)VALUES('"+ formattedCurrentDate+"','"+ JobKey+"','"+ ProbKey+"',"+ "Null"+",'"+Lawyer+"','"+LawFirm+"','"+""+"','"+FIN + "')";
            executeUpdate(sqlQuery);
        }catch(Exception err) {
            System.out.println("Error: " + err);
        }
    }
    
    public static Problem retrieveProblems3(String ProbKey) {
        Problem problem2 = null;
        try{
            String sqlQuery = "Select * from tbl_problem where ProbKey = '" + ProbKey + "';";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String chiefProblem = rs.getString("Chief_Problem");
                String chiefProblemMore = rs.getString("Chief_Problem_More");
                
                problem2 = new Problem(ProbKey,chiefProblem,chiefProblemMore);
                
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return problem2;
    }
    
    public static ArrayList getBenefactionRecordsMealcard(){
        
        ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
            String query = "Select * from tbl_benefaction_mealcard";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                String FIN_Num = rs.getString("Worker_FIN_Number");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num, beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
    }
    
    public static ArrayList getBenefactionRecordsFareGo(){
        
        ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
            String query = "Select * from tbl_benefaction_farego";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                String FIN_Num = rs.getString("Worker_FIN_Number");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num,beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
    }
    
    public static ArrayList getBenefactionRecordsKarunya(){
        
        ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
            String query = "Select * from tbl_benefaction_karunya";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                String FIN_Num = rs.getString("Worker_FIN_Number");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num, beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
    }
    public static ArrayList getR2RRecords(String FIN_Num){
        
        ArrayList<R2R> records = new ArrayList<R2R>();
        try{
            String query = "Select * from tbl_R2R where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                String FIN = rs.getString("Worker_FIN_Number");
                Date R2RDate = rs.getDate("R2RDate");
                String R2RTime = rs.getString("R2RTime");
                String R2RHosp = rs.getString("R2RHosp");
                String R2RDept = rs.getString("R2RDept");
                String R2R1 = rs.getString("R2R1");
                String R2R2 = rs.getString("R2R2");
                String R2RPurpose = rs.getString("R2RPurpose");
                String R2RPreApptNotes = rs.getString("R2RPreApptNotes");
                String R2RPostApptNotes = rs.getString("R2RPostApptNotes");
                String R2RFeedback = rs.getString("R2RFeedback");
                double R2RMedCost = rs.getDouble("R2RMedCost");
                double R2ROutlay = rs.getDouble("R2ROutlay");
                String Worker_FIN_Number = rs.getString("Worker_FIN_Number");
                
                
                R2R  r2r = new R2R(ID, Worker_FIN_Number, R2RDate,R2RTime ,R2RHosp, R2RDept,R2R1, R2R2 ,R2RPurpose, R2RPreApptNotes,R2RPostApptNotes,R2RFeedback,R2RMedCost,R2ROutlay );
                records.add(r2r);
            }
            
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
    }
    
    public static ArrayList getR2RRecords(){
       
            ArrayList<R2R> records = new ArrayList<R2R>();
        try{
            String query = "Select * from tbl_r2r";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                String FIN = rs.getString("Worker_FIN_Number");
                Date R2RDate = rs.getDate("R2RDate");
                String R2RTime = rs.getString("R2RTime");
                String R2RHosp = rs.getString("R2RHosp");
                String R2RDept = rs.getString("R2RDept");
                String R2R1 = rs.getString("R2R1");
                String R2R2 = rs.getString("R2R2");
                String R2RPurpose = rs.getString("R2RPurpose");
                String R2RPreApptNotes = rs.getString("R2RPreApptNotes");
                
                
                R2R r2r = new R2R(ID, FIN, R2RDate,R2RTime ,R2RHosp, R2RDept,R2R1, R2R2 ,R2RPurpose, R2RPreApptNotes);
                records.add(r2r);
            }                                        
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
   }
    
    public static ArrayList<String> getChiefProblems(String FIN, String JobKey) {
        ArrayList<String> problems = new ArrayList<String>();
        try{
            String query = "Select Chief_Problem from tbl_problem where Worker_FIN_Number = '" + FIN + "' AND JobKey ='" + JobKey  +"';";
            rs = statement.executeQuery(query);
            while(rs.next()){
                String chiefProblem = rs.getString("Chief_Problem");
                
                
                problems.add(chiefProblem);
                     
            }
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        return problems;
    }
    
    public static ArrayList<ChiefProblem> retrieveProbKeys(String Worker_FIN_Number){
          ArrayList<ChiefProblem> problems = new ArrayList<ChiefProblem>();
          try{
             String sqlQuery = "Select * from tbl_problem where Worker_FIN_Number = '" + Worker_FIN_Number + "';";
              rs = executeQuery(sqlQuery);
              while(rs.next()){
                  String probKey = rs.getString("ProbKey");
                  String chiefProblem = rs.getString("Chief_Problem");
                  String chiefProblemMore = rs.getString("Chief_Problem_More");
                  
                  ChiefProblem prob = new ChiefProblem(probKey, chiefProblem,chiefProblemMore);
                  problems.add(prob);
              } 
          }catch(Exception err){
              System.out.println("Error : " + err);
          }
          return problems;
      }
    
    public static ArrayList getBenefactionRecordsMealcard(String FIN_Num){
       
            ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
            String query = "Select * from tbl_benefaction_mealcard where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num, beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
   }
    
    public static ArrayList getMealcards(){
        ArrayList<String> mealcards = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_benefactiontype_mealcard`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String mealcard= rs.getString("BeneType");
                mealcards.add(mealcard);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return mealcards;
    }
    
    public static void InsertMealRecord(String RegisterDate,String JobKey, String ProbKey, String Benefit, String SerialNum, String  FIN_Num)
        {
            try{
                
             Date currentDate = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formattedEntryDate = df.format(currentDate);
                String sqlQuery = "INSERT INTO tbl_benefaction_mealcard(EntryDate,Worker_FIN_Number,JobKey,ProbKey,BeneDate,BeneGiver,BeneType,BeneTypeMore,BeneSerial,BenePurpose,BeneRem,BeneValue"
                        + ") Values ('" +formattedEntryDate+ "','"+ FIN_Num + "','"+ JobKey + "','"+ ProbKey + "','" +  RegisterDate +"','"+ "null" + "','" + Benefit + "','" + "null" + "','" + SerialNum + "','" + "null" + "','"+ "null" + "','" +"0.0" +"')";
                executeUpdate(sqlQuery);
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
    public static ArrayList getBenefactionRecordsFareGo(String FIN_Num){
       
            ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
           String query = "Select * from tbl_benefaction_farego where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num,beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
   }
    
    public static ArrayList getFaregos(){
        ArrayList<String> faregos = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_benefactiontype_farego`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String farego= rs.getString(2);
                faregos.add(farego);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return faregos;
    }
    
    public static void InsertFarego2(String RegisterDate,String JobKey, String ProbKey,String Benefit,String SerialNum, String FIN_Num){
            try{
                
                Date currentDate = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formattedEntryDate = df.format(currentDate);
                String sqlQuery = "INSERT INTO tbl_benefaction_farego(EntryDate,Worker_FIN_Number,JobKey,ProbKey,BeneDate,BeneGiver,BeneType,BeneTypeMore,BeneSerial,BenePurpose,BeneRem,BeneValue"
                        + ") Values ('" +formattedEntryDate+ "','"+ FIN_Num + "','"+ JobKey + "','"+ ProbKey + "','" +  RegisterDate +"','"+ "null" + "','" + Benefit + "','" + "null" + "','" + SerialNum + "','" + "null" + "','"+ "null" + "','" +"0.0" +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
     public static void InsertFarego(String RegisterDate,String JobKey, String ProbKey, String Benefit,String SerialNum,String Value, String FIN_Num){
            try{
                
                Date currentDate = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formattedEntryDate = df.format(currentDate);
                String sqlQuery = "INSERT INTO tbl_benefaction_farego(EntryDate,Worker_FIN_Number,JobKey,ProbKey,BeneDate,BeneGiver,BeneType,BeneTypeMore,BeneSerial,BenePurpose,BeneRem,BeneValue"
                        + ") Values ('" +formattedEntryDate+ "','"+ FIN_Num + "','"+ JobKey + "','"+ ProbKey + "','" +  RegisterDate +"','"+ "null" + "','" + Benefit + "','" + "null" + "','" + SerialNum + "','" + "null" + "','"+ "null" + "','" +Value +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
     
     public static ArrayList getBenefactionRecordsKarunya(String FIN_Num){
       
            ArrayList<Benefaction> records = new ArrayList<Benefaction>();
        try{
             String query = "Select * from tbl_benefaction_karunya where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                int ID = rs.getInt("ID");
                Date beneDate = rs.getDate("BeneDate");
                String beneGiver = rs.getString("BeneGiver");
                String beneType = rs.getString("BeneType");
                String beneSerial = rs.getString("BeneSerial");
                String benePurpose = rs.getString("BenePurpose");
                String beneRem = rs.getString("BeneRem");
                String beneValue = rs.getString("BeneValue");
                
                Benefaction benefaction = new Benefaction(ID,FIN_Num, beneDate,beneGiver ,beneType, beneSerial,benePurpose, beneRem ,beneValue);
                records.add(benefaction);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return records;
   }
     
     public static ArrayList getKarunya(){
        ArrayList<String> karunyas = new ArrayList<String>();
        try{
            String sqlQuery = " SELECT * FROM `tbl_benefactiontype_karunya`";
            rs = executeQuery(sqlQuery);
            
            while(rs.next()) {
                String karunya= rs.getString(2);
                karunyas.add(karunya);
            }
        }catch(Exception err){
            System.out.println("Error" + err);
        }
        
        return karunyas;
    }
    
     public static void InsertKarunyaRecord(String RegisterDate,String JobKey, String ProbKey, String Benefit, String SerialNum, String  FIN_Num)
        {
            try{
                
              Date currentDate = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String formattedEntryDate = df.format(currentDate);
                String sqlQuery = "INSERT INTO tbl_benefaction_karunya(EntryDate,Worker_FIN_Number,JobKey,ProbKey,BeneDate,BeneGiver,BeneType,BeneTypeMore,BeneSerial,BenePurpose,BeneRem,BeneValue"
                        + ") Values ('" +formattedEntryDate+ "','"+ FIN_Num + "','"+ JobKey + "','"+ ProbKey + "','" +  RegisterDate +"','"+ "null" + "','" + Benefit + "','" + "null" + "','" + SerialNum + "','" + "null" + "','"+ "null" + "','" +"0.0" +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
     
     public static void InsertR2RRecord(String RegisterDate,String AppointmentTime,String AppointmentHospital ,String AppointmentDoctor, String FirstVolunteer,String SecondVolunteer,String AppointmentPurpose ,String PreAppointmentNotes,String PostAppointmentNotes, String Feedback, String FIN_Num,String JobKey, String ProbKey){
            try{
                
                String sqlQuery = "INSERT INTO tbl_R2R(R2RDate,R2RTime,R2RHosp,R2RDept,R2R1,R2R2,R2RPurpose,R2RPreApptNotes,R2RPostApptNotes,R2RFeedback,R2RMedCost,R2ROutlay"
                        +",Worker_FIN_Number,JobKey,ProbKey) Values ('" + RegisterDate +"','"+ AppointmentTime +"','"+ AppointmentHospital + "','"+ AppointmentDoctor + "','" +  FirstVolunteer +"','"+ SecondVolunteer + "','" + AppointmentPurpose + "','" + PreAppointmentNotes + "','" + PostAppointmentNotes + "','"+ Feedback + "','"+ "0.0" + "','"+ "0.0" + "','"+ FIN_Num + "','"+ JobKey + "','"+ ProbKey +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
     
     public static ChiefProblem getAssociateProblemDetails(String FIN) {
         
        ChiefProblem ProblemDetails = null;
         try{
             String query = "Select * from tbl_problem where Worker_FIN_Number ='"  + FIN + "'";
             rs = statement.executeQuery(query);
             
             while(rs.next()) {
                 String ProblemDate = rs.getString("Chief_Problem_Date");
                 String ChiefProblem = rs.getString("Chief_Problem");
                 String ChiefProblemMore = rs.getString("Chief_Problem_More");
                 String ChiefProblemRemarks = rs.getString("Chief_Problem_Remarks");
                 
                 
                 
                 ProblemDetails = new ChiefProblem(ProblemDate,ChiefProblem,ChiefProblemMore,ChiefProblemRemarks,FIN);
             }
             
             
         }catch(Exception err) {
             System.out.println("Error : " +  err);
         }
        return ProblemDetails;
    }
     
     public static ArrayList getLeadCaseWorkers(String FIN_Num){
       
            ArrayList<CaseWorker> workers = new ArrayList<CaseWorker>();
        try{
            String query = "Select * from tbl_leadcaseworker where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String leadCaseWorker = rs.getString("leadCaseWorker");
                String leadStart = rs.getString("leadStart");
                String leadEnd = rs.getString("leadEnd");
                
                CaseWorker CaseWorker1 = new CaseWorker(leadCaseWorker ,leadStart,leadEnd, FIN_Num);
                workers.add(CaseWorker1);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return workers;
   }
    public static ArrayList getAuxillaryWorker (String FIN_Num){
       
            ArrayList<AuxillaryCaseWorker> workers = new ArrayList<AuxillaryCaseWorker>();
        try{
            String query = "Select * from tbl_auxillarycaseworker where Worker_FIN_Number = '" + FIN_Num + "'";
            rs = statement.executeQuery(query);
            
            while(rs.next()) {
                String AuxName = rs.getString("AuxName");
                String AuxStart = rs.getString("AuxStart");
                String AuxEnd = rs.getString("AuxEnd");
                
                AuxillaryCaseWorker CaseWorker1 = new AuxillaryCaseWorker(AuxName ,AuxStart,AuxEnd, FIN_Num);
                workers.add(CaseWorker1);
            }
           
        }catch(Exception err) {
            System.out.println("Error : " + err);
        }
        
        return workers;
   }
    
    public Pass getPassDetails4(String JobKey) {
         Pass passDetails = null;
         try{
             String query = "Select * from tbl_pass_details where JobKey ='"  + JobKey + "'";
             rs = statement.executeQuery(query);
             
             while(rs.next()) {
                String passType =  rs.getString("PassType");
                 String passTypeMore = rs.getString("PassTypeMore");
                 String passNumber =  rs.getString("PassNumber");
                 String passIssueDate = rs.getString("Pass_Issue_Date");
                 String passApplicationDate = rs.getString("Pass_Application_Date");
                 String passExpiryDate = rs.getString("Pass_Expiry_Date");
                 String passIssuer = rs.getString("Pass_Issuer");
                 String passRemarks = rs.getString("Pass_Remarks");
                 String passObsoleteDate = rs.getString("Pass_Obsolete_Date");
                 
                passDetails = new Pass(FIN,passType,passTypeMore,passNumber,passIssueDate,passApplicationDate,passExpiryDate,passIssuer,passRemarks,passObsoleteDate);
                }
             
             
         }catch(Exception err) {
             System.out.println("Error : " +  err);
         }
        return passDetails;
    }
    
    public static void associateInsertPassDetails(String JobKey, String passType,String otherPass,String passNumber, String passIssueDate, String FIN){
          try{
              Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedDate = df.format(currentDate);
              String sqlQuery = "Insert Into tbl_pass_details (EntryDate,JobKey,Worker_FIN_Number,PassType,PassTypeMore,PassNumber,Pass_Issue_Date) VALUES "
                      + "(' " + formattedDate + "','" + JobKey + "','" + FIN + "','" + passType +"','" + otherPass +  "','" + passNumber + "','" + passIssueDate + "');";
              executeUpdate(sqlQuery);
              
          }catch(Exception err) {
              System.out.println("Error : " + err);
          }
      }
    
    public static void insertHospitalDetails(String JobKey, String ProbKey, String updateDate,String currentHospital,String otherHospital, String doctor, String FIN){
          try{
              Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedDate = df.format(currentDate);
              String sqlQuery = "Insert Into tbl_hospital (EntryDate,Worker_FIN_Number,JobKey,ProbKey,HospUpdate,HospName,HospNameMore,HospDoctor) VALUES "
                      + "('" + formattedDate + "','" + FIN + "','" + JobKey + "','"+ ProbKey + "','"+ updateDate + "','"+ currentHospital + "','"  + otherHospital  + "','" + doctor  + "');";
              executeUpdate(sqlQuery);
              
          }catch(Exception err) {
              System.out.println("Error : " + err);
          }
      }
    
    public static void associateInsertMCDetails(String JobKey, String ProbKey, String DateOfMC, String CurrentMCStatus,String CurrentMCStatusOther, String MCExpiryDate,int CumulativeMCDays,String MCRemarks,String FIN){
            try{
                 Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedDate = df.format(currentDate);
                
                String sqlQuery = "Insert into tbl_mc_status (EntryDate,Worker_FIN_Number,JobKey,ProbKey,MCUpdate,MCStatus,MCStatusMore,MCExpDate,MCDaysCumul,"
                        + "MCRem) Values ('" + formattedDate + "','" + FIN + "','" + JobKey + "','"+ ProbKey + "','"+ DateOfMC + "','" + CurrentMCStatus + "','"+ CurrentMCStatusOther+ "','" + MCExpiryDate + "','"+ CumulativeMCDays+ "','"+ MCRemarks +"');";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
    public static void insertWICADetails(String JobKey, String ProbKey, String DateOfUpdate, String CurrentWicaStatus,String CurrentWicaStatusOther, String WicaPoints, String WicaCompensation, String WicaRemarks,String FIN)
        {
            try{
                Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedCurrentDate = df.format(currentDate);
                String sqlQuery = "Insert into tbl_wica(EntryDate,Worker_FIN_Number,JobKey,ProbKey,WicamonUpdate,WicamonStatus,WicamonStatusMore,WicamonPoints,WicamonDollars,WicamonRemarks"
                        + ") Values ('" + formattedCurrentDate + "','" + FIN+ "','"+ JobKey+ "','"+ ProbKey+ "','"+ DateOfUpdate+ "','"+ CurrentWicaStatus+ "','" + CurrentWicaStatusOther+ "','" + WicaPoints + "','"+ WicaCompensation + "','"+ WicaRemarks +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
    public static void insertWICAClaimDetails(String JobKey,String ProbKey,String FIN, String WicaMOMDate, String WicaRefNumber,String InsuranceCompany, String InsurancePolicyNumber)
        {
            try{
                 Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedCurrentDate = df.format(currentDate);
                String sqlQuery = "Insert into tbl_wica_claim(EntryDate,Worker_FIN_Number,JobKey,ProbKey,WicaClaimDate,WicaRefNbr,WicaInsurer,WicaPolicyNbr"
                        + ") Values ('" + formattedCurrentDate + "','" + FIN+ "','"+ JobKey+ "','"+ ProbKey+ "','" + WicaMOMDate + "','" + WicaRefNumber+ "','" + InsuranceCompany + "','"+ InsurancePolicyNumber +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
    public static void insertLawyerDetails(String JobKey, String ProbKey, String lawyerUpdate,String haveLawyer,String lawFirmName, String lawyerStatusRemarks, String FIN){
          try{
              Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedCurrentDate = df.format(currentDate);
              String sqlQuery = "Insert Into tbl_lawyer(EntryDate,JobKey,ProbKey,Lawyer_Update,Lawyer_Have,Lawyer_Firm,Lawyer_Remarks,Worker_FIN_Number) VALUES "
                      + "('" + formattedCurrentDate + "','" + JobKey + "','"   + ProbKey  + "','" + lawyerUpdate + "','" + haveLawyer+ "','" + lawFirmName + "','" + lawyerStatusRemarks + "','" +  FIN + "');";
              executeUpdate(sqlQuery);
              
          }catch(Exception err) {
              System.out.println("Error : " + err);
          }
      }
    
    public static void insertMilestoneDetails(String JobKey, String ProbKey,String DateOfUpdate,String Milestone, String MilestoneOther, String Remarks, String FIN)
        {
            try{
            Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedCurrentDate = df.format(currentDate);
                
                String sqlQuery = "Insert into tbl_casemilestone_noncriminal (EntryDate,Worker_FIN_Number,JobKey,ProbKey,MilesNCDate,MilesNCReached,MilesNCReachedMore,MilesCrCharges"
                        + ",MilesCrSentence, MilesCrRem) Values ('" + formattedCurrentDate + "','" + FIN+ "','"+ JobKey+ "','"+ ProbKey+ "','"+ DateOfUpdate + "','" + Milestone+ "','" + MilestoneOther + "','"+ "null" + "','" + "null" + "','" + Remarks +"')";
                
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
    
    public static void insertTransferDetails(String JobKey,String ProbKey, String DateOfUpdate, String TransferStatus, String TransferOther, String DepartureDate, String TJSName, String TJSDescription,String TJSRemarks, String FIN)
        {
            try{
                Date currentDate = new Date();
              SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
              String formattedCurrentDate = df.format(currentDate);
                String sqlQuery = "Insert into tbl_ttr(EntryDate,JobKey,ProbKey,TtrUpdate,TtrStatus,TtrStatusMore,DepartureDate,NameNewEmployer,NewJob,TtrRem"
                        + ",Worker_FIN_Number) Values ('" + formattedCurrentDate + "','" + JobKey+ "','"+ ProbKey+ "','" + DateOfUpdate + "','" + TransferStatus+ "','" + TransferOther+ "','"+ DepartureDate + "','"+ TJSName + "','"+ TJSDescription + "','"+ TJSRemarks + "','" +  FIN +"')";
                executeUpdate(sqlQuery);
                
            }catch(Exception err) {
                System.out.println("Error : "  + err);
            }
        }
}







