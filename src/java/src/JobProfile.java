/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.util.Date;

/**
 *
 * @author nhyupa.2010
 */
public class JobProfile {
    
    private String FIN_No = null;
    private String jobKey = null;
    private String employerName = null;
    private String workPassType = null;
    private String workPassMore = null;
    private String jobSector = null;
    private String jobSectorMore = null;
    private String occupation = null;
    private String startDate = null;
    private String endDate = null;
    private String jobWhetherTJS = null;
    private String jobRemarks = null;
    
    
    
    public JobProfile(String jobKey, String employerName){
        this.jobKey = jobKey;
        this.employerName = employerName;
    }
    
    public JobProfile(String FIN_No, String jobKey, String employerName, String workPassType, String workPassMore, String jobSector, String jobSectorMore, String occupation, String startDate, String endDate, String jobWhetherTJS, String jobRemarks){
        
        this.FIN_No = FIN_No;
        this.jobKey = jobKey;
        this.employerName = employerName;
        this.workPassType = workPassType;
        this.workPassMore = workPassMore;
        this.jobSector = jobSector;
        this.jobSectorMore = jobSectorMore;
        this.occupation = occupation;
        this.startDate = startDate;
        this.endDate = endDate;
        this.jobWhetherTJS = jobWhetherTJS;
        this.jobRemarks = jobRemarks;
        
    }
    public JobProfile(String FIN_No,String jobKey,String employerName, String workPassType, String workPassMore,String occupation,String startDate){
        this.FIN_No = FIN_No;
        this.jobKey = jobKey;
        this.employerName = employerName;
        this.workPassType = workPassType;
        this.workPassMore = workPassMore;
        this.occupation = occupation;
        this.startDate = startDate;
    }
    public JobProfile(String FIN_No, String employerName, String workPassType, String jobSector, String occupation, String startDate, String tjs, String remarks){
        this.FIN_No = FIN_No;
        this.employerName = employerName;
        this.workPassType = workPassType;
        this.jobSector = jobSector;
        this.occupation = occupation;
        this.startDate = startDate;
        this.jobWhetherTJS = tjs;
        this.jobRemarks = remarks;
    }
    
    public JobProfile(String FIN_No, String employerName, String workPassType, String workPassMore, String jobSector, String jobSectorMore, String occupation, String startDate, String endDate, String jobWhetherTJS, String jobRemarks){
        
        this.FIN_No = FIN_No;
        this.employerName = employerName;
        this.workPassType = workPassType;
        this.workPassMore = workPassMore;
        this.jobSector = jobSector;
        this.jobSectorMore = jobSectorMore;
        this.occupation = occupation;
        this.startDate = startDate;
        this.endDate = endDate;
        this.jobWhetherTJS = jobWhetherTJS;
        this.jobRemarks = jobRemarks;
        
    }

    /**
     * @return the FIN_No
     */
    public String getFIN_No() {
        return FIN_No;
    }

    /**
     * @param FIN_No the FIN_No to set
     */
    public void setFIN_No(String FIN_No) {
        this.FIN_No = FIN_No;
    }

    /**
     * @return the employerName
     */
    public String getEmployerName() {
        return employerName;
    }

    /**
     * @param employerName the employerName to set
     */
    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    /**
     * @return the workPassType
     */
    public String getWorkPassType() {
        return workPassType;
    }

    /**
     * @param workPassType the workPassType to set
     */
    public void setWorkPassType(String workPassType) {
        this.workPassType = workPassType;
    }

    /**
     * @return the jobSector
     */
    public String getJobSector() {
        return jobSector;
    }

    /**
     * @param jobSector the jobSector to set
     */
    public void setJobSector(String jobSector) {
        this.jobSector = jobSector;
    }

    /**
     * @return the occupation
     */
    public String getOccupation() {
        return occupation;
    }

    /**
     * @param occupation the occupation to set
     */
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    /**
     * @return the startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the jobWhetherTJS
     */
    public String getJobWhetherTJS() {
        return jobWhetherTJS;
    }

    /**
     * @param jobWhetherTJS the jobWhetherTJS to set
     */
    public void setJobWhetherTJS(String jobWhetherTJS) {
        this.jobWhetherTJS = jobWhetherTJS;
    }

    /**
     * @return the jobRemarks
     */
    public String getJobRemarks() {
        return jobRemarks;
    }

    /**
     * @param jobRemarks the jobRemarks to set
     */
    public void setJobRemarks(String jobRemarks) {
        this.jobRemarks = jobRemarks;
    }

    /**
     * @return the workPassMore
     */
    public String getWorkPassMore() {
        return workPassMore;
    }

    /**
     * @param workPassMore the workPassMore to set
     */
    public void setWorkPassMore(String workPassMore) {
        this.workPassMore = workPassMore;
    }

    /**
     * @return the jobSectorMore
     */
    public String getJobSectorMore() {
        return jobSectorMore;
    }

    /**
     * @param jobSectorMore the jobSectorMore to set
     */
    public void setJobSectorMore(String jobSectorMore) {
        this.jobSectorMore = jobSectorMore;
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
