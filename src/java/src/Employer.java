/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class Employer {
    private String employerName;
    private String employerAddress;
    private String employerContacts;
    private String employerKeyPersons;
    private String FIN;
    
    public Employer(String employerName,String employerAddress, String employerContacts, String employerKeyPersons, String FIN){
        this.employerName = employerName;
        this.employerAddress = employerAddress;
        this.employerContacts = employerContacts;
        this.employerKeyPersons = employerKeyPersons;
        this.FIN = FIN;
    }  

    /**
     * @return the employerName
     */
    public String getEmployerName() {
        return employerName;
    }

    /**
     * @param employerName the employerName to set
     */
    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    /**
     * @return the employerAddress
     */
    public String getEmployerAddress() {
        return employerAddress;
    }

    /**
     * @param employerAddress the employerAddress to set
     */
    public void setEmployerAddress(String employerAddress) {
        this.employerAddress = employerAddress;
    }

    /**
     * @return the employerContacts
     */
    public String getEmployerContacts() {
        return employerContacts;
    }

    /**
     * @param employerContacts the employerContacts to set
     */
    public void setEmployerContacts(String employerContacts) {
        this.employerContacts = employerContacts;
    }

    /**
     * @return the employerKeyPersons
     */
    public String getEmployerKeyPersons() {
        return employerKeyPersons;
    }

    /**
     * @param employerKeyPersons the employerKeyPersons to set
     */
    public void setEmployerKeyPersons(String employerKeyPersons) {
        this.employerKeyPersons = employerKeyPersons;
    }

    /**
     * @return the FIN
     */
    public String getFIN() {
        return FIN;
    }

    /**
     * @param FIN the FIN to set
     */
    public void setFIN(String FIN) {
        this.FIN = FIN;
    }
}
