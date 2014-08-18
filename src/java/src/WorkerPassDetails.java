/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package src;

/**
 *
 * @author keemin.chew.2010
 */
public class WorkerPassDetails {
    
    
    private String FIN_Num;
    private String registrationDate;
    private String passType;
    private String otherPassType;
    private String passNumber;
    private String passIssueDate;
    
    
    public WorkerPassDetails(String FIN_Num,String registrationDate, String passType,String passNumber,String passIssueDate) {
        this.FIN_Num = FIN_Num;
        this.registrationDate = registrationDate;
        this.passType = passType;
        this.passNumber = passNumber;
        this.passIssueDate = passIssueDate;
    }

    /**
     * @return the registrationDate
     */
    public String getRegistrationDate() {
        return registrationDate;
    }

    /**
     * @param registrationDate the registrationDate to set
     */
    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    /**
     * @return the passType
     */
    public String getPassType() {
        return passType;
    }

    /**
     * @param passType the passType to set
     */
    public void setPassType(String passType) {
        this.passType = passType;
    }

    /**
     * @return the otherPassType
     */
    public String getOtherPassType() {
        return otherPassType;
    }

    /**
     * @param otherPassType the otherPassType to set
     */
    public void setOtherPassType(String otherPassType) {
        this.otherPassType = otherPassType;
    }

    /**
     * @return the passNumber
     */
    public String getPassNumber() {
        return passNumber;
    }

    /**
     * @param passNumber the passNumber to set
     */
    public void setPassNumber(String passNumber) {
        this.passNumber = passNumber;
    }

    /**
     * @return the passIssueDate
     */
    public String getPassIssueDate() {
        return passIssueDate;
    }

    /**
     * @param passIssueDate the passIssueDate to set
     */
    public void setPassIssueDate(String passIssueDate) {
        this.passIssueDate = passIssueDate;
    }

    /**
     * @return the FIN_Num
     */
    public String getFIN_Num() {
        return FIN_Num;
    }

    /**
     * @param FIN_Num the FIN_Num to set
     */
    public void setFIN_Num(String FIN_Num) {
        this.FIN_Num = FIN_Num;
    }
    
}
