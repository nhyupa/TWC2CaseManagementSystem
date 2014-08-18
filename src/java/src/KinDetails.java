/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class KinDetails {
    private String kinName;
    private String kinRelationship;
    private String kinPhone;
    private String kinObsoleteDate;
    
    public KinDetails(String kinName, String kinRelationship, String kinPhone, String kinObsoleteDate) {
        this.kinName = kinName;
        this.kinRelationship = kinRelationship;
        this.kinPhone = kinPhone;
        this.kinObsoleteDate = kinObsoleteDate;
    }

    /**
     * @return the kinName
     */
    public String getKinName() {
        return kinName;
    }

    /**
     * @param kinName the kinName to set
     */
    public void setKinName(String kinName) {
        this.kinName = kinName;
    }

    /**
     * @return the kinRelationship
     */
    public String getKinRelationship() {
        return kinRelationship;
    }

    /**
     * @param kinRelationship the kinRelationship to set
     */
    public void setKinRelationship(String kinRelationship) {
        this.kinRelationship = kinRelationship;
    }

    /**
     * @return the kinPhone
     */
    public String getKinPhone() {
        return kinPhone;
    }

    /**
     * @param kinPhone the kinPhone to set
     */
    public void setKinPhone(String kinPhone) {
        this.kinPhone = kinPhone;
    }

    /**
     * @return the kinObsoleteDate
     */
    public String getKinObsoleteDate() {
        return kinObsoleteDate;
    }

    /**
     * @param kinObsoleteDate the kinObsoleteDate to set
     */
    public void setKinObsoleteDate(String kinObsoleteDate) {
        this.kinObsoleteDate = kinObsoleteDate;
    }
}
