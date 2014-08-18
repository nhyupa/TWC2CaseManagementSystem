/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Passport {
    
    private String country = null;
    private String passportNumber = null;
    private String passportIssueDate = null;
    private String passportExpiryDate = null;
    private String FIN_Number = null;
    
    
    
    public Passport(String country, String passportNumber, String passportIssueDate, String passportExpiryDate, String FIN_Number){
        this.country = country;
        this.passportNumber = passportNumber;
        this.passportIssueDate = passportIssueDate;
        this.passportExpiryDate = passportExpiryDate;
        this.FIN_Number = FIN_Number;
        
    }
    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    
    
    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return the passportNumber
     */
    public String getPassportNumber() {
        return passportNumber;
    }

    /**
     * @param passportNumber the passportNumber to set
     */
    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    /**
     * @return the passportIssueDate
     */
    public String getPassportIssueDate() {
        return passportIssueDate;
    }

    /**
     * @param passportIssueDate the passportIssueDate to set
     */
    public void setPassportIssueDate(String passportIssueDate) {
        this.passportIssueDate = passportIssueDate;
    }

    /**
     * @return the passportExpiryDate
     */
    public String getPassportExpiryDate() {
        return passportExpiryDate;
    }

    /**
     * @param passportExpiryDate the passportExpiryDate to set
     */
    public void setPassportExpiryDate(String passportExpiryDate) {
        this.passportExpiryDate = passportExpiryDate;
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
