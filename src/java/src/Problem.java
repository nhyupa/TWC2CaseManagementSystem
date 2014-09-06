/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.Date;

/**
 *
 * @author lee
 */

public class Problem {
    
    private String FIN = null;
    private String ChiefProblem = null;
    private String ChiefProblemDate = null;
    private String ChiefProblemMore = null;
    private String ChiefProblemRemarks = null;
    private String jobKey = null;
    private String probKey = null;
    
    public Problem(){
        
    }
    
    public Problem(String FIN,  String ChiefProblemDate,String ChiefProblem,String ChiefProblemMore, String ChiefProblemRemarks){
        this.FIN = FIN;
         this.ChiefProblemDate = ChiefProblemDate;
        this.ChiefProblem = ChiefProblem;
        this.ChiefProblemMore = ChiefProblemMore;
	this.ChiefProblemRemarks = ChiefProblemRemarks;
        
    }
    
    public Problem(String FIN,  String ChiefProblemDate,String ChiefProblem,String ChiefProblemMore, String ChiefProblemRemarks, String jobKey, String probKey){
        this.FIN = FIN;
         this.ChiefProblemDate = ChiefProblemDate;
        this.ChiefProblem = ChiefProblem;
        this.ChiefProblemMore = ChiefProblemMore;
	this.ChiefProblemRemarks = ChiefProblemRemarks;
        this.jobKey = jobKey;
        this.probKey = probKey;
        
    }

    public Problem(String ProbKey, String chiefProblem, String chiefProblemMore){
        this.probKey = probKey;
        this.ChiefProblem = ChiefProblem;
        this.ChiefProblemMore = ChiefProblemMore;
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
    /**
     * @return the probKey
     */
    public String getProbKey() {
        return probKey;
    }

    /**
     * @param probKey the probKey to set
     */
    public void setProbKey(String probKey) {
        this.probKey = probKey;
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
     * @return the ChiefProblem
     */
    public String getChiefProblem() {
        return ChiefProblem;
    }

    /**
     * @param ChiefProblem to set
     */
    public void setChiefProblem(String ChiefProblem) {
        this.ChiefProblem = ChiefProblem;
    }
 
    /**
     * @return the ChiefProblemMore
     */
    public String getChiefProblemMore() {
        return ChiefProblemMore;
    }

    /**
     * @param ChiefProblemMore to set
     */
    public void setChiefProblemMore(String ChiefProblemMore) {
        this.ChiefProblemMore = ChiefProblemMore;
    }
   
    /**
     * @return the ChiefProblemDate
     */
    public String getChiefProblemDate() {
        return ChiefProblemDate;
    }

    /**
     * @param ChiefProblemDate to set
     */
    public void setChiefProblemDate(String ChiefProblemDate) {
        this.ChiefProblemDate = ChiefProblemDate;
    }

    /**
     * @return the ChiefProblemRemarks
     */
    public String getChiefProblemRemarks() {
        return ChiefProblemRemarks;
    }

    /**
     * @param passApplicationDate the ChiefProblemRemarks to set
     */
    public void setChiefProblemRemarks(String ChiefProblemRemarks) {
        this.ChiefProblemRemarks = ChiefProblemRemarks;
    }

}
