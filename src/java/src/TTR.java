/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class TTR {
    private String ttrUpdateDate;
    private String ttrStatus;
    private String ttrStatusMore;
    private String departureDate;
    private String newEmployerName;
    private String newJob;
    private String ttrRemarks;
    private String FIN_Number;
    
    public TTR(String ttrUpdateDate, String ttrStatus,String ttrStatusMore, String departureDate, String newEmployerName, String newJob, String ttrRemarks,String FIN_Number){
        this.ttrUpdateDate = ttrUpdateDate;
        this.ttrStatus = ttrStatus;
        this.ttrStatusMore = ttrStatusMore;
        this.departureDate = departureDate;
        this.newEmployerName  = newEmployerName;
        this.newJob = newJob;
        this.ttrRemarks = ttrRemarks;
        this.FIN_Number = FIN_Number;
    }
    
    public TTR(String ttrUpdateDate, String ttrStatus,String ttrStatusMore, String departureDate, String newEmployerName,String FIN_Number){
        this.ttrUpdateDate = ttrUpdateDate;
        this.ttrStatus = ttrStatus;
        this.ttrStatusMore = ttrStatusMore;
        this.departureDate = departureDate;
        this.newEmployerName  = newEmployerName;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the ttrUpdateDate
     */
    public String getTtrUpdateDate() {
        return ttrUpdateDate;
    }

    /**
     * @param ttrUpdateDate the ttrUpdateDate to set
     */
    public void setTtrUpdateDate(String ttrUpdateDate) {
        this.ttrUpdateDate = ttrUpdateDate;
    }

    /**
     * @return the ttrStatus
     */
    public String getTtrStatus() {
        return ttrStatus;
    }

    /**
     * @param ttrStatus the ttrStatus to set
     */
    public void setTtrStatus(String ttrStatus) {
        this.ttrStatus = ttrStatus;
    }

    /**
     * @return the departureDate
     */
    public String getDepartureDate() {
        return departureDate;
    }

    /**
     * @param departureDate the departureDate to set
     */
    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    /**
     * @return the newEmployerName
     */
    public String getNewEmployerName() {
        return newEmployerName;
    }

    /**
     * @param newEmployerName the newEmployerName to set
     */
    public void setNewEmployerName(String newEmployerName) {
        this.newEmployerName = newEmployerName;
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
     * @return the ttrStatusMore
     */
    public String getTtrStatusMore() {
        return ttrStatusMore;
    }

    /**
     * @param ttrStatusMore the ttrStatusMore to set
     */
    public void setTtrStatusMore(String ttrStatusMore) {
        this.ttrStatusMore = ttrStatusMore;
    }

    /**
     * @return the newJob
     */
    public String getNewJob() {
        return newJob;
    }

    /**
     * @param newJob the newJob to set
     */
    public void setNewJob(String newJob) {
        this.newJob = newJob;
    }

    /**
     * @return the ttrRemarks
     */
    public String getTtrRemarks() {
        return ttrRemarks;
    }

    /**
     * @param ttrRemarks the ttrRemarks to set
     */
    public void setTtrRemarks(String ttrRemarks) {
        this.ttrRemarks = ttrRemarks;
    }
    
    
}
