/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerFriendDetails {
    private String FIN;
    private String friendSgName;
    private String friendSgPhone;
    private String friendSgRelationship;
    private String friendSgRemarks;
    private String friendSgObsoleteDate;
    
    public WorkerFriendDetails(String FIN, String friendSgName, String friendSgPhone, String friendSgRelationship, String friendSgRemarks, String friendSgObsoleteDate){
        this.FIN = FIN;
        this.friendSgName = friendSgName;
        this.friendSgPhone = friendSgPhone;
        this.friendSgRelationship = friendSgRelationship;
        this.friendSgRemarks = friendSgRemarks;
        this.friendSgObsoleteDate = friendSgObsoleteDate;
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

    /**
     * @return the friendSgName
     */
    public String getFriendSgName() {
        return friendSgName;
    }

    /**
     * @param friendSgName the friendSgName to set
     */
    public void setFriendSgName(String friendSgName) {
        this.friendSgName = friendSgName;
    }

    /**
     * @return the friendSgPhone
     */
    public String getFriendSgPhone() {
        return friendSgPhone;
    }

    /**
     * @param friendSgPhone the friendSgPhone to set
     */
    public void setFriendSgPhone(String friendSgPhone) {
        this.friendSgPhone = friendSgPhone;
    }

    /**
     * @return the friendSgRelationship
     */
    public String getFriendSgRelationship() {
        return friendSgRelationship;
    }

    /**
     * @param friendSgRelationship the friendSgRelationship to set
     */
    public void setFriendSgRelationship(String friendSgRelationship) {
        this.friendSgRelationship = friendSgRelationship;
    }

    /**
     * @return the friendSgRemarks
     */
    public String getFriendSgRemarks() {
        return friendSgRemarks;
    }

    /**
     * @param friendSgRemarks the friendSgRemarks to set
     */
    public void setFriendSgRemarks(String friendSgRemarks) {
        this.friendSgRemarks = friendSgRemarks;
    }

    /**
     * @return the friendSgObsoleteDate
     */
    public String getFriendSgObsoleteDate() {
        return friendSgObsoleteDate;
    }

    /**
     * @param friendSgObsoleteDate the friendSgObsoleteDate to set
     */
    public void setFriendSgObsoleteDate(String friendSgObsoleteDate) {
        this.friendSgObsoleteDate = friendSgObsoleteDate;
    }
}
