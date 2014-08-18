/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class VerbalAssurance {
    private String giverName;
    private String giverRelationship;
    private String givenDate;
    private String givenPlace;
    private String FIN_Number;
    
    public VerbalAssurance(String giverName, String giverRelationship, String givenDate, String givenPlace, String FIN_Number){
        this.giverName = giverName;
        this.giverRelationship = giverRelationship;
        this.givenDate = givenDate;
        this.givenPlace = givenPlace;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the giverName
     */
    public String getGiverName() {
        return giverName;
    }

    /**
     * @param giverName the giverName to set
     */
    public void setGiverName(String giverName) {
        this.giverName = giverName;
    }

    /**
     * @return the giverRelationship
     */
    public String getGiverRelationship() {
        return giverRelationship;
    }

    /**
     * @param giverRelationship the giverRelationship to set
     */
    public void setGiverRelationship(String giverRelationship) {
        this.giverRelationship = giverRelationship;
    }

    /**
     * @return the givenDate
     */
    public String getGivenDate() {
        return givenDate;
    }

    /**
     * @param givenDate the givenDate to set
     */
    public void setGivenDate(String givenDate) {
        this.givenDate = givenDate;
    }

    /**
     * @return the givenPlace
     */
    public String getGivenPlace() {
        return givenPlace;
    }

    /**
     * @param givenPlace the givenPlace to set
     */
    public void setGivenPlace(String givenPlace) {
        this.givenPlace = givenPlace;
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
