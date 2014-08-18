/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerSGContactDetails {
    private String phoneNumber;
    private String phoneObsoleteDate;
    private String FIN_Number;
    
    public WorkerSGContactDetails(String phoneNumber, String phoneObsoleteDate, String FIN_Number){
        this.phoneNumber = phoneNumber;
        this.phoneObsoleteDate = phoneObsoleteDate;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the phoneObsoleteDate
     */
    public String getPhoneObsoleteDate() {
        return phoneObsoleteDate;
    }

    /**
     * @param phoneObsoleteDate the phoneObsoleteDate to set
     */
    public void setPhoneObsoleteDate(String phoneObsoleteDate) {
        this.phoneObsoleteDate = phoneObsoleteDate;
    }

    /**
     * @return the FIN_Number
     */
    public String getFIN_Number() {
        return FIN_Number;
    }

    /**
     * @param FIN_Number the FIN_Number to set
     */
    public void setFIN_Number(String FIN_Number) {
        this.FIN_Number = FIN_Number;
    }
}
