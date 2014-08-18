/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class HomeCountryContactDetails {
    private String homePhoneNumber;
    private String homePhoneOwner;
    private String homePhoneObsoleteDate;
    private String FIN_Number;
    
    public HomeCountryContactDetails(String homePhoneNumber, String homePhoneOwner, String homePhoneObsoleteDate, String FIN_Number){
        this.homePhoneNumber = homePhoneNumber;
        this.homePhoneOwner = homePhoneOwner;
        this.homePhoneObsoleteDate = homePhoneObsoleteDate;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the homePhoneNumber
     */
    public String getHomePhoneNumber() {
        return homePhoneNumber;
    }

    /**
     * @param homePhoneNumber the homePhoneNumber to set
     */
    public void setHomePhoneNumber(String homePhoneNumber) {
        this.homePhoneNumber = homePhoneNumber;
    }

    /**
     * @return the homePhoneOwner
     */
    public String getHomePhoneOwner() {
        return homePhoneOwner;
    }

    /**
     * @param homePhoneOwner the homePhoneOwner to set
     */
    public void setHomePhoneOwner(String homePhoneOwner) {
        this.homePhoneOwner = homePhoneOwner;
    }

    /**
     * @return the homePhoneObsoleteDate
     */
    public String getHomePhoneObsoleteDate() {
        return homePhoneObsoleteDate;
    }

    /**
     * @param homePhoneObsoleteDate the homePhoneObsoleteDate to set
     */
    public void setHomePhoneObsoleteDate(String homePhoneObsoleteDate) {
        this.homePhoneObsoleteDate = homePhoneObsoleteDate;
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
