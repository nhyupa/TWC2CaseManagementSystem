/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class AggravatingIssue {
    private String aggravatingIssue;
    private String aggravatingIssueMore;
    private String monetaryLoss;
    private String aggravatingIssueRemarks;
    private String FIN_Number;
    private String JobKey;
    private String ProbKey;
    
    public AggravatingIssue(String aggravatingIssue, String aggravatingIssueMore, String monetaryLoss, String aggravatingIssueRemarks, String FIN_Number, String JobKey, String ProbKey){
        this.aggravatingIssue = aggravatingIssue;
        this.aggravatingIssueMore = aggravatingIssueMore;
        this.monetaryLoss = monetaryLoss;
        this.aggravatingIssueRemarks = aggravatingIssueRemarks;
        this.FIN_Number = FIN_Number;
        this.JobKey = JobKey;
        this.ProbKey = ProbKey;
    }

    /**
     * @return the aggravatingIssue
     */
    public String getAggravatingIssue() {
        return aggravatingIssue;
    }

    /**
     * @param aggravatingIssue the aggravatingIssue to set
     */
    public void setAggravatingIssue(String aggravatingIssue) {
        this.aggravatingIssue = aggravatingIssue;
    }

    /**
     * @return the aggravatingIssueMore
     */
    public String getAggravatingIssueMore() {
        return aggravatingIssueMore;
    }

    /**
     * @param aggravatingIssueMore the aggravatingIssueMore to set
     */
    public void setAggravatingIssueMore(String aggravatingIssueMore) {
        this.aggravatingIssueMore = aggravatingIssueMore;
    }

    /**
     * @return the monetaryLoss
     */
    public String getMonetaryLoss() {
        return monetaryLoss;
    }

    /**
     * @param monetaryLoss the monetaryLoss to set
     */
    public void setMonetaryLoss(String monetaryLoss) {
        this.monetaryLoss = monetaryLoss;
    }

    /**
     * @return the aggravatingIssueRemarks
     */
    public String getAggravatingIssueRemarks() {
        return aggravatingIssueRemarks;
    }

    /**
     * @param aggravatingIssueRemarks the aggravatingIssueRemarks to set
     */
    public void setAggravatingIssueRemarks(String aggravatingIssueRemarks) {
        this.aggravatingIssueRemarks = aggravatingIssueRemarks;
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
     * @return the JobKey
     */
    public String getJobKey() {
        return JobKey;
    }

    /**
     * @param JobKey the JobKey to set
     */
    public void setJobKey(String JobKey) {
        this.JobKey = JobKey;
    }
    
        /**
     * @return the ProbKey
     */
    public String getProbKey() {
        return ProbKey;
    }

    /**
     * @param ProbKey the ProbKey to set
     */
    public void setProbKey(String ProbKey) {
        this.ProbKey = ProbKey;
    }
}
