/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class ContactDetails {
    
    private String sgPhoneNumber;
    private String sgPhoneObsoleteDate;
    private String homeCountryTelephoneNumber;
    private String ownerOfNumber;
    private String homePhoneObsolete;
    private String sgHomeAddress;
    private String sgHomeAddressObsoleteDate;
    private String homeAddress;
    private String homeAddressObsoleteDate;
    
    public ContactDetails(String sgPhoneNumber, String sgPhoneObsoleteDate, String homeCountryTelephoneNumber,String ownerOfNumber, String homePhoneObsolete, String sgHomeAddress, String sgHomeAddressObsolete, String homeAddress, String homeAddressObsolete){
        this.sgPhoneNumber = sgPhoneNumber;
        this.sgPhoneObsoleteDate = sgPhoneObsoleteDate;
        this.homeCountryTelephoneNumber = homeCountryTelephoneNumber;
        this.ownerOfNumber = ownerOfNumber;
        this.homePhoneObsolete = homePhoneObsolete;
        this.sgHomeAddress = sgHomeAddress;
        this.sgHomeAddressObsoleteDate = sgHomeAddressObsolete;
        this.homeAddress = homeAddress;
        this.homeAddressObsoleteDate = homeAddressObsolete;
    }

    /**
     * @return the sgPhoneNumber
     */
    public String getSgPhoneNumber() {
        return sgPhoneNumber;
    }

    /**
     * @param sgPhoneNumber the sgPhoneNumber to set
     */
    public void setSgPhoneNumber(String sgPhoneNumber) {
        this.sgPhoneNumber = sgPhoneNumber;
    }

    /**
     * @return the sgPhoneObsoleteDate
     */
    public String getSgPhoneObsoleteDate() {
        return sgPhoneObsoleteDate;
    }

    /**
     * @param sgPhoneObsoleteDate the sgPhoneObsoleteDate to set
     */
    public void setSgPhoneObsoleteDate(String sgPhoneObsoleteDate) {
        this.sgPhoneObsoleteDate = sgPhoneObsoleteDate;
    }

    /**
     * @return the homeCountryTelephoneNumber
     */
    public String getHomeCountryTelephoneNumber() {
        return homeCountryTelephoneNumber;
    }

    /**
     * @param homeCountryTelephoneNumber the homeCountryTelephoneNumber to set
     */
    public void setHomeCountryTelephoneNumber(String homeCountryTelephoneNumber) {
        this.homeCountryTelephoneNumber = homeCountryTelephoneNumber;
    }

    /**
     * @return the ownerOfNumber
     */
    public String getOwnerOfNumber() {
        return ownerOfNumber;
    }

    /**
     * @param ownerOfNumber the ownerOfNumber to set
     */
    public void setOwnerOfNumber(String ownerOfNumber) {
        this.ownerOfNumber = ownerOfNumber;
    }

    /**
     * @return the homePhoneObsolete
     */
    public String getHomePhoneObsolete() {
        return homePhoneObsolete;
    }

    /**
     * @param homePhoneObsolete the homePhoneObsolete to set
     */
    public void setHomePhoneObsolete(String homePhoneObsolete) {
        this.homePhoneObsolete = homePhoneObsolete;
    }

    /**
     * @return the sgHomeAddress
     */
    public String getSgHomeAddress() {
        return sgHomeAddress;
    }

    /**
     * @param sgHomeAddress the sgHomeAddress to set
     */
    public void setSgHomeAddress(String sgHomeAddress) {
        this.sgHomeAddress = sgHomeAddress;
    }

    /**
     * @return the sgHomeAddressObsoleteDate
     */
    public String getSgHomeAddressObsoleteDate() {
        return sgHomeAddressObsoleteDate;
    }

    /**
     * @param sgHomeAddressObsoleteDate the sgHomeAddressObsoleteDate to set
     */
    public void setSgHomeAddressObsoleteDate(String sgHomeAddressObsoleteDate) {
        this.sgHomeAddressObsoleteDate = sgHomeAddressObsoleteDate;
    }

    /**
     * @return the homeAddress
     */
    public String getHomeAddress() {
        return homeAddress;
    }

    /**
     * @param homeAddress the homeAddress to set
     */
    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }

    /**
     * @return the homeAddressObsoleteDate
     */
    public String getHomeAddressObsoleteDate() {
        return homeAddressObsoleteDate;
    }

    /**
     * @param homeAddressObsoleteDate the homeAddressObsoleteDate to set
     */
    public void setHomeAddressObsoleteDate(String homeAddressObsoleteDate) {
        this.homeAddressObsoleteDate = homeAddressObsoleteDate;
    }
}
