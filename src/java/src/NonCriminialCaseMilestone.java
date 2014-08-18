/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class NonCriminialCaseMilestone {
     private String dateMilestoneReached;
     private String milestoneReached;
     private String milestoneOther;
     private String mileCrCharges;
     private String mileCrSentences;
     private String milestoneRemarks;
     private String FIN_Number;
     
     
     public NonCriminialCaseMilestone(String dateMilestoneReached, String milestoneReached, String milestoneOther, String mileCrCharges, String mileCrSentences, String milestoneRemarks, String FIN_Number){
         this.dateMilestoneReached = dateMilestoneReached;
         this.milestoneReached = milestoneReached;
         this.milestoneOther = milestoneOther;
         this.mileCrCharges = mileCrCharges;
         this.mileCrSentences = mileCrSentences;
         this.milestoneRemarks = milestoneRemarks;
         this.FIN_Number = FIN_Number;
     }
     public NonCriminialCaseMilestone(String dateMilestoneReached, String milestoneReached, String milestoneOther, String milestoneRemarks,String FIN_Number){
         this.dateMilestoneReached = dateMilestoneReached;
         this.milestoneReached = milestoneReached;
         this.milestoneOther = milestoneOther;
         this.milestoneRemarks = milestoneRemarks;
         this.FIN_Number = FIN_Number;
         
     }

    /**
     * @return the dateMilestoneReached
     */
    public String getDateMilestoneReached() {
        return dateMilestoneReached;
    }

    /**
     * @param dateMilestoneReached the dateMilestoneReached to set
     */
    public void setDateMilestoneReached(String dateMilestoneReached) {
        this.dateMilestoneReached = dateMilestoneReached;
    }

    /**
     * @return the milestoneReached
     */
    public String getMilestoneReached() {
        return milestoneReached;
    }

    /**
     * @param milestoneReached the milestoneReached to set
     */
    public void setMilestoneReached(String milestoneReached) {
        this.milestoneReached = milestoneReached;
    }

    /**
     * @return the milestoneOther
     */
    public String getMilestoneOther() {
        return milestoneOther;
    }

    /**
     * @param milestoneOther the milestoneOther to set
     */
    public void setMilestoneOther(String milestoneOther) {
        this.milestoneOther = milestoneOther;
    }

    /**
     * @return the milestoneRemarks
     */
    public String getMilestoneRemarks() {
        return milestoneRemarks;
    }

    /**
     * @param milestoneRemarks the milestoneRemarks to set
     */
    public void setMilestoneRemarks(String milestoneRemarks) {
        this.milestoneRemarks = milestoneRemarks;
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

    /**
     * @return the mileCrCharges
     */
    public String getMileCrCharges() {
        return mileCrCharges;
    }

    /**
     * @param mileCrCharges the mileCrCharges to set
     */
    public void setMileCrCharges(String mileCrCharges) {
        this.mileCrCharges = mileCrCharges;
    }

    /**
     * @return the mileCrSentences
     */
    public String getMileCrSentences() {
        return mileCrSentences;
    }

    /**
     * @param mileCrSentences the mileCrSentences to set
     */
    public void setMileCrSentences(String mileCrSentences) {
        this.mileCrSentences = mileCrSentences;
    }
}
