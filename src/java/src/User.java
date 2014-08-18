/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;


/**
 *
 * @author nhyupa.2010
 */
public class User {
    private String NRIC_No = null;
    private String fullName = null;
    private String alias = null;
    private String userName = null;
    private String password = null;
    private String emailAddress = null;
    private String mobileNumber = null;
    private String gender = null;
    private String jobTitle = null;
    private String photo = null;
    
    
    //Testing purpose:
    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }
    public User(String NRIC_No, String fullName,  String userName, String password, String emailAddress, String mobileNumber, String gender, String jobTitle) {
        this.NRIC_No = NRIC_No;
        this.fullName = fullName;
        
        this.userName = userName;
        this.password = password;
        this.emailAddress = emailAddress;
        this.mobileNumber = mobileNumber;
        this.gender  = gender;
        this.jobTitle = jobTitle;
    
    }
    
    public User(String NRIC_No, String fullName, String alias, String userName, String password, String emailAddress, String mobileNumber, String gender, String jobTitle, String photo) {
        this.NRIC_No = NRIC_No;
        this.fullName = fullName;
        this.alias = alias;
        this.userName = userName;
        this.password = password;
        this.emailAddress = emailAddress;
        this.mobileNumber = mobileNumber;
        this.gender  = gender;
        this.jobTitle = jobTitle;
        this.photo = photo;
    
    }
    
    public String getNRICNum() {
        return NRIC_No;
    }
    
    public String getfullName() {
        return fullName;
    }
    
    public String getAlias(){
        return alias;
    }
    
    public String getUsername() {
        return userName;
    }
    
    public String getPassword() {
        return password;
    }
    
    public String getEmailAddress() {
        return emailAddress;
    }
    
    public String getMobileNumber() {
        return mobileNumber;
    }
    
    public String getGender() {
        return gender;
    }
    
    public String getJobTitle() {
        return jobTitle;
    }
    public String getPhoto() {
        return photo;
    }
    
    public void setNRICNum(String NRIC_No) {
        this.NRIC_No = NRIC_No;
    }
    
    public void setfullName(String fullName) {
        this.fullName = fullName;
    }
    
    public void setAlias(String alias){
        this.alias = alias;
    }
    public void setUsername(String userName) {
        this.userName = userName;
    }
    
    public void setPasword (String password) {
        this.password = password;
    }
    
    public void setEmailAddress (String emailAddress){
        this.emailAddress = emailAddress;
    }
    
    public void setMobileNumber (String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    
}
