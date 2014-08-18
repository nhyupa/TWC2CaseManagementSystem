/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class ChiefProblem {
    private String jobKey;
    private String problemRegDate;
    private String chiefProblem;
    private String otherProblem;
    private String problemRemarks;
    private String FIN_Number;
    
    public ChiefProblem(String jobKey,String problemRegDate, String chiefProblem, String otherProblem, String problemRemarks, String FIN_Number){
        this.jobKey = jobKey;
        this.problemRegDate = problemRegDate;
        this.chiefProblem = chiefProblem;
        this.otherProblem = otherProblem;
        this.problemRemarks = problemRemarks;
        this.FIN_Number = FIN_Number;
    }
    public ChiefProblem(String problemRegDate, String chiefProblem,String FIN_Number){
        this.problemRegDate = problemRegDate;
        this.chiefProblem = chiefProblem;
        this.FIN_Number =  FIN_Number;
    }
    
    public ChiefProblem(String problemRegDate, String chiefProblem, String otherProblem, String problemRemarks,String FIN_Number){
        this.problemRegDate = problemRegDate;
        this.chiefProblem = chiefProblem;
        this.otherProblem = otherProblem;
        this.problemRemarks = problemRemarks;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the problemRegDate
     */
    public String getProblemRegDate() {
        return problemRegDate;
    }

    /**
     * @param problemRegDate the problemRegDate to set
     */
    public void setProblemRegDate(String problemRegDate) {
        this.problemRegDate = problemRegDate;
    }

    /**
     * @return the chiefProblem
     */
    public String getChiefProblem() {
        return chiefProblem;
    }

    /**
     * @param chiefProblem the chiefProblem to set
     */
    public void setChiefProblem(String chiefProblem) {
        this.chiefProblem = chiefProblem;
    }

    /**
     * @return the otherProblem
     */
    public String getOtherProblem() {
        return otherProblem;
    }

    /**
     * @param otherProblem the otherProblem to set
     */
    public void setOtherProblem(String otherProblem) {
        this.otherProblem = otherProblem;
    }

    /**
     * @return the problemRemarks
     */
    public String getProblemRemarks() {
        return problemRemarks;
    }

    /**
     * @param problemRemarks the problemRemarks to set
     */
    public void setProblemRemarks(String problemRemarks) {
        this.problemRemarks = problemRemarks;
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
     * @return the jobKey
     */
    public String getJobKey() {
        return jobKey;
    }

    /**
     * @param jobKey the jobKey to set
     */
    public void setJobKey(String jobKey) {
        this.jobKey = jobKey;
    }
}
