/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class SalaryRelatedHistory {
    private String salaryComplaint;
    private String salaryPaymentMode;
    private String estimatedTotalValueOfClaim;
    private String estimated12MonthsValueOfClaim;
    private String FIN_Number;
    private String JobKey;
    private String ProbKey;
    
    public SalaryRelatedHistory(String salaryComplaint, String salaryPaymentMode, String estimatedTotalValueOfClaim,String estimated12MonthsValueOfClaim, String FIN_Number, String JobKey, String ProbKey){
        this.salaryComplaint = salaryComplaint;
        this.salaryPaymentMode = salaryPaymentMode;
        this.estimatedTotalValueOfClaim = estimatedTotalValueOfClaim;
        this.estimated12MonthsValueOfClaim = estimated12MonthsValueOfClaim;
        this.FIN_Number = FIN_Number;
        this.JobKey = JobKey;
        this.ProbKey = ProbKey;
    }

    /**
     * @return the salaryComplaint
     */
    public String getSalaryComplaint() {
        return salaryComplaint;
    }

    /**
     * @param salaryComplaint the salaryComplaint to set
     */
    public void setSalaryComplaint(String salaryComplaint) {
        this.salaryComplaint = salaryComplaint;
    }

    /**
     * @return the salaryPaymentMode
     */
    public String getSalaryPaymentMode() {
        return salaryPaymentMode;
    }

    /**
     * @param salaryPaymentMode the salaryPaymentMode to set
     */
    public void setSalaryPaymentMode(String salaryPaymentMode) {
        this.salaryPaymentMode = salaryPaymentMode;
    }

    /**
     * @return the estimatedTotalValueOfClaim
     */
    public String getEstimatedTotalValueOfClaim() {
        return estimatedTotalValueOfClaim;
    }

    /**
     * @param estimatedTotalValueOfClaim the estimatedTotalValueOfClaim to set
     */
    public void setEstimatedTotalValueOfClaim(String estimatedTotalValueOfClaim) {
        this.estimatedTotalValueOfClaim = estimatedTotalValueOfClaim;
    }

    /**
     * @return the estimated12MonthsValueOfClaim
     */
    public String getEstimated12MonthsValueOfClaim() {
        return estimated12MonthsValueOfClaim;
    }

    /**
     * @param estimated12MonthsValueOfClaim the estimated12MonthsValueOfClaim to set
     */
    public void setEstimated12MonthsValueOfClaim(String estimated12MonthsValueOfClaim) {
        this.estimated12MonthsValueOfClaim = estimated12MonthsValueOfClaim;
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
