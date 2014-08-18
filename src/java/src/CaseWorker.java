/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class CaseWorker {
    private String leadCaseWorker;
    private String caseWorkerStartDate;
    private String caseWorkerEndDate;
    private String FIN_Number;
    
    public CaseWorker(String leadCaseWorker, String caseWorkerStartDate, String caseWorkerEndDate, String FIN_Number){
        this.leadCaseWorker = leadCaseWorker;
        this.caseWorkerStartDate = caseWorkerStartDate;
        this.caseWorkerEndDate = caseWorkerEndDate;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the leadCaseWorker
     */
    public String getLeadCaseWorker() {
        return leadCaseWorker;
    }

    /**
     * @param leadCaseWorker the leadCaseWorker to set
     */
    public void setLeadCaseWorker(String leadCaseWorker) {
        this.leadCaseWorker = leadCaseWorker;
    }

    /**
     * @return the caseWorkerStartDate
     */
    public String getCaseWorkerStartDate() {
        return caseWorkerStartDate;
    }

    /**
     * @param caseWorkerStartDate the caseWorkerStartDate to set
     */
    public void setCaseWorkerStartDate(String caseWorkerStartDate) {
        this.caseWorkerStartDate = caseWorkerStartDate;
    }

    /**
     * @return the caseWorkerEndDate
     */
    public String getCaseWorkerEndDate() {
        return caseWorkerEndDate;
    }

    /**
     * @param caseWorkerEndDate the caseWorkerEndDate to set
     */
    public void setCaseWorkerEndDate(String caseWorkerEndDate) {
        this.caseWorkerEndDate = caseWorkerEndDate;
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
