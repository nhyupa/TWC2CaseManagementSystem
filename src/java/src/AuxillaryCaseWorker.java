/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class AuxillaryCaseWorker {
    private String auxCaseWorkerName;
    private String auxStartDate;
    private String auxEndDate;
    private String FIN_Number;
    private String JobKey;
    private String ProbKey; 
    
    public AuxillaryCaseWorker(String auxCaseWorkerName,String auxStartDate, String auxEndDate, String FIN_Number){
        this.auxCaseWorkerName = auxCaseWorkerName;
        this.auxStartDate = auxStartDate;
        this.auxEndDate =auxEndDate;
        this.FIN_Number = FIN_Number;
    }
    public AuxillaryCaseWorker(String auxCaseWorkerName, String auxStartDate, String auxEndDate,String FIN_Number, String JobKey, String ProbKey){
        this.auxCaseWorkerName = auxCaseWorkerName;
        this.auxStartDate = auxStartDate;
        this.auxEndDate = auxEndDate;
        this.FIN_Number = FIN_Number;
        this.JobKey = JobKey;
        this.ProbKey = ProbKey;
    }

    /**
     * @return the auxCaseWorkerName
     */
    public String getAuxCaseWorkerName() {
        return auxCaseWorkerName;
    }

    /**
     * @param auxCaseWorkerName the auxCaseWorkerName to set
     */
    public void setAuxCaseWorkerName(String auxCaseWorkerName) {
        this.auxCaseWorkerName = auxCaseWorkerName;
    }

    /**
     * @return the auxStartDate
     */
    public String getAuxStartDate() {
        return auxStartDate;
    }

    /**
     * @param auxStartDate the auxStartDate to set
     */
    public void setAuxStartDate(String auxStartDate) {
        this.auxStartDate = auxStartDate;
    }

    /**
     * @return the auxEndDate
     */
    public String getAuxEndDate() {
        return auxEndDate;
    }

    /**
     * @param auxEndDate the auxEndDate to set
     */
    public void setAuxEndDate(String auxEndDate) {
        this.auxEndDate = auxEndDate;
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
