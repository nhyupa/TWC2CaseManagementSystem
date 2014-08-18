/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;


/**
 *
 * @author nhyupa.2010
 */
public class Pass {
    
    private String FIN = null;
    private String passType = null;
    private String passTypeMore = null;
    private String passNumber = null;
    private String passApplicationDate = null;
    private String passIssueDate = null;
    private String passExpiryDate = null;
    private String passIssuer  = null;
    private String passRemarks = null;
    private String passObsoleteDate = null;
    
    public Pass(String FIN,String passType,String passTypeMore,String passNumber,String passApplicationDate,String passIssueDate,String passExpiryDate,String passIssuer,String passRemarks,String passObsoleteDate){
        this.FIN = FIN;
        this.passType = passType;
        this.passTypeMore = passTypeMore;
        this.passNumber = passNumber;
        this.passIssueDate = passIssueDate;
        this.passApplicationDate = passApplicationDate;
        this.passExpiryDate = passExpiryDate;
        this.passIssuer = passIssuer;
        this.passRemarks = passRemarks;
        this.passObsoleteDate  = passObsoleteDate;
    }
    public Pass(String FIN, String passType, String passNumber,String passIssueDate, String passObsoleteDate){
        this.FIN = FIN;
        this.passType = passType;
        this.passNumber = passNumber;
        this.passIssueDate = passIssueDate;
        this.passObsoleteDate = passObsoleteDate;
    }
    public Pass(String FIN,String passType,String passNumber,String passApplicationDate,String passExpiryDate,String passIssuer,String passRemarks,String passObsoleteDate){
        
        this.FIN = FIN;
        this.passType = passType;
        this.passNumber = passNumber;
        this.passApplicationDate = passApplicationDate;
        this.passExpiryDate = passExpiryDate;
        this.passIssuer = passIssuer;
        this.passRemarks = passRemarks;
        this.passObsoleteDate  = passObsoleteDate;
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
     * @return the passApplicationDate
     */
    public String getPassApplicationDate() {
        return passApplicationDate;
    }

    /**
     * @param passApplicationDate the passApplicationDate to set
     */
    public void setPassApplicationDate(String passApplicationDate) {
        this.passApplicationDate = passApplicationDate;
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
     * @return the passExpiryDate
     */
    public String getPassExpiryDate() {
        return passExpiryDate;
    }

    /**
     * @param passExpiryDate the passExpiryDate to set
     */
    public void setPassExpiryDate(String passExpiryDate) {
        this.passExpiryDate = passExpiryDate;
    }

    /**
     * @return the passIssuer
     */
    public String getPassIssuer() {
        return passIssuer;
    }

    /**
     * @param passIssuer the passIssuer to set
     */
    public void setPassIssuer(String passIssuer) {
        this.passIssuer = passIssuer;
    }

    /**
     * @return the passRemarks
     */
    public String getPassRemarks() {
        return passRemarks;
    }

    /**
     * @param passRemarks the passRemarks to set
     */
    public void setPassRemarks(String passRemarks) {
        this.passRemarks = passRemarks;
    }

    /**
     * @return the passObsoleteDate
     */
    public String getPassObsoleteDate() {
        return passObsoleteDate;
    }

    /**
     * @param passObsoleteDate the passObsoleteDate to set
     */
    public void setPassObsoleteDate(String passObsoleteDate) {
        this.passObsoleteDate = passObsoleteDate;
    }

    /**
     * @return the passTypeMore
     */
    public String getPassTypeMore() {
        return passTypeMore;
    }

    /**
     * @param passTypeMore the passTypeMore to set
     */
    public void setPassTypeMore(String passTypeMore) {
        this.passTypeMore = passTypeMore;
    }

   
}
