/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

/**
 *
 * @author nhyupa.2010
 */
public class WorkerContactDetails {
    private String FIN;
    private String sgPhoneNumber;
    private String homeCountryNum;
    private String workerName;
    
    public WorkerContactDetails(String FIN, String workerName, String sgPhoneNumber){
        this.FIN = FIN;
        this.workerName = workerName;
        this.sgPhoneNumber = sgPhoneNumber;
     
    }
    
     public WorkerContactDetails(String FIN, String workerName, String sgPhoneNumber, String homeCountryNum){
        this.FIN = FIN;
        this.workerName = workerName;
        this.sgPhoneNumber = sgPhoneNumber;
        this.homeCountryNum = homeCountryNum;
     
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
     * @return the sgPhoneNumber
     */
    public String getSgPhoneNumber() {
        return sgPhoneNumber;
    }

    /**
     * @param sgPhoneNumber the sgPhoneNumber to set
     */
    public void setSgPhoneNumber(String sgPhoneNumber) {
        this.sgPhoneNumber = sgPhoneNumber;
    }

    /**
     * @return the homeCountryNum
     */
    public String getHomeCountryNum() {
        return homeCountryNum;
    }

    /**
     * @param homeCountryNum the homeCountryNum to set
     */
    public void setHomeCountryNum(String homeCountryNum) {
        this.homeCountryNum = homeCountryNum;
    }

    /**
     * @return the workerName
     */
    public String getWorkerName() {
        return workerName;
    }

    /**
     * @param workerName the workerName to set
     */
    public void setWorkerName(String workerName) {
        this.workerName = workerName;
    }

}
