/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkHistory {
    private String getWorkHow;
    private String  singaporeArrivalDate;
    private String firstJobWhether;
    private String firstJobArrival;
    private String FIN_Number;
    
    
    public WorkHistory(String getWorkHow, String singaporeArrivalDate, String firstJobWhether, String firstJobArrival,String FIN_Number){
        this.getWorkHow = getWorkHow;
        this.singaporeArrivalDate = singaporeArrivalDate;
        this.firstJobWhether = firstJobWhether;
        this.firstJobArrival = firstJobArrival;
        this.FIN_Number = FIN_Number;
    }

    /**
     * @return the getWorkHow
     */
    public String getGetWorkHow() {
        return getWorkHow;
    }

    /**
     * @param getWorkHow the getWorkHow to set
     */
    public void setGetWorkHow(String getWorkHow) {
        this.getWorkHow = getWorkHow;
    }

    /**
     * @return the singaporeArrivalDate
     */
    public String getSingaporeArrivalDate() {
        return singaporeArrivalDate;
    }

    /**
     * @param singaporeArrivalDate the singaporeArrivalDate to set
     */
    public void setSingaporeArrivalDate(String singaporeArrivalDate) {
        this.singaporeArrivalDate = singaporeArrivalDate;
    }

    /**
     * @return the firstJobWhether
     */
    public String getFirstJobWhether() {
        return firstJobWhether;
    }

    /**
     * @param firstJobWhether the firstJobWhether to set
     */
    public void setFirstJobWhether(String firstJobWhether) {
        this.firstJobWhether = firstJobWhether;
    }

    /**
     * @return the firstJobArrival
     */
    public String getFirstJobArrival() {
        return firstJobArrival;
    }

    /**
     * @param firstJobArrival the firstJobArrival to set
     */
    public void setFirstJobArrival(String firstJobArrival) {
        this.firstJobArrival = firstJobArrival;
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
